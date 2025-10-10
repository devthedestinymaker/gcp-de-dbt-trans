Complete DBT Prompt for BigQuery Raw to Stage Layer Migration
Project Overview
I need help creating a complete DBT (Data Build Tool) project to migrate employee data from BigQuery raw layer to stage layer with full automation and modularity.

Environment Details
BigQuery Configuration

Project ID: autodataengevo
Source Dataset: Employee_Details_raw
Target Dataset: Employee_Details_staging
Tool: DBT (Data Build Tool)

Source Tables (Raw Layer)
All fields in raw tables are STRING data type:

Department_raw
Employee_raw
EmployeeDepartmentHistory_raw
EmployeePayHistory_raw

Target Tables (Staging Layer)
Tables are already created in BigQuery with proper schemas:
1. Department_staging
json[
  {"name": "DepartmentID", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "Name", "type": "STRING", "mode": "REQUIRED"},
  {"name": "GroupName", "type": "STRING", "mode": "REQUIRED"},
  {"name": "ModifiedDate", "type": "TIMESTAMP", "mode": "NULLABLE"},
  {"name": "stagingIngestionTime", "type": "TIMESTAMP", "mode": "REQUIRED"},
  {"name": "LoadDate", "type": "DATE", "mode": "REQUIRED"}
]
2. Employee_staging
json[
  {"name": "BusinessEntityID", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "NationalIDNumber", "type": "STRING", "mode": "REQUIRED"},
  {"name": "LoginID", "type": "STRING", "mode": "REQUIRED"},
  {"name": "OrganizationNode", "type": "STRING", "mode": "NULLABLE"},
  {"name": "OrganizationLevel", "type": "INTEGER", "mode": "NULLABLE"},
  {"name": "JobTitle", "type": "STRING", "mode": "REQUIRED"},
  {"name": "BirthDate", "type": "DATE", "mode": "REQUIRED"},
  {"name": "MaritalStatus", "type": "STRING", "mode": "REQUIRED"},
  {"name": "Gender", "type": "STRING", "mode": "REQUIRED"},
  {"name": "HireDate", "type": "DATE", "mode": "REQUIRED"},
  {"name": "SalariedFlag", "type": "BOOLEAN", "mode": "REQUIRED"},
  {"name": "VacationHours", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "SickLeaveHours", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "CurrentFlag", "type": "BOOLEAN", "mode": "REQUIRED"},
  {"name": "rowguid", "type": "STRING", "mode": "REQUIRED"},
  {"name": "ModifiedDate", "type": "TIMESTAMP", "mode": "NULLABLE"},
  {"name": "stagingIngestionTime", "type": "TIMESTAMP", "mode": "REQUIRED"},
  {"name": "LoadDate", "type": "DATE", "mode": "REQUIRED"}
]
3. EmployeeDepartmentHistory_staging
json[
  {"name": "BusinessEntityID", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "DepartmentID", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "ShiftID", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "StartDate", "type": "DATE", "mode": "REQUIRED"},
  {"name": "EndDate", "type": "DATE", "mode": "NULLABLE"},
  {"name": "ModifiedDate", "type": "TIMESTAMP", "mode": "NULLABLE"},
  {"name": "stagingIngestionTime", "type": "TIMESTAMP", "mode": "REQUIRED"},
  {"name": "LoadDate", "type": "DATE", "mode": "REQUIRED"}
]
4. EmployeePayHistory_staging
json[
  {"name": "BusinessEntityID", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "RateChangeDate", "type": "TIMESTAMP", "mode": "NULLABLE"},
  {"name": "Rate", "type": "BIGNUMERIC", "mode": "REQUIRED"},
  {"name": "PayFrequency", "type": "INTEGER", "mode": "REQUIRED"},
  {"name": "ModifiedDate", "type": "TIMESTAMP", "mode": "NULLABLE"},
  {"name": "stagingIngestionTime", "type": "TIMESTAMP", "mode": "REQUIRED"},
  {"name": "LoadDate", "type": "DATE", "mode": "REQUIRED"}
]

Technical Requirements
1. Data Transformation

Type Casting: Convert all STRING fields from raw layer to appropriate data types (INTEGER, DATE, TIMESTAMP, BOOLEAN, BIGNUMERIC) in staging layer
Full Load: Load all data from raw to staging (replace existing data)

2. Audit Columns (Auto-populate)
Every staging table must automatically include:

stagingIngestionTime → CURRENT_TIMESTAMP()
LoadDate → CURRENT_DATE()

3. Code Standards

✅ Fully modular - Reusable code components
✅ Fully automated - No manual intervention needed
✅ Simple & understandable - Clear, well-commented code
✅ Production-ready - Best practices followed
✅ DRY principle - Don't repeat yourself


Deliverables Needed
1. Complete DBT Project Structure
Provide the full folder structure with all necessary files:
dbt_project/
├── dbt_project.yml
├── profiles.yml (example)
├── models/
├── macros/
├── tests/
└── etc.
2. Configuration Files

dbt_project.yml - Project configuration
profiles.yml - Connection configuration (example template)
Source definitions for raw tables
Schema YAML files

3. DBT Models
For each of the 4 tables, provide:

Staging model SQL files with proper type casting
Reusable macros for audit columns
Schema definitions with tests

4. Step-by-Step Implementation Guide

How to set up the project
How to configure BigQuery connection
How to run the models
How to test the pipeline
How to schedule/automate

5. Detailed Explanations
For every file and code block, explain:

What it does
Why it's structured that way
How the automation works
Best practices applied


Specific Challenges to Address

Type Casting: How to elegantly handle STRING → specific type conversions (especially for BOOLEAN, DATE, TIMESTAMP, BIGNUMERIC)?
Modularity: How to avoid repeating audit column logic across all 4 models?
Reusability: Can we create a macro or template that works for all staging tables?
Error Handling: What happens if data types don't cast properly?
Testing: What tests should be included to ensure data quality?
Materialization: Should these be tables, views, or incremental models?


Expected Output Format
Please provide:

✅ Complete folder structure (visual tree)
✅ All configuration files with full code
✅ All 4 staging model SQL files with full code
✅ Any macros needed for modularity
✅ Schema YAML with source and model definitions
✅ Clear explanations for each component
✅ Step-by-step setup and execution instructions
✅ Command examples to run the pipeline


Success Criteria
The solution should:

✅ Load data from all 4 raw tables to staging tables
✅ Properly cast STRING data to correct types
✅ Automatically add audit columns
✅ Be fully automated (single command to run)
✅ Be maintainable and scalable
✅ Include proper documentation
✅ Follow DBT and SQL best practices


Beginner-Friendly: Please explain concepts clearly as if teaching someone new to DBT, but provide production-ready code that follows industry best practices.