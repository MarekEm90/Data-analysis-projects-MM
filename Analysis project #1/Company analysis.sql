-- Employees ranking (GOLD/SILVER/BRONZE) according to total number of sales (UNION, JOIN across databases, CONCAT, GROUP BY, HAVING, COUNT)

use hr;

SELECT e.employee_id, CONCAT(first_name,' ', last_name) as full_name, COUNT(t.trans_id) as trans_num, 'GOLD' as status
FROM employees e
JOIN transactions.transactions t USING(employee_id)
GROUP BY e.employee_id
HAVING COUNT(*) > 30

UNION

SELECT e.employee_id, CONCAT(first_name,' ', last_name) as full_name, COUNT(t.trans_id) as trans_num, 'SILVER' as status
FROM employees e
JOIN transactions.transactions t USING(employee_id)
GROUP BY e.employee_id
HAVING COUNT(*) BETWEEN 15 AND 29

UNION

SELECT e.employee_id, CONCAT(first_name,' ', last_name) as full_name, COUNT(t.trans_id) as trans_num, 'BRONZE' as status
FROM employees e
JOIN transactions.transactions t USING(employee_id)
GROUP BY e.employee_id
HAVING COUNT(*) < 15;


-- Employees ranking (GOLD/SILVER/BRONZE) according to total number of sales DIFFERENT WAY (CONCAT, COUNT, GROUP BY, JOIN across databases, CASE, VIEW)

use hr;

CREATE VIEW employees_ranking AS 

SELECT e.employee_id, CONCAT(first_name,' ', last_name) as full_name, COUNT(t.trans_id) as trans_num
FROM employees e
JOIN transactions.transactions t USING(employee_id)
GROUP BY e.employee_id
ORDER BY trans_num DESC;

SELECT employee_id, full_name, trans_num,
		CASE
			WHEN trans_num > 30 THEN 'GOLD'
            WHEN trans_num BETWEEN 15 AND 29 THEN 'SILVER'
            ELSE 'BRONZE'
            END AS 'status'
FROM employees_ranking
ORDER BY trans_num DESC;


-- Add size (meters) to TOP 5 properties ordered by the highest bid_price -> convert size (meters to feet) rounded to 1 decimal and bid_price (US dollars to PL zloty) rounded to nearest integer

use transactions;

ALTER TABLE properties
ADD COLUMN size INT;

SELECT *
FROM properties
ORDER BY bid_price DESC
LIMIT 5;

UPDATE properties
SET size = CASE
WHEN property_id = 22 THEN '54'
WHEN property_id = 49 THEN '76'
WHEN property_id = 28 THEN '101'
WHEN property_id = 34 THEN '125'
WHEN property_id = 39 THEN '88'
END;

SELECT property_id, property_type, address, district, city, FLOOR(bid_price*4.06) AS bid_price_PLN, ROUND(size/0.3048,1) AS size_ft
FROM properties
ORDER BY bid_price DESC
LIMIT 5;


-- Which City has the most expensive district based on bid_price

use transactions;

SELECT district, city, SUM(bid_price) as total_price
FROM properties
GROUP BY district, city
ORDER BY total_price DESC
LIMIT 1;


-- Rank districts from all the cities based on trans_price, also show overall_rank (RANK, PARTITION BY, JOIN)

use transactions;

SELECT p.district, p.city, t.trans_price, 
		RANK() OVER (ORDER BY t.trans_price DESC) AS overall_rank, 
        RANK() OVER (partition by p.district ORDER BY t.trans_price DESC) AS District_rank
FROM properties p
JOIN transactions t USING(property_id);


-- Show bank_id 3's most recent transaction_date (Subquery, MAX)

use transactions;

SELECT bank_id, trans_id, client_id, trans_date, trans_price
FROM transactions
WHERE bank_id = 3 AND trans_date = (
SELECT MAX(trans_date)
FROM transactions 
WHERE bank_id = 3);


-- Show property_id, client_id and trans_id that matches one of the two criteria: 
 -- 1) property_id is an even number and client_id is either 2,7 or 10 
 -- 2) property_id contains a 2 and length of trans_id is 3
 
 use transactions;
 
 SELECT property_id, client_id, trans_id
 FROM transactions
 WHERE (property_id %2 = 0 AND client_id IN(2,7,10)) OR		
	   (property_id LIKE '%2%' AND length(trans_id) = 3);
       


 


































