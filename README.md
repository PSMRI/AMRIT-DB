# AMRIT - DB Service
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Overview  
The AMRIT-DB service is a Spring Boot application designed to simplify database schema management and cloning. Using Flyway for migrations, it ensures consistency and ease in setting up local environments, making it an invaluable tool for developers.

---

## Table of Contents  
- [Introduction](#introduction)  
- [Key Features](#key-features)  
- [Prerequisites](#prerequisites)  
- [Creating Migrations](#creating-migrations)  
- [Build Configuration](#build-configuration)  
- [Run Configuration](#run-configuration)  
- [Running Migrations](#running-migrations)  
- [Common Issues & Troubleshooting](#common-issues--troubleshooting)  
- [Contributing](#contributing)  

---

## Introduction  

The AMRIT-DB service leverages Flyway within a Spring Boot framework to manage and clone empty database schema tables. It ensures that database structures remain consistent with application requirements, reducing setup time and preventing discrepancies.  

---

## Key Features  

- **Schema Management**: Automates database schema creation and version control using Flyway.  
- **Migration Scripts**: Supports SQL-based migration scripts for defining tables, constraints, and relationships.  

### Mandatory Database  

Ensure the following databases are created:  

- `db_iemr`  
- `db_reporting`  
- `db_identity`  
- `db_1097_identity`  

---

## Prerequisites  

Ensure you have the following installed before starting:  

- Java 17  
- Maven 3.6+  
- MySQL 8  

---

## Creating Migrations  

Flyway migrations are stored in the `src/main/resources/db/migration` directory. Each schema has its own subfolder.  

- Place new or updated migration scripts in the corresponding schema folder.  
- Follow Flyway’s naming convention:  
  - Example: `V1__InitialSetup.sql`, `V2__AddNewColumn.sql`  

For subsequent changes, increment the version number, e.g., `V3__<description>.sql`.  

---

## Build Configuration  

1. **Setup Local Properties**:  
   - Copy `common_example.properties` to `common_local.properties` and update it for your environment.  
   - File location: `src/main/environment`  

2. **Create Build Configuration in STS/Eclipse**:  
   - Go to **Run > Run Configurations**.  
   - Select **Maven Build** and create a new configuration.  
   - Set the **Base Directory** to the `AMRIT-DB` module.  
   - Set **Goals** to:  
     ```
     clean install -DENV_VAR=local
     ```  
   - Apply and run the configuration.  

---

## Run Configuration  

1. **Setup Spring Boot Configuration**:  
   - Go to **Run > Run Configurations**.  
   - Select **Spring Boot App (STS)** or **Java Application (Eclipse)** and create a new configuration.  
   - Choose the project and main class.  
   - Apply and run the configuration.  

2. **Verify Application**:  
   - Access Swagger UI: [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)  

---

## Running Migrations  

1. **Database Credentials**:  
   - Add credentials in `application.properties`.  

2. **Run Migrations**:  
   - Flyway automatically runs migrations at application startup if configured correctly.  
   - Start the application using:  
     ```bash
     mvn spring-boot:run -DENV_VAR=local
     ```  

---

## Common Issues & Troubleshooting  

- **Migration Failures**:  
  - Check SQL syntax and review the `flyway_schema_history` table for errors.  

- **Database Connection Issues**:  
  - Verify details in `application.properties`.  

---

## Contributing  

We welcome contributions! Please follow these steps:

Fork the repository.
Create a new feature branch (git checkout -b feature/your-feature).
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature/your-feature).
Open a pull request.
