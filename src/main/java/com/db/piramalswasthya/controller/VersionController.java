/*
* AMRIT – Accessible Medical Records via Integrated Technology 
* Integrated EHR (Electronic Health Records) Solution 
*
* Copyright (C) "Piramal Swasthya Management and Research Institute" 
*
* This file is part of AMRIT.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see https://www.gnu.org/licenses/.
*/
package com.db.piramalswasthya.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST controller exposing application version and build metadata.
 * Provides the /version endpoint which returns Git metadata
 * in a standardized JSON format consistent across all AMRIT APIs.
 *
 * @author Piramal Swasthya
 */
@RestController
public class VersionController {
	private final Logger logger = LoggerFactory.getLogger(VersionController.class);
	
	private static final String UNKNOWN_VALUE = "unknown";

	@GetMapping(value = "/version", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, String>> versionInformation() {
		Map<String, String> response = new LinkedHashMap<>();
		try {
			logger.info("Version controller start");
			Properties gitProperties = loadGitProperties();
			response.put("buildTimestamp", gitProperties.getProperty("git.build.time", UNKNOWN_VALUE));
			response.put("version", gitProperties.getProperty("git.build.version", UNKNOWN_VALUE));
			response.put("branch", gitProperties.getProperty("git.branch", UNKNOWN_VALUE));
			response.put("commitHash", gitProperties.getProperty("git.commit.id.abbrev", UNKNOWN_VALUE));
		} catch (Exception e) {
			logger.error("Failed to load version information", e);
			response.put("buildTimestamp", UNKNOWN_VALUE);
			response.put("version", UNKNOWN_VALUE);
			response.put("branch", UNKNOWN_VALUE);
			response.put("commitHash", UNKNOWN_VALUE);
		}
		logger.info("Version controller end");
		return ResponseEntity.ok(response);
	}

	private Properties loadGitProperties() throws IOException {
		Properties properties = new Properties();
		try (InputStream input = getClass().getClassLoader()
				.getResourceAsStream("git.properties")) {
			if (input != null) {
				properties.load(input);
			}
		}
		return properties;
	}
}
