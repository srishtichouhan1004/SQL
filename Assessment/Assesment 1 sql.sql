#1
-- select * retrieves all columns from a table.
-- selecting column names retrieves only the required column.

#2
-- The keyword used is "as" alias
-- It only changes the name in output display
-- It does not modify the actual structure in the database.

#3
-- "5000" - treated as string/text
-- 5000 - treated as a numeric value

-- eg: where sales > 5000 is correct and where sales > "5000" is wrong

-- comparing different data types may cause:
-- implicit conversion
-- slower performance
-- errors in some SQL engines


#4
-- Order by profit desc :
-- sorts  values from highest to lowest
-- used for finding top profitable orders

-- Order by profit asc:
-- sorts values from lowest to highest
-- used for finding loss making orders

-- to find top 10
/* order by profit desc
limit 10; */


#6

/* Logical order execution is
from
where 
select 
order by
limt */

/* SELECT Order_ID, Profit
FROM orders
WHERE Profit > 100
ORDER BY Profit DESC
LIMIT 10; */


/* Data is first taken from table 
filtered using where
selected columns shows
sorted using order by whether desc or asc
final limited rows we want */

## PRACTICAL TASK -

#1
/* select * from orders
limit 20; */

#2
/* select orderid,
         order_date,
         sales as total_sales,
         profit 
from orders; */

#3
/* select * from orders
where sales > 5000; */

#4
/* select * from orders
order by profit desc
limt 10 ; */

## MINI PROJECT 

use management;

select * from superstore;

-- As table is already created i will write the step how it is done

/* create table superstore ( ROW_ID INT,
                          Order ID varchar(50),
						  Order_Date varchar(50),
                          Ship_Date varchar(50),
                          Ship_Mode varchar(50),
                          Customer_ID varchar(50)
                          Customer_Name varchar(50),
                              Segment varchar50),
                              Country varchar(50),
                               City varchar(50),
                               State varchar(50),
							   Postal_Code int,
                               Region varchar(50),
							 Product_ID varchar50),
                               Category varchar(50),
                             Sub_Category varchar(50),
                             Product_Name varchar(255), 
                             Sales decimal(10,2),
                              Quantity int,
							Discount decimal(5,2),
                             Profit  decimal(10,2)
                             ); */
                             
 # Multi condition filtering queries :
 
 -- 1. Find Underperforming categories-
 
 select category,
        sum(profit) as total_profit
from superstore
where profit < 0
group by category;


-- 2. Most Profitable Transactions in Corporate Segment

select
       segment,
       profit,
       sales
from superstore
where segment = "corporate"
and profit > 500
order by profit desc;    
       
# Aggregated Performance report by region

select region ,
       sum(Sales) AS Total_Sales,
       sum(Profit) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;


# Loss Making Transaction Summary

SELECT Category,
       count(*) AS Loss_Transactions,
       sum(Profit) AS Total_Loss
FROM superstore
WHERE Profit < 0
GROUP BY Category
ORDER BY Total_Loss Asc;


