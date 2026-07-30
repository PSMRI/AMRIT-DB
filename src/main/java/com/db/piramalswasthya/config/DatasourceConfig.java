package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
@Configuration
public class DatasourceConfig {
	
	@Bean
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource.dbiemr")
    public DataSource dbiemrDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.dbidentity")
    public DataSource dbidentityDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.dbreporting")
    public DataSource dbreportingDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.db1097identity")
    public DataSource db1097identityDataSource() {
        return DataSourceBuilder.create().build();
    }
}
