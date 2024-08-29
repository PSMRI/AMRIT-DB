package com.piramalswasthya.db.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
@Configuration
public class DatasourceConfig {
	
	@Value("${spring.datasource.dbiemr.url}")
    private String dbiemrurl;
	
	@Value("${spring.datasource.dbidentity.url}")
    private String dbidentityurl;
	
	@Value("${spring.datasource.dbreporting.url}")
    private String dbreportingurl;
	
	@Value("${spring.datasource.db1097identity.url}")
    private String db1097identityurl;
	
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.dbiemr")
	public DataSource datasource1() {
		return DataSourceBuilder.create().url(dbiemrurl)
				.build();
	}
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.dbidentity")
	public DataSource datasource2() {
		return DataSourceBuilder.create().url(dbidentityurl)
				.build();
	}
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.dbreporting")
	public DataSource datasource3() {
		return DataSourceBuilder.create().url(dbreportingurl)
				.build();
	}
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.db1097identity")
	public DataSource datasource4() {
		return DataSourceBuilder.create().url(db1097identityurl)
				.build();
	}
}
