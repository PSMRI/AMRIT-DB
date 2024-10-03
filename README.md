# AMRIT - DB Service
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)  ![branch parameter](https://github.com/PSMRI/AMRIT-DB/actions/workflows/sast-and-package.yml/badge.svg)

### Overview
This AMRIT-DB spring boot service provides a robust solution for managing and cloning empty database schema tables, making it an invaluable tool for developers looking to maintain consistency in their development environments.

### Table of Contents
* Introduction
* Key Features
* Prerequisites
* Creating Migrations
* Common Issues & Troubleshooting
* Contributing
  
### Introduction
This AMRIT-DB spring boot service provides a robust solution for managing and cloning empty database schema tables, making it an invaluable tool for developers looking to maintain consistency in their development environments.

This service utilizes Flyway, a powerfull database migration tool, within a spring boot application to clone an empty database tables. It is designed to help developers quickly setup their local environment by ensuring that the databse structure is consistent and up-to-date with the application requirement.

### Key Features

**Schema Management**: Flyway automates the process of creating and managing the database tables allowing for easy version control of database changes.

**Migration Scripts** : The service can include SQL migration scripts that define the structure of the database tables, constraints, and relationships, ensuring that schema is created exactly as needed.

Below are the mandatory schemas you should create.

 * db_iemr
 
 * db_reporting
 
 * db_identity
 
 * db_1097_identity

### Prerequisites
Before you start, ensure you have the following installed:

Java 17
Maven 3.6+
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

### Run Migrations
* Give Database credentials in application.properties
* Flyway automatically run migrations at application startup if you have configured it properly.

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
