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
package com.db.piramalswasthya.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.db.piramalswasthya.data.FlywaySchemaVersion;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class VersionService {
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	
	public List<FlywaySchemaVersion> getLatestVersion() {
		String sql = "SELECT * FROM flyway_schema_history order by 1 desc limit 1";
        return jdbcTemplate.query(sql, new RowMapper<FlywaySchemaVersion>() {
            @Override
            public FlywaySchemaVersion mapRow(ResultSet rs, int rowNum) throws SQLException {
            	FlywaySchemaVersion history = new FlywaySchemaVersion();
                history.setInstalledRank(rs.getInt("installed_rank"));
                history.setVersion(rs.getString("version"));
                history.setDescription(rs.getString("description"));
                history.setType(rs.getString("type"));
                history.setScript(rs.getString("script"));
                history.setChecksum(rs.getInt("checksum"));
                history.setInstalledBy(rs.getString("installed_by"));
                history.setInstalledOn(rs.getTimestamp("installed_on"));
                history.setExecutionTime(rs.getInt("execution_time"));
                history.setSuccess(rs.getBoolean("success"));
                return history;
            }
        });
    }
}
