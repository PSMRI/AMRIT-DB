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
package com.piramalswasthya.db.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.piramalswasthya.db.data.FlywaySchemaVersion;
import com.piramalswasthya.db.service.VersionService;

@RestController
@RequestMapping("/db/migration")
public class VersionController {
	private Logger logger = LoggerFactory.getLogger(VersionController.class);
	@Autowired
	private VersionService service;
	
	@GetMapping("/version")
	public String getLatestDBMigrationVersion(@RequestParam("database") String database) throws Exception {
		String resp = null;
		try {
			if(null!=database) {
			List<FlywaySchemaVersion> latestVersion = service.getLatestVersion(database);
			Gson gson = new Gson();
			if (null != latestVersion && !CollectionUtils.isEmpty(latestVersion)) {
				resp = gson.toJson(latestVersion);
			}
			}
		} catch (Exception e) {
			logger.error("Error while getting DB Migration version {}: ", e.getMessage(), e);
			throw new Exception("Error while getting DB Migration version: " + e.getMessage(), e);
		}
		return resp;
	}

}
