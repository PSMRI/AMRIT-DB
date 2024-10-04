package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class JdbcTemplateConfig {
	
	@Value("${spring.datasource.dbiemr.url}")
    private String dbiemrurl;
	
	@Value("${spring.datasource.dbiemr.username}")
    private String username;
	
	@Value("${spring.datasource.dbiemr.password}")
    private String password;
	
	@Value("${spring.datasource.dbiemr.driver-class-name}")
    private String driverUrl;
	@Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driverUrl);
        dataSource.setUrl(dbiemrurl);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}