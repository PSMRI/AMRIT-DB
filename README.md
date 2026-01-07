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
- MySQL 8.0 (specifically 8.0.x - versions 8.1+ may cause compatibility issues)  
- Docker Desktop (must be running if using containerized MySQL from AMRIT-DevOps)  

---

## Setup with AMRIT-DevOps  

This repository works in conjunction with [AMRIT-DevOps](https://github.com/PSMRI/AMRIT-DevOps) for complete database setup.  

### Setup Sequence  

```
┌─────────────────────────────────────────────────────────────────┐
│  AMRIT-DevOps/amrit-local-setup (or amrit-docker-setup)         │
│  1. docker-compose up -d                                        │
│  2. Wait 30-60 seconds for MySQL to initialize                  │
└──────────────────────────────┬──────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│  AMRIT-DB (this repository)                                     │
│  3. Configure common_local.properties                           │
│  4. mvn clean install -DENV_VAR=local                           │
│  5. mvn spring-boot:run -DENV_VAR=local                         │
│  6. Wait for migrations to complete, then Ctrl+C                │
└──────────────────────────────┬──────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│  AMRIT-DevOps (return)                                          │
│  7. Load master data (optional)                                 │
│  8. Start application services                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Step-by-Step Instructions  

**Step 1: Start infrastructure in AMRIT-DevOps**  
```bash
# If you haven't already, start Docker infrastructure first
cd AMRIT-DevOps/amrit-local-setup
docker-compose up -d

# Wait for MySQL to initialize (30-60 seconds, longer on first run)
```

**Step 2: Switch to AMRIT-DB and configure**  
```bash
cd ../../AMRIT-DB
cp src/main/environment/common_example.properties src/main/environment/common_local.properties
```

**Step 3: Edit common_local.properties with your credentials**  
```properties
spring.datasource.dbiemr.jdbc-url=jdbc:mysql://localhost:3306/db_iemr
spring.datasource.dbiemr.username=root
spring.datasource.dbiemr.password=1234

spring.datasource.dbidentity.jdbc-url=jdbc:mysql://localhost:3306/db_identity
spring.datasource.dbidentity.username=root
spring.datasource.dbidentity.password=1234

spring.datasource.dbreporting.jdbc-url=jdbc:mysql://localhost:3306/db_reporting
spring.datasource.dbreporting.username=root
spring.datasource.dbreporting.password=1234

spring.datasource.db1097identity.jdbc-url=jdbc:mysql://localhost:3306/db_1097_identity
spring.datasource.db1097identity.username=root
spring.datasource.db1097identity.password=1234
```

**Step 4: Build and run migrations**  
```bash
mvn clean install -DENV_VAR=local
mvn spring-boot:run -DENV_VAR=local
```

**Step 5: Verify and stop**  
Wait for logs showing successful migrations, then press Ctrl+C.  

**Step 6: Return to AMRIT-DevOps**  
```bash
cd ../AMRIT-DevOps/amrit-local-setup
# Continue with data loading or starting services
```

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
   - Go to **Environment** tab and click **Add**.  Set
     ```
     Name : ENV_VAR 
     Value: local
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
   - Add credentials in `common_local.properties`.  

2. **Run Migrations**:  
   - Flyway automatically runs migrations at application startup if configured correctly.  
   - Start the application using:  
     ```bash
     mvn spring-boot:run -DENV_VAR=local
     ```  

---

## Common Issues & Troubleshooting  

### Migration Failures  
- Check SQL syntax and review the `flyway_schema_history` table for errors.  
- Ensure all four databases exist: `db_iemr`, `db_identity`, `db_reporting`, `db_1097_identity`  

### Database Connection Issues  
- Verify details in `common_local.properties`  
- Ensure Docker containers are running: `docker ps`  
- Test MySQL connection: `docker exec mysql-container mysql -uroot -p1234 -e "SELECT 1;"`  

### Docker Desktop Not Running  
If you see connection refused errors, ensure Docker Desktop is running before starting.  

### MySQL Version Compatibility  
Use MySQL 8.0.x specifically. Versions 8.1+ may cause authentication or compatibility issues.  
```bash
mysql --version
# Should show: mysql  Ver 8.0.x
```

### First-Time Setup Slow  
If running for the first time or after a long gap, migrations and Docker image pulls take considerable time (10-30 minutes). This is normal.  

---

## Contributing  

We welcome contributions! Please follow these steps:

Fork the repository.
Create a new feature branch (git checkout -b feature/your-feature).
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature/your-feature).
Open a pull request.
