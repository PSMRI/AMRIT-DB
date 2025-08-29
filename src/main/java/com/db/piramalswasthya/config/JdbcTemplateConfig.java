package com.db.piramalswasthya.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

@Configuration
public class JdbcTemplateConfig {
	
	@Bean
    public JdbcTemplate dbiemrJdbcTemplate(@Qualifier("dbiemrDataSource") DataSource ds) {
        return new JdbcTemplate(ds);
    }

    @Bean
    public JdbcTemplate dbidentityJdbcTemplate(@Qualifier("dbidentityDataSource") DataSource ds) {
        return new JdbcTemplate(ds);
    }

    @Bean
    public JdbcTemplate dbreportingJdbcTemplate(@Qualifier("dbreportingDataSource") DataSource ds) {
        return new JdbcTemplate(ds);
    }

    @Bean
    public JdbcTemplate db1097identityJdbcTemplate(@Qualifier("db1097identityDataSource") DataSource ds) {
        return new JdbcTemplate(ds);
    }
}