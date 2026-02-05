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
                        strategy: HASH
                        dataType: BIGINT
                        piiLevel: CRITICAL
                      FirstName:
                        strategy: FAKE_NAME
                        dataType: VARCHAR
                        piiLevel: HIGH
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
        assertEquals("HASH", columnRule.getStrategy());
        assertEquals("BIGINT", columnRule.getDataType());
        
        Files.deleteIfExists(tempFile);
    }
}
