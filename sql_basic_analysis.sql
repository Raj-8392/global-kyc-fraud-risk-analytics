
/*
Project: Global KYC & Fraud Risk Analytics
Author: Nagaraju R
Purpose: Detect fraud patterns and KYC compliance risks
*/


--Q1. Find Top 10 customers based on number of transactions

SELECT TOP 10
	C.Customer_ID, COUNT(T.TXN_ID) AS Total_Transactions
FROM CUSTOMERS C 
JOIN ACCOUNTS A
ON C.customer_id = A.customer_id
JOIN TRANSACTIONS T
ON A.account_id = T.account_id
GROUP BY C.customer_id
ORDER BY COUNT(T.TXN_ID) DESC

-- Q2. Identify customers whose total transaction amount exceeds 500,000


SELECT C.CUSTOMER_ID, SUM(T.TXN_AMOUNT) AS TOTAL_TRANSACTION_AMOUNT 
FROM CUSTOMERS C
	JOIN ACCOUNTS A ON C.customer_id = A.customer_id
	JOIN TRANSACTIONS T ON A.ACCOUNT_ID = T.ACCOUNT_ID
GROUP BY C.customer_id
HAVING SUM(T.TXN_AMOUNT) > 500000 

-- Q3. Top 5 countries with highest number of transactions

SELECT TOP 5 
COUNTRY, 
COUNT(TXN_ID)
FROM TRANSACTIONS
GROUP BY country
ORDER BY COUNT(TXN_ID) DESC

--Q4. Find customers whose KYC is Pending AND they have more than 5 transactions

SELECT
    C.CUSTOMER_ID, 
    COUNT(T.TXN_ID) AS NUMBER_OF_TRANSACTIONS
FROM CUSTOMERS C
JOIN ACCOUNTS A 
    ON C.CUSTOMER_ID = A.CUSTOMER_ID
JOIN TRANSACTIONS T 
    ON A.ACCOUNT_ID = T.ACCOUNT_ID
WHERE C.kyc_status = 'PENDING'
GROUP BY C.customer_id
HAVING COUNT(T.txn_id) > 5