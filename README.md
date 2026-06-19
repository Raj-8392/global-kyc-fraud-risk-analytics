# Global KYC & Fraud Risk Analytics #

## Overview
This project analyzes banking datasets (customers, accounts, and transactions) to detect fraud patterns and KYC compliance risks using SQL.

It simulates real-world fraud detection scenarios used in banking and financial institutions.


## Key Features
- Identified top customers by transaction activity
- Detected dormant account transactions (fraud indicator)
- Found customers with pending KYC but high transactions
- Identified geo anomalies (multi-country activity)
- Built a rule-based risk scoring model


## Fraud Detection Use Cases
- Dormant accounts performing transactions
- Structured transactions (smurfing detection)
- High-risk customers with large transaction volumes
- Multi-country transaction patterns
- Pending KYC customers with high activity

## Tech Stack
- SQL (Joins, Aggregations, CTEs, Window Functions)
- Data Analysis
- Fraud Risk Modeling

**Project Structure **

GLOBAL_KYC_FRAUD_RISK_ANALYTICS/
│
├── datasets/
│   ├── customers.csv          -- Customer master data (KYC details)
│   ├── accounts.csv           -- Account-level details
│   ├── transactions.csv       -- Transaction-level data
│	  ├── risk_flags.csv			   -- Risk Flags
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
- Customers with transactions across multiple countries are potential fraud risks
- Dormant accounts with activity indicate suspicious behavior
- High transaction volumes combined with pending KYC represent compliance risks



## Learning Outcomes
- Hands-on experience with advanced SQL queries
- Understanding of fraud detection techniques
- Implementation of risk scoring logic
- Real-world banking analytics simulation

