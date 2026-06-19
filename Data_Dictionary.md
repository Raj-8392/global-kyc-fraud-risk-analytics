Table Details
1. [dbo].[CUSTOMERS]

- customer_id → Unique customer identifier
- full_name → Customer name
- kyc_status → KYC completion status (Pending/Completed)
- risk_category → Predefined risk (Low/Medium/High)

2. [dbo].[ACCOUNTS]
- account_id → Unique account number
- account_status → Active/Dormant/Suspended
- balance → Current balance

3. [dbo].[TRANSACTIONS]
- txn_id → Transaction ID
- txn_amount → Transaction value
- country → Transaction location
- channel → ATM/Online/Branch

4. [dbo].[RISK_FLAGS]
- flag_id → Unique ID
- severity → severity level (Low/Medium/High)
