package com.db.piramalswasthya.anonymization.registry;

import com.db.piramalswasthya.anonymization.exception.AnonymizationException;
import com.db.piramalswasthya.anonymization.model.AnonymizationRegistry;
import com.db.piramalswasthya.anonymization.model.AnonymizationRegistry.ColumnRegistry;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import jakarta.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class AnonymizationRegistryService {
    
    private static final Logger log = LoggerFactory.getLogger(AnonymizationRegistryService.class);
    @Value("${anonymization.registry.file:classpath:anonymization-registry.yml}")
    private Resource registryFile;
    
    @Getter
    private AnonymizationRegistry registry;
    
    private final ObjectMapper yamlMapper;
    private final ObjectMapper jsonMapper;
    
    public AnonymizationRegistryService() {
        this.yamlMapper = new ObjectMapper(new YAMLFactory());
        this.yamlMapper.findAndRegisterModules();
        this.jsonMapper = new ObjectMapper();
        this.jsonMapper.findAndRegisterModules();
    }
    
    @PostConstruct
    public void loadRegistry() throws AnonymizationException {
        try {
            log.info("Loading anonymization registry from: {}", registryFile.getFilename());
            
            String filename = registryFile.getFilename();
            
            if (filename != null && filename.endsWith(".yml")) {
                registry = yamlMapper.readValue(registryFile.getInputStream(), AnonymizationRegistry.class);
            } else if (filename != null && filename.endsWith(".json")) {
                registry = jsonMapper.readValue(registryFile.getInputStream(), AnonymizationRegistry.class);
            } else {
                throw new AnonymizationException("Unsupported registry file format: " + filename);
            }
            
            log.info("Registry loaded successfully - Version: {}, Databases: {}", 
                registry.getVersion(), registry.getDatabases().size());
            
        } catch (Exception e) {
            throw new AnonymizationException("Failed to load anonymization registry", e);
        }
    }
    
    public ColumnRegistry getColumnRule(String databaseName, String tableName, String columnName) {
        if (registry == null || registry.getDatabases() == null) {
            return null;
        }
        
        var dbRegistry = registry.getDatabases().get(databaseName);
        if (dbRegistry == null) {
            return null;
        }
        
        var tableRegistry = dbRegistry.getTables().get(tableName);
        if (tableRegistry == null) {
            return null;
        }
        
        return tableRegistry.getColumns().get(columnName);
    }
    
    public List<ColumnRegistry> getTableRules(String databaseName, String tableName) {
        if (registry == null || registry.getDatabases() == null) {
            return List.of();
        }
        
        var dbRegistry = registry.getDatabases().get(databaseName);
        if (dbRegistry == null) {
            return List.of();
        }
        
        var tableRegistry = dbRegistry.getTables().get(tableName);
        if (tableRegistry == null) {
            return List.of();
        }
        
        return tableRegistry.getColumns().values().stream()
            .filter(col -> col.getAnonymizationRule() != null && !col.getAnonymizationRule().equals("PRESERVE"))
            .collect(Collectors.toList());
    }
    
    public Map<String, List<ColumnRegistry>> getDatabaseRules(String databaseName) {
        if (registry == null || registry.getDatabases() == null) {
            return Map.of();
        }
        
        var dbRegistry = registry.getDatabases().get(databaseName);
        if (dbRegistry == null) {
            return Map.of();
        }
        
        Map<String, List<ColumnRegistry>> result = new HashMap<>();
        
        dbRegistry.getTables().forEach((tableName, tableRegistry) -> {
            List<ColumnRegistry> columns = tableRegistry.getColumns().values().stream()
                .filter(col -> col.getAnonymizationRule() != null && !col.getAnonymizationRule().equals("PRESERVE"))
                .collect(Collectors.toList());
            
            if (!columns.isEmpty()) {
                result.put(tableName, columns);
            }
        });
        
        return result;
    }
    
    public int getTotalRulesCount() {
        if (registry == null || registry.getDatabases() == null) {
            return 0;
        }
        
        return registry.getDatabases().values().stream()
            .mapToInt(db -> db.getTables().values().stream()
                .mapToInt(table -> (int) table.getColumns().values().stream()
                    .filter(col -> col.getAnonymizationRule() != null && !col.getAnonymizationRule().equals("PRESERVE"))
                    .count())
                .sum())
            .sum();
    }
}
