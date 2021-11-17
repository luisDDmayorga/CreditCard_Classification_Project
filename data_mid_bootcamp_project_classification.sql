# SQL Questions - Classification

# 1. Create a database called credit_card_classification.

CREATE DATABASE credit_card_classification;

USE credit_card_classification;

# 2. Create a table credit_card_data with the same columns as given in the csv file. 
# Please make sure you use the correct data types for each of the columns.

DROP TABLE IF EXISTS credit_card_data;

CREATE TABLE credit_card_data (
    Customer_Number INT(10) NOT NULL,
    Offer_Accepted CHAR(5),
    Reward CHAR(20),
    Mailer_Type CHAR(10),
    Income_Level CHAR(10),
    Bank_Accounts_Open INT(5) NOT NULL,
    Overdraft_Protection CHAR(5),
    Credit_Rating CHAR(10),
    Credit_Cards_Held INT(5) NOT NULL,
    Homes_Owned INT(5) NOT NULL,
    Household_Size INT(5) NOT NULL,
    Own_Your_Home CHAR(5),
    Average_Balance FLOAT(6 , 2 ) NOT NULL,
    Q1_Balance FLOAT(6 , 1 ) DEFAULT NULL,
    Q2_Balance FLOAT(6 , 1 ) DEFAULT NULL,
    Q3_Balance FLOAT(6 , 1 ) DEFAULT NULL,
    Q4_Balance FLOAT(6 , 1 ) DEFAULT NULL
);

SELECT 
    *
FROM
    credit_card_data;

# 3. Import the data from the csv file into the table. 
# Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. 
# To not modify the original data, if you want you can create a copy of the csv file as well. 
# Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk:

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

SELECT 
    *
FROM
    credit_card_data;

# 5.Use the alter table command to drop the column q4_balance from the database, 
# as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. 
# Limit your returned results to 10.

ALTER TABLE credit_card_data
DROP Q4_Balance;

SELECT 
    *
FROM
    credit_card_data
LIMIT 10;

SELECT 
    COUNT(*)
FROM
    credit_card_data;

SELECT DISTINCT
    Offer_accepted
FROM
    credit_card_data
GROUP BY Offer_Accepted;

SELECT DISTINCT
    Reward
FROM
    credit_card_data
GROUP BY Reward;

SELECT DISTINCT
    Mailer_Type
FROM
    credit_card_data
GROUP BY Mailer_Type;

SELECT DISTINCT
    Credit_Cards_Held
FROM
    credit_card_data
GROUP BY Credit_Cards_Held;

SELECT DISTINCT
    Household_Size
FROM
    credit_card_data
GROUP BY Household_Size;

SELECT 
    Customer_Number, Average_Balance
FROM
    credit_card_data
ORDER BY Average_Balance DESC
LIMIT 10;

SELECT 
    ROUND(AVG(Average_Balance), 2)
FROM
    credit_card_data;

SELECT DISTINCT
    (Income_Level),
    ROUND(AVG(Average_Balance), 2) AS Avg_balance
FROM
    credit_card_data
GROUP BY Income_Level;

SELECT DISTINCT
    (Bank_Accounts_Open),
    ROUND(AVG(Average_Balance), 2) AS Avg_balance
FROM
    credit_card_data
GROUP BY Bank_Accounts_Open;

SELECT DISTINCT
    (Credit_Rating),
    ROUND(AVG(Credit_Cards_Held), 2) AS Avg_cc_held
FROM
    credit_card_data
GROUP BY Credit_Rating;

SELECT DISTINCT
    Bank_Accounts_Open,
    (Credit_Cards_Held),
    COUNT(DISTINCT (Customer_Number)) AS Num_of_Customers
FROM
    credit_card_data
GROUP BY Credit_Cards_Held , Bank_Accounts_Open;

	SELECT 
    *
FROM
    credit_card_data
WHERE
    (Credit_Rating = 'Medium'
        OR Credit_Rating = 'High')
        AND Credit_Cards_Held <= 2
        AND Own_Your_Home = 'Yes'
        AND Household_Size >= 3
        AND Offer_Accepted = 'Yes';

SELECT 
    *
FROM
    credit_card_data
WHERE
    Average_Balance < (SELECT 
            ROUND(AVG(Average_Balance), 2) AS Avg_balance
        FROM
            credit_card_data);

CREATE OR REPLACE VIEW customersbalance_below_avg AS
    SELECT 
        *
    FROM
        credit_card_data
    WHERE
        Average_Balance < (SELECT 
                ROUND(AVG(Average_Balance), 2) AS Avg_balance
            FROM
                credit_card_data);
SELECT 
    *
FROM
    customersbalance_below_avg;

SELECT 
    Offer_Accepted, COUNT(Customer_Number)
FROM
    credit_card_data
GROUP BY Offer_Accepted

SELECT DISTINCT
    (Credit_Rating), ROUND(AVG(Average_Balance), 2)
FROM
    credit_card_data
GROUP BY Credit_Rating

SELECT 
    ROUND((SELECT 
                    ROUND(AVG(Average_Balance), 2) AS Avg_balance
                FROM
                    credit_card_data
                WHERE
                    (Credit_Rating = ‘High’)) - (SELECT 
                    ROUND(AVG(Average_Balance), 2) AS Avg_balance
                FROM
                    credit_card_data
                WHERE
                    (Credit_Rating = ‘Low’)),
            2) AS diff_high_lowIn the database, which all types of communication (mailer_type) were used and with how many customers?

select distinct(Mailer_Type), count(Customer_Number) from credit_card_data
group by Mailer_Type;

# 17. Provide the details of the customer that is the 11th least Q1_balance in your database.

SELECT 
    Customer_Number, Q1_Balance
FROM
    credit_card_data
ORDER BY Q1_Balance ASC
LIMIT 11;

#DENSE RANK
#rank customers by Q1_Balance

select Customer_Number,Q1_Balance,
dense_RANK() OVER (order by Q1_Balance asc) as ranking
from credit_card_data;

# As the 11th customers with less Q1 Balance have 10EUR, we have extracted them with the below query

SELECT 
    *
FROM
    credit_card_data
HAVING Q1_Balance = 10;