SELECT * FROM bank_loan_data

-- Total Loan Application 
SELECT count(id) AS Total_Loan_Applications FROM bank_loan_data

-- MTD Applications 
SELECT count(id) AS MTD_Loan_Applications FROM bank_loan_data
WHERE MONTH (issue_date) = 12 AND YEAR(issue_date) = 2021

-- PMTD Applications 
SELECT count(id) AS PMTD_Loan_Applications FROM bank_loan_data
WHERE MONTH (issue_date) = 11 AND YEAR(issue_date) = 2021

-- Total Funded Amount 
SELECT sum(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

-- MTD Total Funded Amount 
SELECT sum(loan_amount) AS MTD_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12

-- PMTD Total Funded Amount 
SELECT sum(loan_amount) AS PMTD_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11

-- Total Amount Received 
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data

-- MTD Total Amount Received 
SELECT SUM(total_payment) AS MTD_Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 12

-- PMTD Total Amount Received 
SELECT SUM(total_payment) as PMTD_Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 11

-- AVG Interest Rate 
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data

-- MTD Interest Rate 
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 


-- PMTD Interest Rate 
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 

-- AVG DTI 
SELECT AVG(dti)*100 as Avg_DTI from	bank_loan_data

-- MTD Avg DTI 
SELECT AVG(dti)*100 as MTD_Avg_DTI from	bank_loan_data
WHERE MONTH(issue_date) = 12 

-- PMTD Avg DTI 
SELECT AVG(dti)*100 as PMTD_Avg_DTI from bank_loan_data
WHERE MONTH(issue_date) = 11 

-- Good Loan Issued 

-- Good Loan Percentage 
SELECT (COUNT ( CASE WHEN loan_status = 'Fully Paid' or loan_status = 'Current' THEN id END ) * 100.0) /
	COUNT(id) AS Good_Loan_Percentage FROM bank_loan_data

-- Good Loan Applications 
SELECT COUNT(id) as Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' or loan_status = 'Current'

-- Good Loan Funded Amount 
SELECT SUM(loan_amount) AS Good_Loan_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' or loan_status = 'Current'

-- Good Loan Amount Received
SELECT SUM(total_payment) as Good_Loan_Amount_Received FROM bank_loan_data
WHERE loan_status = 'Fully Paid'or loan_status = 'Current'

-- Bad Loan Issued 

-- Bad Loan Percentage 

SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) /
		COUNT(id) as Bad_Loan_Percentage from bank_loan_data

-- Bad Loan Application 
SELECT COUNT(id) as Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Funded Amount 
SELECT SUM(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Received Amount 
SELECT SUM(total_payment) as Bad_Loan_Received_Amount from bank_loan_data
WHERE loan_status = 'Charged Off'

-- Loan Status 
SELECT loan_status,
		COUNT(id) as Loan_Count, 
		SUM(total_payment) as Total_Amount_Received,
		sum (loan_amount) as Total_Amount_Funded,
		avg(int_rate * 100) as Interest_Rate,
		avg(dti * 100) as DTI
	from bank_loan_data
	GROUP BY loan_status 

-- MTD 

SELECT 
loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data 
WHERE month(issue_date) = 12 
GROUP BY loan_status

-- Bank Loan Report | Overview 

-- Month 
SELECT 
	MONTH(issue_date) as Month_Number,
	DATENAME(MONTH, issue_date) AS Month_Name ,
	count(id) as Total_Loan_Applications,
	sum (loan_amount) as Total_loan_amount ,
	sum (total_payment) as Total_Payment 
from bank_loan_data 
GROUP BY Month(issue_date) , datename(month, issue_date)
ORDER BY Month(issue_date)

-- STATE 
Select 
	address_state AS State,
	count(id) as Total_Loan_Applications, 
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

-- Term 
Select 
	term AS Term,
	count(id) as Total_Loan_Applications, 
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

-- Employee Length 
Select 
	emp_length AS Employee_length,
	count(id) as Total_Loan_Applications, 
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

-- Purpose
Select 
	purpose AS Purpose,
	count(id) as Total_Loan_Applications, 
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

-- Home Ownership
Select 
	home_ownership AS Home_Ownership,
	count(id) as Total_Loan_Applications, 
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership

select * FROM bank_loan_data