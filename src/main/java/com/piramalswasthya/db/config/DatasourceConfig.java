package com.piramalswasthya.db.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
@Configuration
public class DatasourceConfig {
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.dbiemr")
	public DataSource datasource1() {
		return DataSourceBuilder.create().build();
	}
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.dbidentity")
	public DataSource datasource2() {
		return DataSourceBuilder.create().build();
	}
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.dbreporting")
	public DataSource datasource3() {
		return DataSourceBuilder.create().build();
	}
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.db1097identity")
	public DataSource datasource4() {
		return DataSourceBuilder.create().build();
	}
}
