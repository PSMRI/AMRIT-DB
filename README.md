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

This service utilizes Flyway, a powerful database migration tool, within a Spring Boot application to clone an empty database tables. 
It is designed to help developers quickly setup their local environment by ensuring that the database structure is consistent and up-to-date with the application requirement.


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
MySQL 8

### Creating Migrations

Flyway migrations are SQL scripts located in the src/main/resources/db/migration directory, which contains four subfolders, each corresponding for four given schemas.

Any additions or modifications related to a schema should be placed in the appropriate folder.

For example, if there are changes to the db_iemr schema, the relevant script should be added to the dbiemr folder.

Each migration file must adhere to the Flyway naming convention, which follows an incremental format: for example, V1__Description.sql, V2__ColumnAddition.sql.

The next added migration file should be named V3__<related_change_description>.sql.

 ### Creating a build configuration in STS / Eclipse

* You can copy `common_example.properties` to `common_local.properties` and edit the file accordingly. The file is under `src/main/environment` folder.
* In your editor, click on Run -> Run configuration.
* Double-click on Maven build and give a suitable name for the new configuration.
* Populate the base directory by clicking on workspace and selecting AMRIT-DB module.
* Set goals to clean install -DENV_VAR=local(your choice of desired environment) and click on Apply. 
* It is advisable have a personal environment properties file under src/main/environment filling out all the placeholders to avoid repetitive manual work each time you run locally.
* Click Run to run the build configuration.

### Creating a run configuration in STS / Eclipse

* In your editor, click on Run -> Run configuration.
* Double click on Spring Boot App(in STS) / Java Application(in Eclipse) and give a suitable name for the new configuration.
* Select the project and main class and click on Apply.
* Click Run to run the configuration. Keep the Redis server open during this run.
* Once the run is complete, load http://localhost:8080/swagger-ui.html#!/
  
### Run Migrations

* Give Database credentials in application.properties
* Flyway automatically run migrations at application startup if you have configured it properly.
* To start the application follow below commands
*   cd /path/to/your/project
    mvn spring-boot:run -DENV_VAR=local

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
