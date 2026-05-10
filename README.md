# etl-medallion-architecture

##  Overview
Built a data warehouse solution using SQL Server and CSV files, implementing a **Medallion Architecture** (Bronze, Silver, Gold layers). The project focuses on end-to-end ETL development, data modeling, and analytics-ready datasets.

---

## What is Medallion Architecture?
— **Medallion Architecture is a well-known data engineering pattern**, widely used in modern data platforms.

It refers to a **data warehouse structured into 3 layers**:

- 🥉 **Bronze layer**: raw data ingested from source files (CSV, APIs, logs)
- 🥈 **Silver layer**: cleaned, standardized, and transformed data
- 🥇 **Gold layer**: business-ready data used for reporting and analytics

This approach is widely used in modern data engineering and is popularized by platforms such as Databricks.

---

## Project Workflow
- Data ingestion from CSV files  
- ETL pipeline development using SQL Server  
- Data cleaning and transformation (Silver layer)  
- Business aggregation and KPI modeling (Gold layer)  
- Analytics-ready datasets for reporting  

---

## Repository Structure
