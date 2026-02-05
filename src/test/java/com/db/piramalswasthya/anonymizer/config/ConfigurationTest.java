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

package com.db.piramalswasthya.anonymizer.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for configuration loading
 */
class ConfigurationTest {
    
    @Test
    void testLoadAnonymizerConfig() throws Exception {
        String yaml = """
            source:
              host: db-replica.example.com
              port: 3306
              schemas:
                - db_identity
                - db_iemr
              username: readonly_user
              password: test_password
              readOnly: true
            
            target:
              host: uat-db.example.com
              port: 3306
              schemas:
                - db_identity
                - db_iemr
              username: write_user
              password: test_password
            
            safety:
              enabled: true
              allowedHosts:
                - db-replica.example.com
              requireExplicitApproval: true
              approvalFlag: TEST_FLAG
            
            performance:
              batchSize: 1000
              fetchSize: 1000
            
            rulesFile: rules.yaml
            loggingPath: ./logs
            """;
        
        Path tempFile = Files.createTempFile("config", ".yaml");
        Files.writeString(tempFile, yaml);
        
        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        AnonymizerConfig config = mapper.readValue(tempFile.toFile(), AnonymizerConfig.class);
        
        assertNotNull(config);
        assertEquals("db-replica.example.com", config.getSource().getHost());
        assertEquals(3306, config.getSource().getPort());
        assertNotNull(config.getSource().getSchemas());
        assertEquals(2, config.getSource().getSchemas().size());
        assertTrue(config.getSource().getSchemas().contains("db_identity"));
        assertTrue(config.getSource().isReadOnly());
        
        assertTrue(config.getSafety().isEnabled());
        assertEquals(1, config.getSafety().getAllowedHosts().size());
        
        assertEquals(1000, config.getPerformance().getBatchSize());
        
        Files.deleteIfExists(tempFile);
    }
    
    @Test
    void testLoadAnonymizationRules() throws Exception {
        String yaml = """
            rulesVersion: "2.0.0"
            schemaHint: "db_identity-2024-Q4"
            unknownColumnPolicy: WARN
            
            databases:
              db_identity:
                tables:
                  m_beneficiaryregidmapping:
                    primaryKey: BenRegID
                    columns:
                      BenRegID:
                        strategy: HMAC_HASH
                        description: Beneficiary registration ID
                      FirstName:
                        strategy: HMAC_HASH
                        description: Patient first name
            """;
        
        Path tempFile = Files.createTempFile("rules", ".yaml");
        Files.writeString(tempFile, yaml);
        
        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        AnonymizationRules rules = mapper.readValue(tempFile.toFile(), AnonymizationRules.class);
        
        assertNotNull(rules);
        assertEquals("2.0.0", rules.getRulesVersion());
        assertEquals("db_identity-2024-Q4", rules.getSchemaHint());
        assertEquals(AnonymizationRules.UnknownColumnPolicy.WARN, rules.getUnknownColumnPolicy());
        
        assertNotNull(rules.getDatabases());
        assertTrue(rules.getDatabases().containsKey("db_identity"));
        
        AnonymizationRules.DatabaseRules dbRules = rules.getDatabases().get("db_identity");
        assertTrue(dbRules.getTables().containsKey("m_beneficiaryregidmapping"));
        
        AnonymizationRules.TableRules tableRules = dbRules.getTables().get("m_beneficiaryregidmapping");
        assertEquals("BenRegID", tableRules.getPrimaryKey());
        assertTrue(tableRules.getColumns().containsKey("BenRegID"));
        
        AnonymizationRules.ColumnRule columnRule = tableRules.getColumns().get("BenRegID");
        assertEquals("HMAC_HASH", columnRule.getStrategy());
        
        Files.deleteIfExists(tempFile);
    }
}
