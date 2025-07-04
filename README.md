# 📊 Stock-Market-ELT

This project is a hands-on implementation of an **ELT** pipeline built on **GCP** using **Terraform** for infrastructure as code (IaC).  It was designed as a practical exercise to gain experience working with cloud services, APIs, data pipelines, and SQL-based data transformations — connecting the pieces of a real-world workflow.


# 📁 Project Structure
    .
    ├── LICENSE
    ├── README.md
    ├── data
    │   └── companies_data.json
    ├── diagams
    │   └── FMPdiagram.jpg
    ├── requirements.txt
    ├── scripts
    │   ├── big_q_data_to_gold.sql
    │   ├── big_q_data_to_silver.sql
    │   └── initial_data_exploration.ipynb
    ├── terraform
    │   ├── main.tf
    │   ├── sa_key.json
    │   ├── terraform.tfstate
    │   └── terraform.tfstate.backup
    └── test
        └── biq_q_data_validations.sql

# 📌 Workflow
**Bronze Layer**: Raw unstructured JSON files from FMP API loaded to GCS.

**Silver Layer**:  
- Cleans symbols, exchanges, names.
- Uppercases relevant fields.
- Detects forex symbols.
- Adds row IDs and timestamps.

**Gold Layer**:  
- Splits forex vs non-forex companies.
- Summarizes exchanges and symbol counts.
- Flags companies listed on multiple exchanges.


# ⚙️ Tech Stack
  - -Google Cloud Platform (GCP)
      - Cloud Storage — for storing raw JSON files (Bronze Layer)
      - BigQuery — for staging, transforming, and aggregating data (Silver & Gold Layers)
  - Terraform — infrastructure as code (IaC) for managing GCP resources
  - Python (Pandas) — for processing and structuring API response data
  - Financial Modeling Prep [API](https://financialmodelingprep.com/)
  - Notion - for project planning and execution steps
      - [Plan](https://bronzed-ixia-965.notion.site/Project-Stock-Market-ELT-on-Google-Cloud-ELT-Medallion-pipeline-on-GCP-cleanly-structured-into-E-2174a269255a80c88935e46908456432)
    

# 💡 Reflections
I really enjoyed working on this project and learned a lot in the process. It wasn’t all smooth sailing — I ran into plenty of issues, from Terraform refusing to create BigQuery datasets to breaking my GitHub Codespace and having to recover lost work. But every setback turned into a learning opportunity, deepening my understanding of cloud data workflows and infrastructure as code.

One of the biggest takeaways was realizing that you don’t need to be proficient in every single tool or concept to get meaningful results. It’s possible to build useful, working solutions while learning on the go, troubleshooting problems as they come, and improving with each iteration. There’s definitely room to refine and optimize this project, but it achieved its most important goal: gaining hands-on, practical experience and proving that steady progress matters more than perfection.


# 👋 About Me
Hi, I'm Aleks, a Data Automation Specialist with genuine passion for all things data-related. I’m currently focused on expanding my skills in SQL, data architecture, Python and more as part of my continuous learning journey.This project is part of my journey to deepen my technical knowledge and gain hands-on experience with modern data tools and cloud workflows.

🔗 [Let's connect](https://www.linkedin.com/in/aleksandra-petrova-a582351b2/)

# 📚 Resources
- https://cloud.google.com/storage/docs/
- https://chatgpt.com/
- https://financialmodelingprep.com/developer/docs
- https://learn.365datascience.com/

 



