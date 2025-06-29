# 📊 Stock-Market-ELT

This project is a hands-on implementation of an ELT (Extract, Load, Transform) pipeline built on Google Cloud Platform (GCP) using Terraform for infrastructure as code (IaC). The goal was to get practical experience with cloud services, APIs, data pipelines, and SQL-based data transformations — seeing how everything fits together in a real-world workflow.

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
    

# 🔄 Transformations
# 💡 Reflections
I really enjoyed working on this project and learned a lot in the process. It wasn’t all smooth sailing — I ran into plenty of issues, from Terraform refusing to create a BigQuery dataset to completely breaking my GitHub Codespace and losing part of my work while trying to recover it. But that’s all part of the process. Every bug, misstep, and fix helped me build a better understanding of cloud data workflows and infrastructure as code, moving me closer to my goal of becoming learning more engineering skills.
# 👋 About Me
Hi, I'm Aleks, a Data Automation Specialist with over 3 years of experience working with data and a genuine passion for all things data-related. I’m currently focused on expanding my skills in SQL, data architecture, and Python (Pandas) as part of my continuous learning journey.This project is part of my journey to deepen my technical knowledge and gain hands-on experience with modern data tools and cloud workflows. Along the way, I’ve been building up my familiarity with Python, SQL, GitHub, data modeling, and Cloud Computing, working towards delivering impactful, scalable data solutions in collaborative environments.

🔗 [Let's connect](https://www.linkedin.com/in/aleksandra-petrova-a582351b2/)

# 📚 Resources
- https://cloud.google.com/storage/docs/
- https://chatgpt.com/
- https://financialmodelingprep.com/developer/docs
- https://learn.365datascience.com/

 



