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

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.db.piramalswasthya.service.SchemaVersionService;

@RestController
@RequestMapping("/db/migration")
public class VersionController {

	private final SchemaVersionService schemas;

	public VersionController(SchemaVersionService schemas) {
		this.schemas = schemas;
	}

	/** The applied Flyway version of every schema, e.g. {"db_iemr":"135","db_identity":"32",...}. */
	@GetMapping("/version")
	public Map<String, String> getVersions() {
		return schemas.versions();
	}
}
