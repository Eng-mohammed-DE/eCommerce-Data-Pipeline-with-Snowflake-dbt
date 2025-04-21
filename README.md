# eCommerce-Data-Pipeline-with-Snowflake-dbt
eCommerce data pipeline using Snowflake and dbt. Ingested raw CSVs, cleaned and transformed data with dbt models, and created analytics-ready datasets in the marts schema to enable faster insights and reporting.

---

## ⬅️ Data Ingestion Process

- 📤 **CSV files uploaded** to the Snowflake staging area.
- 🧱 **Snowflake tables created** for essential eCommerce entities:
  - Customers
  - Orders
  - Products
  - Payments

---

## 🔧 Data Transformation with dbt

- 🧹 **Data Cleaning & Enrichment** using dbt models.
- ❌ **Critical error removal** and null value filtering.
- 🔗 **Data joins** to combine insights across entities.
- ✅ **Tested and version-controlled** transformation logic.

---

## 📊 Analysis & Reporting

- 📌 Executed **SQL queries** for business insights.
- 🧠 Prepared analytics-ready datasets in the `marts` schema.
- 🧾 Enabled powerful reporting and dashboarding downstream.

---

## 💼 Business Impact

- 🚀 **Streamlined end-to-end pipeline** from ingestion to analytics.
- 📈 Empowered **real-time decision-making** for eCommerce strategy.
- 💡 Enabled scalable, consistent, and reproducible data transformations.

---

## 🛠️ Technologies Used

| Tool        | Purpose                            |
|-------------|------------------------------------|
| Snowflake   | Cloud data warehouse               |
| dbt         | Data transformation & modeling     |
| SQL         | Data querying & analysis           |

---

## 📌 Getting Started

### Prerequisites
- Snowflake account
- Python & dbt installed
- Access to raw CSV data

### Setup Steps
1. Upload your CSV files to the Snowflake staging area.
2. Create necessary Snowflake tables (DDL scripts included in `dbt_project/seeds` if applicable).
3. Initialize and run your dbt project:
   ```bash
   cd dbt_project
   dbt run
   dbt test
