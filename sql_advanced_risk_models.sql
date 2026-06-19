
/*
Project: Global KYC & Fraud Risk Analytics
Author: Nagaraju R
Purpose: Detect fraud patterns and KYC compliance risks
*/


-- Q12. Identify Customers with Structured Transactions (Smurfing - Fraud pattern: Many small transactions to avoid detection (just below threshold)

SELECT
    A.account_id,
    COUNT(T.txn_id) AS small_txn_count,
    SUM(T.txn_amount) AS total_amount
FROM TRANSACTIONS T
JOIN ACCOUNTS A ON T.account_id = A.account_id
WHERE T.txn_amount < 50000   -- threshold (example)
GROUP BY A.account_id
HAVING COUNT(T.txn_id) > 2
   AND SUM(T.txn_amount) > 20000;

--Q13. Detect Sudden Spike in Transaction Amount (Behavior Change) - Fraud pattern: Sudden increase compared to normal behavior

WITH txn_avg AS (
    SELECT 
        account_id,
        AVG(txn_amount) AS avg_txn
    FROM TRANSACTIONS
    GROUP BY account_id
)

SELECT 
    T.account_id,
    T.txn_id,
    T.txn_amount,
    A.avg_txn
FROM TRANSACTIONS T
JOIN txn_avg A ON T.account_id = A.account_id
WHERE T.txn_amount > 3 * A.avg_txn;


--Q14. Detect First Transaction After Dormancy - Fraud pattern: Dormant → sudden activity → fraud

WITH ranked_txns AS (
    SELECT 
        account_id,
        txn_id,
        txn_date,
        ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY txn_date) AS rn
    FROM TRANSACTIONS
)

SELECT 
    A.account_id,
    A.account_status,
    R.txn_id,
    R.txn_date
FROM ranked_txns R
JOIN ACCOUNTS A ON R.account_id = A.account_id
WHERE A.account_status = 'Dormant'
  AND R.rn = 1;


--Q15. Simple Risk Scoring Model

WITH risk_calc AS (
    SELECT 
        C.customer_id,

        CASE WHEN C.kyc_status = 'PENDING' THEN 30 ELSE 0 END +
        CASE WHEN C.risk_category = 'High' THEN 40 ELSE 0 END +
        CASE WHEN SUM(T.txn_amount) > 300000 THEN 20 ELSE 0 END +
        CASE WHEN COUNT(DISTINCT T.country) > 3 THEN 10 ELSE 0 END 
        AS risk_score

    FROM CUSTOMERS C
    JOIN ACCOUNTS A ON C.customer_id = A.customer_id
    JOIN TRANSACTIONS T ON A.account_id = T.account_id

    GROUP BY C.customer_id, C.kyc_status, C.risk_category
)

SELECT *,
    CASE 
        WHEN risk_score >= 70 THEN 'High Risk'
        WHEN risk_score >= 40 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM risk_calc;