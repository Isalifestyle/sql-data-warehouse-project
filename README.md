# 📖 Project Overview

This project demonstrates the design and implementation of a **modern data warehouse** using the **Medallion Architecture (Bronze, Silver, and Gold layers)**. It covers the complete data engineering workflow, from ingesting raw data to producing analytics-ready datasets for business intelligence and reporting.

## 🔑 Key Components

### 🏗️ Data Architecture
- Design a scalable data warehouse using the **Medallion Architecture**
  - **Bronze Layer** – Raw data ingestion
  - **Silver Layer** – Data cleansing and transformation
  - **Gold Layer** – Business-ready analytical models

### 🔄 ETL Pipelines
- Extract data from multiple source systems
- Transform and cleanse raw datasets
- Load curated data into the data warehouse

### 📊 Data Modeling
- Build **fact** and **dimension** tables
- Design a **star schema** optimized for analytical queries
- Create scalable and maintainable data models

### 📈 Analytics & Reporting
- Develop SQL-based analytical queries
- Create business reports and dashboards
- Deliver actionable insights for decision-making

---

# 🎯 Skills Demonstrated

This project showcases practical experience in:

- SQL Development
- Data Engineering
- Data Architecture
- ETL Pipeline Development
- Data Warehousing
- Data Modeling
- Business Intelligence (BI)
- Data Analytics

# 🚀 Project Requirements

## Data Engineering

### Objective

Develop a modern SQL Server data warehouse that consolidates ERP and CRM sales data into a single analytical platform.

### Specifications

- Import data from two source systems (ERP and CRM)
- Load source data from CSV files
- Clean and standardize inconsistent data
- Resolve data quality issues
- Integrate both systems into a unified analytical model
- Focus on the latest available dataset (no historization)
- Document the warehouse structure for technical and business users

---

## Business Intelligence & Analytics

### Objective

Develop SQL-based analytics to provide insights into:

- 👥 Customer Behavior
- 📦 Product Performance
- 📈 Sales Trends

These reports enable stakeholders to make informed, data-driven business decisions.

---

# 📁 Repository Structure

```text
data-warehouse-project/
│
├── datasets/                           # Raw ERP and CRM datasets (CSV files)
│
├── docs/                               # Documentation and architecture
│   ├── etl.drawio                      # ETL process diagrams
│   ├── data_architecture.drawio        # Overall warehouse architecture
│   ├── data_catalog.md                 # Dataset metadata and descriptions
│   ├── data_flow.drawio                # Data flow diagrams
│   ├── data_models.drawio              # Star schema and data models
│   └── naming-conventions.md           # Naming standards
│
├── scripts/                            # SQL scripts
│   ├── bronze/                         # Raw data ingestion
│   ├── silver/                         # Data cleansing and transformation
│   └── gold/                           # Business-ready analytical models
│
├── tests/                              # Data validation and quality tests
│
├── README.md                           # Project documentation
├── LICENSE                             # License information
├── .gitignore                          # Git ignored files
└── requirements.txt                    # Project dependencies
```

---

# 🔄 Project Workflow

```text
             ERP CSV Files
                  │
                  ▼
             CRM CSV Files
                  │
                  ▼
        ┌──────────────────────┐
        │    Bronze Layer      │
        │  Raw Data Ingestion  │
        └──────────────────────┘
                  │
                  ▼
        ┌──────────────────────┐
        │    Silver Layer      │
        │ Data Cleaning & ETL  │
        └──────────────────────┘
                  │
                  ▼
        ┌──────────────────────┐
        │     Gold Layer       │
        │ Fact & Dimension     │
        │      Tables          │
        └──────────────────────┘
                  │
                  ▼
     SQL Analytics • Dashboards • Reports
```

---

# ⭐ Project Highlights

- End-to-end SQL data warehouse implementation
- Medallion Architecture (Bronze → Silver → Gold)
- Complete ETL pipeline development
- Data quality validation and cleansing
- Star schema dimensional modeling
- SQL analytics for business intelligence
- Well-documented and production-style project structure
