# Netflix Data Engineering Project using dbt, Snowflake & AWS

## Overview

This project demonstrates an end-to-end modern data engineering pipeline built using:

* AWS S3
* Snowflake
* dbt (Data Build Tool)
* Power BI / Tableau / Looker Studio

The project follows an ELT (Extract, Load, Transform) architecture where raw Netflix CSV data is first loaded into Snowflake and then transformed using dbt into analytical models for reporting and business insights.

---

# Architecture

## High-Level Data Flow

```text
Netflix CSV Files
        ↓
Amazon S3
        ↓
Snowflake Raw Layer
        ↓
dbt Transformations
        ↓
Staging Layer
        ↓
Dimension / Fact Models
        ↓
Power BI / Tableau / Looker Studio
```

---

# Tech Stack

| Technology         | Purpose                        |
| ------------------ | ------------------------------ |
| AWS S3             | Raw data storage               |
| Snowflake          | Cloud Data Warehouse           |
| dbt                | Data Transformation & Modeling |
| SQL                | Data Transformation Logic      |
| GitHub             | Version Control                |
| Power BI / Tableau | Reporting & Visualization      |

---

# Project Features

## Data Ingestion

* Netflix CSV datasets uploaded into AWS S3
* Snowflake external/internal staging used for loading
* Raw data loaded into Snowflake RAW schema

---

## dbt Transformations

Implemented layered dbt architecture:

### 1. Staging Layer

* Source cleaning
* Standardized column naming
* Data type conversions
* Null handling
* Deduplication

### 2. Dimensional Layer

* Dimension table creation
* Fact table modeling
* Business transformations
* Analytical aggregations

---

## dbt Snapshots

Implemented snapshot-based historical tracking using:

* SCD Type 2 concepts
* `strategy='timestamp'`
* `invalidate_hard_deletes=true`
* Historical audit tracking

---

## Incremental Models

Used incremental loading to improve performance:

```sql
{{
    config(
        materialized='incremental'
    )
}}
```

Benefits:

* Reduced compute cost
* Faster execution
* Efficient delta processing

---

# Project Structure

```text
netflix_project/
│
├── models/
│   ├── STAGING/
│   ├── dim/
│   └── marts/
│
├── snapshots/
├── macros/
├── seeds/
├── tests/
│
├── dbt_project.yml
├── packages.yml
├── README.md
└── .gitignore
```

---

# Key dbt Concepts Used

* Materializations (View/Table/Incremental)
* Snapshots
* Macros
* Source Configurations
* Jinja Templating
* Surrogate Keys
* Incremental Processing
* Schema Testing
* Data Lineage

---

# Business Use Cases

This project can help analyze:

* User movie ratings
* Popular genres
* User engagement trends
* Watch behavior
* Recommendation insights
* Historical tag changes

---

# Sample dbt Snapshot Logic

```sql
{% snapshot snap_tags %}

{{
    config(
        target_schema='snapshots',
        unique_key='row_key',
        strategy='timestamp',
        updated_at='tag_timestamp',
        invalidate_hard_deletes=true
    )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(
        ['user_id','movie_id']
    ) }} AS row_key,

    user_id,
    movie_id,
    tag,
    CAST(tag_timestamps AS TIMESTAMP_NTZ) AS tag_timestamp

FROM {{ ref('src_tags') }}

{% endsnapshot %}
```

---

# Learning Outcomes

Through this project, I gained hands-on experience with:

* Modern ELT architecture
* Snowflake cloud warehousing
* dbt transformations and snapshots
* Incremental processing
* SCD Type 2 implementation concepts
* Data modeling
* Git & GitHub workflows
* End-to-end analytics engineering



### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
