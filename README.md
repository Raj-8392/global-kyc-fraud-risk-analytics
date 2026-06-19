# Global KYC & Fraud Risk Analytics #

## Overview
This project focuses on detecting fraud patterns and KYC risks using SQL-based analytics on customer, account, and transaction datasets.


## Key Features
- Identified top customers by transaction activity
- Detected dormant account transactions (fraud indicator)
- Found customers with pending KYC but high transactions
- Identified geo anomalies (multi-country activity)
- Built a rule-based risk scoring model


## Fraud Detection Techniques
- Structuring detection (smurfing)
- Behavioural anomaly detection
- Dormant account monitoring
- High-value transaction alerts


## Tech Stack
- SQL (Joins, CTEs, Window Functions)
- Data Analysis
- Fraud Risk Modeling


Project Structure 

GLOBAL_KYC_FRAUD_RISK_ANALYTICS/
│
├── datasets/
│   ├── customers.csv          -- Customer master data (KYC details)
│   ├── accounts.csv           -- Account-level details
│   ├── transactions.csv       -- Transaction-level data
│	├── risk_flags.csv			 -- Risk Flags
├── sql/
│   ├── basic_analysis.sql     -- Basic SQL queries (aggregations, joins)
│   ├── fraud_detection.sql    -- Fraud detection queries
│   ├── advanced_risk_models.sql -- Advanced analytics & risk scoring
│
├── docs/
│   ├── problem_statement.md   -- Project objective & business problem
│   ├── data_dictionary.md     -- Description of each dataset column
│
└── README.md                  -- Project overview and documentation


## Key Insights
- High-risk customers often show multi-country transactions
- Dormant accounts with activity are high fraud indicators
- Pending KYC + high transaction volume = compliance risk


## Learning Outcomes
- Advanced SQL query design
- Fraud detection logic implementation
- Risk scoring techniques
- Real-world banking use cases

