# AMRIT - DB Service
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)  ![branch parameter](https://github.com/PSMRI/Amrit-DB/actions/workflows/sast-and-package.yml/badge.svg)
Overview
This repository demonstrates how to integrate Flyway for database version control in a Spring Boot application. Flyway is a powerful tool that handles database migrations, ensuring that your database schema is kept in sync across different environments.

### Table of Contents
* Introduction
* Prerequisites
* Creating Migrations
* Common Issues & Troubleshooting
* Contributing
  
### Introduction
Flyway is a database migration tool that allows you to apply version control to your database. In this repository, we show you how to configure Flyway in a Spring Boot project, create and apply migrations, and maintain a consistent database schema.

### Prerequisites
Before you start, ensure you have the following installed:

Java 17
Maven 3.6+ or Gradle 6+
Spring Boot 3.2.2+
A Relational Database (e.g., MySQL, PostgreSQL)
### Configure Database Connection
Configure your database connection in application.properties or application.yml. Here’s an example for application.properties:

spring.datasource.url=jdbc:mysql://localhost:3306/your_database
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

### Initial Migration Scripts
Created a directory src/main/resources/db/migration in project. Placed initial Flyway migration scripts in this directory. 
The scripts names: V1__DB_IEMR.sql, V2__DB_IDENTITY.sql, V3__DB_REPORTING.sql.
### Creating Migrations
Flyway migrations are SQL scripts located in the src/main/resources/db/migration directory. Each migration file should be named according to the Flyway convention: V1__Description.sql, V2__Description.sql, etc.

### Running Migrations
Spring Boot will automatically run Flyway migrations on application startup. To apply the migrations, simply start your Spring Boot application.

### Verifying Migration
To verify the migrations have been applied, you can check the Flyway schema history table in your database (typically named flyway_schema_history). This table records the status of applied migrations.

### Common Issues & Troubleshooting
* Migration Failure : Check your SQL syntax and review the flyway_schema_history table for issues.
* Database Connection Issues: Verify the connection details in application.properties.

### Contributing
We welcome contributions! Please follow these steps:

Fork the repository.
Create a new feature branch (git checkout -b feature/your-feature).
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature/your-feature).
Open a pull request.
