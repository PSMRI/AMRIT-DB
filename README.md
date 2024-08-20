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
### Creating Migrations
Flyway migrations are SQL scripts located in the src/main/resources/db/migration directory. Each migration file should be named according to the Flyway convention: V1__Description.sql, V2__Description.sql, etc.

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
