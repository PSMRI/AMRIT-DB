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

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.db.piramalswasthya.data.FlywaySchemaVersion;
import com.db.piramalswasthya .service.VersionService;
import com.google.gson.Gson;

@RestController

@RequestMapping("/db/migration")
public class VersionController {
	private Logger logger = LoggerFactory.getLogger(VersionController.class);
	
	private VersionService service;
	
	@Autowired
	public void setCommonServiceImpl(VersionService service) {
		this.service = service;
	}

	@GetMapping("/version")
	public String getLatestDBMigrationVersion() throws Exception {
		String resp = null;
		try {
			List<FlywaySchemaVersion> latestVersion = service.getLatestVersion();
			Gson gson = new Gson();
			if (null != latestVersion && !CollectionUtils.isEmpty(latestVersion)) {
				resp = gson.toJson(latestVersion);
			}
		} catch (Exception e) {
			logger.error("Error while getting DB Migration version : {} " , e);
			throw new Exception("Error while getting DB Migration version : {} " + e);
		}
		return resp;
	}

}
