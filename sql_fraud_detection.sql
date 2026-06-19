
/*
Project: Global KYC & Fraud Risk Analytics
Author: Nagaraju R
Purpose: Detect fraud patterns and KYC compliance risks
*/


--Q5. Detect Dormant Accounts with Transactions (Fraud Red Flag - Fraud pattern: Activity in dormant accounts)


SELECT 
    A.account_id,
    A.account_status,
    COUNT(T.txn_id) AS txn_count,
    SUM(T.txn_amount) AS total_amount
FROM ACCOUNTS A
JOIN TRANSACTIONS T ON A.account_id = T.account_id
WHERE A.account_status = 'Dormant'
GROUP BY A.account_id, A.account_status
HAVING COUNT(T.txn_id) > 0;


--Q6. High-Risk Customers Doing High Transactions (Combining KYC risk + financial behavior)

SELECT
    C.customer_id,
    C.risk_category,
    SUM(T.txn_amount) AS total_txn_amount
FROM CUSTOMERS C
JOIN ACCOUNTS A ON C.customer_id = A.customer_id
JOIN TRANSACTIONS T ON A.account_id = T.account_id
WHERE C.risk_category = 'High'
GROUP BY C.customer_id, C.risk_category
HAVING SUM(T.txn_amount) > 300000;

--Q7. Multiple Countries Usage (Geo Anomaly) (Fraud pattern: Same customer transacting in multiple countries)

SELECT
    C.customer_id,
    COUNT(DISTINCT T.country) AS country_count
FROM CUSTOMERS C
JOIN ACCOUNTS A ON C.customer_id = A.customer_id
JOIN TRANSACTIONS T ON A.account_id = T.account_id
GROUP BY C.customer_id
HAVING COUNT(DISTINCT T.country) > 3;

--Q8. Rapid Transactions (Burst Activity - Fraud pattern: Many transactions in short time)

SELECT
    account_id,
    txn_date,
    COUNT(txn_id) AS txn_count
FROM TRANSACTIONS
GROUP BY account_id, txn_date
HAVING COUNT(txn_id) > 1

--Q9. Suspicious Large Transactions

SELECT
    txn_id,
    account_id,
    txn_amount,
    country
FROM TRANSACTIONS
WHERE txn_amount > 150000;

--Q10. Customers with Pending KYC but High Value Activity

SELECT
    C.customer_id,
    C.kyc_status,
    SUM(T.txn_amount) AS total_txn
FROM CUSTOMERS C
JOIN ACCOUNTS A ON C.customer_id = A.customer_id
JOIN TRANSACTIONS T ON A.account_id = T.account_id
WHERE C.kyc_status = 'PENDING'
GROUP BY C.customer_id, C.kyc_status
HAVING SUM(T.txn_amount) > 200000;


--Q11. Rank customers by transaction value

SELECT
    C.customer_id,
    SUM(T.txn_amount) AS total_txn,
    RANK() OVER (ORDER BY SUM(T.txn_amount) DESC) AS txn_rank
FROM CUSTOMERS C
JOIN ACCOUNTS A ON C.customer_id = A.customer_id
JOIN TRANSACTIONS T ON A.account_id = T.account_id
GROUP BY C.customer_id;