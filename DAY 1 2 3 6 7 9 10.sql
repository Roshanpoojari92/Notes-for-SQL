-------------------DAY 1 HOW TO DATABASE------------------------------
CREATE DATABASE SELF_LEARNING;

use SELF_LEARNING
-----------------------------------------------------------------
-------------------HOW TO CREATE TABLE WITH APPLYNG DATATPYE below---------------------------------

CREATE TABLE CUSTOMER_DETAILS_
(
CUSTOMER_ID INT,
CUSTOMER_NAME CHAR(30),
CONTACT_NUMBER BIGINT,
CITY CHAR(50),
COUNTRY CHAR(100)
);

SELECT * FROM CUSTOMER_DETAILS_;

SELECT CUSTOMER_ID,CITY FROM  CUSTOMER_DETAILS_;

------------------TABLE IS CREATE [IMP-PLEASE MAKE SURE THAT (,;_ SHOULD BE UPDATED PROPERLY]-----------
-------------------------------------------------------------------------------------------------------

INSERT INTO CUSTOMER_DETAILS_ VALUES-----VALUES IS MAIN PART IN IT------------------
(201,'ROSHAN',8087936607,'UDUPI','INDIA'),
(202,'SAJEENA',8087936656,'BANGLORE','INDIA'),
(203,'KRISHVI',8087936686,'PUNE','INDIA'),
(204,'AMMA',8087936679,'LONDAN','ENGLAND'),
(205,'RAVI',8087936623,'DHOLAKPUR','NEPAL'),
(206,'UDAY',8087936612,'KARACHI','PAKISTAN')
;
--------------------------------EXTRA ADDED TO DELETE THE DUPLICATE-----------------------------------------------------------------------
SELECT * FROM CUSTOMER_DETAILS_;

WITH CTE AS (
    SELECT 
        CUSTOMER_ID, 
        CUSTOMER_NAME, 
        CONTACT_NUMBER, 
        CITY, 
        COUNTRY,
        ROW_NUMBER() OVER (
            PARTITION BY CUSTOMER_ID, CUSTOMER_NAME, CONTACT_NUMBER, CITY, COUNTRY 
            ORDER BY CUSTOMER_ID
        ) AS row_num
    FROM CUSTOMER_DETAILS
)
DELETE FROM CTE
WHERE row_num > 1;

----------------------------------------------TO DELETE THE NULL CELL-------------------------------------------------------------------------
DELETE FROM CUSTOMER_DETAILS
WHERE CUSTOMER_ID IS NULL
   OR CUSTOMER_NAME IS NULL
   OR CONTACT_NUMBER IS NULL
   OR CITY IS NULL
   OR COUNTRY IS NULL;

---------------------------------------------------DAY 2-----------------------------------------------------
SELECT * FROM [dbo].[Orders$]
SELECT * FROM [dbo].[People$]
SELECT * FROM [dbo].[Returns$]
-------------------------------------THE BELOW QUERY UPDATE AS ALTER TABLE+ADD[TITLE YOU HAVE TO ADD ]- SINGLE INSERTIONS---------
ALTER TABLE ORDERS$---- 
ADD EMAIL_ID VARCHAR(100);-------add columnname 

SELECT * FROM Orders$
----------------------------------THE BLEOW QUERY USE TO ADD TWO COLUMN IN TABLE---------MULTIPLE INSERTIONS----------------------------------------
ALTER TABLE CUSTOMER_DETAILS_
ADD STATES INT,EMAIL_ID VARCHAR(100);

SELECT * FROM CUSTOMER_DETAILS_
--------------------------------- THE BELOW QUERY USE TO DROP(DELETE THE COLUMN SINGLE OR MULTIPLE)------------------------
ALTER TABLE CUSTOMER_DETAILS_
DROP COLUMN EMAIL_ID,STATES;

SELECT * FROM CUSTOMER_DETAILS_

------------------------------------CHANGING DATATPYE(BIGINT)------------------------------------------
ALTER TABLE CUSTOMER_DETAILS_	
ALTER COLUMN CONTACT_NUMBER BIGINT;   

SELECT * FROM CUSTOMER_DETAILS_

-----------------------------------RENAME THE TABLE AND COLUMN BY ADDING (DOT.)-----------
EXEC sp_rename 'CUSTOMER_DETAILS_.CONTACT_NUMBER', 'PHONE_NUMBER';

SELECT * FROM CUSTOMER_DETAILS_

-------------------Where Claues------------------------------------------------------------------------
----------------------------------------TPYES OF Operators--------------------------------------
SELECT * FROM Orders$----- FRIST SELECT THE TABLE-------
----------------------------WHERE CLAUSE(FILTERING) WITH = EQUAL TO SIGN--------------------------------------------------
SELECT * FROM Orders$
WHERE State ='NEW YORK';---- THE QUERY WILL GIVE YOU THE SAME DATA WHAT YOU HAVE ASK AS NEW YORK

---------------------------------------EQUAL TO= ------------------------------------------------
SELECT [Order ID],[SHIP MODE], State FROM Orders$----[] THIS IS USE WHEN WORD HAVE THE SPACE
WHERE State='NEW YORK';-----THIS query distribute specific ROW/COLUMN

------------------------------------NOT EQUAL TO <> ,!=---------------------------------------------------
SELECT * FROM Orders$
WHERE State<>'NEW YORK';

SELECT [Order ID],[CUSTOMER ID],State FROM Orders$--- PUT CORRECT SIGN IN AS ,[;------([] IS USE WHEN WORD HAS SPACE)----
WHERE State<>'NEW YORK';

SELECT [Order ID],[CUSTOMER ID],State FROM Orders$--- USING != SIGN FOR NOT EQUAL TO------------
WHERE State!='NEWYORK';
--------------------------------------AND/OR-----------------------------------------------
SELECT [Order ID],[Ship Date],[SHIP MODE] FROM Orders$
WHERE [Ship Mode]='SAME DAY' AND [Order Date]>'2016-10-10';------SPACE IS IMPROTANT IN 'SAME DAY'

SELECT [ORDER ID] ,[SHIP DATE],[SHIP MODE] FROM Orders$
WHERE [Ship Mode]='SAME DAY' OR [Order Date]>'2016-10-10';

-----------------------------------BETWEEN/ NOT BETWEEN----------------------------------

SELECT [CITY],[REGION],[SALES] FROM Orders$------BETWEEN WILL WORK ON NUMRICAL DATA IT WILL NOT WORK ON NON-NUMRICAL DATA
WHERE Sales BETWEEN 500 AND 2000; ----ALWAYS US FOR RANGE (AND SIGN IS USED IN IT)
----YOU HAVE TO WORK FINDNG RANGE USE BETWEEN--------------------------------

SELECT CITY,Region,SALES FROM Orders$
WHERE SALES NOT BETWEEN 500 AND 2000;

-----WE CAN RUN MULTIPLE QUERY IN ONE TOGETHER-----

--------------------------------------------IN \ NOT IN------------------------------

SELECT * FROM Orders$;

SELECT State, REGION ,SALES FROM Orders$
WHERE State IN ('NEW YORK','CALIFORNIA','TEXAS');-----IF WE HAVE SEE MULTIPAL THINGS IN ON COLUMN (IN) SIGN IS USED
----USE CORRECT SPELLINGS AND ',[]()-------

SELECT State, REGION,SALES FROM Orders$
WHERE State NOT IN ('NEW YORK','CALIFORNIA','TEXAS');

---------------------------------------------Day 3---------------------------------------------------------
Use SELF_LEARNING;---------TO SELCET THE DATABASE
SELECT * FROM Orders$;
-------------------------------------------lIKE OPARATES----------------------------------------------------------
SELECT [Order ID],Category,[Product Name] FROM Orders$----------BY ADDING FEW COLUMN NAME WE CAN IDENTIFE THE NAME---
WHERE [Product Name] LIKE '%BOOKCASE'---------------% START IT SHOWS END WORD---------------
;
SELECT [Order ID],Category,[Product Name] FROM Orders$
WHERE [Product Name]LIKE 'ANGLE%'-------------------% IN END SHOWS START WORD--------------
;
----------------------------------------------------------------------------------------------------------------
SELECT [Order ID],Category,[Product Name] FROM Orders$
WHERE [Product Name]LIKE '%ANGLE%';----------------------%__% BOTH SIDE % MEANS ANYWHERE WORD SHOUD BE SHOWN---------
---------------------------------------------------------------------------------------------------------------
SELECT [Order ID], Category,[Sub-Category] FROM Orders$
WHERE [Sub-Category] LIKE '__P%';-----the 3rd letter should be P---------
---WE ARE FINDING P IN CAPITAL OR IN LOW CASE IT MATCH (IT IS NOT CASE SENSITIVE)----------------------
SELECT [Order ID], Category,[Sub-Category] FROM Orders$
WHERE [Sub-Category] LIKE '__p%';
-------------------------------------------------------------------------------------------------------------
SELECT [Order ID], Category,[Sub-Category] FROM Orders$
WHERE [Sub-Category] LIKE '%__P%';
------------------------------------------------------------------------------------------------------------
-------------------------Delete(TABLE structure GET DELETE --------------------------------------------------------------------------

SELECT * FROM CUSTOMER_DETAILS

DELETE FROM CUSTOMER_DETAILS----------------DIRECT TABLE structure GET DELETE BY USEING THIS------------
WHERE COUNTRY = 'PAKISTAN'------------THE FOLLOWING SYSTEX GIVE US TO DELETE THE ROW BY TABLE--------------
;

-------------------------------DROP-----------------------------------------------------
CREATE TABLE USE_FOR_DROP----- FOR DROP ON TABLE IS CREATED
(NUMBERS INT,-------------------- WHILE USE INT/CHAR/ ANYTHING AS DATATYPE DON'T PUT , SIGN--------------- 
NAMES CHAR(50),
CITY CHAR(100),
ROOM_NO INT
)
;
SELECT * FROM USE_FOR_DROP

INSERT INTO USE_FOR_DROP VALUES---------- VALUES IS IMPORTANT TO INSERT THE TABLE DETAILS-----------------------
(10, 'DAMDAM', 'PUNE',101),
(20, 'KAMKAM', 'PIMPRI',102),
(30, 'JAMJAM', 'CHINCHWAD',103),
(40, 'SAMSAM', 'KALEWADI',104)
;

DROP TABLE USE_FOR_DROP;------IT DELETE THE TABLE AND IT CANNOT BE RECOVERD[MUSTLY THIS IS NOT USE IN COMPANIES]----
--------------------------------------------------------------------------------------------------------------------
-------------------------------------------TRUNCATE----------------------------------------------------------------
CREATE TABLE USE_FOR_TRUNCATE----- FOR TRUNCATE ON TABLE IS CREATED
(SR_NO INT,-------------------- WHILE USE INT/CHAR/ ANYTHING AS DATATYPE DON'T PUT , SIGN--------------- 
NAMES CHAR(50),
CITY CHAR(100),
ROOM_NO INT
)
;
SELECT * FROM USE_FOR_TRUNCATE----DATA GETS DELETED structure NOT GET EFFECTS

INSERT INTO USE_FOR_TRUNCATE VALUES---------- VALUES IS IMPORTANT TO INSERT THE TABLE DETAILS-----------------------
(10, 'DAMDAM', 'PUNE',101),
(20, 'KAMKAM', 'PIMPRI',102),
(30, 'JAMJAM', 'CHINCHWAD',103),
(40, 'SAMSAM', 'KALEWADI',104)
;
select * from USE_FOR_TRUNCATE

TRUNCATE TABLE USE_FOR_TRUNCATE----it delete the hole table inside data not the total table

--------------------------------------------------------------------------------------------------------------
----------------------------------DAY 6----------------------------
------------------------------Aggregate function--------------------------------------

USE SELF_LEARNING

SELECT * FROM Orders$;

--Scenario: Basic Business Metrics

------FIND THE Performance Indicators, Order Volume, Customer Base, TOTAL Revenue, WHAT IS THE profitability
SELECT 
    SUM(SALES) AS TOTAL_SALES,-------------USING SUM WE CAN FIND TOTAL SUM AMOUNT OR NUMBERS
    COUNT(*) AS TOTAL_ORDERS,-----------------(*) STAND FOR ALL ROWS IN TABLE,INCLUDING NULL VALUES AS WELL
    COUNT(DISTINCT [Product Name]) AS UNIQUE_PRODUCT----------------WE CAN FIND THE VALUES WHICH IS UNIQUE 
FROM Orders$
;

Select DISTINCT Segment, Category  from Orders$---------WHEN WE HAVE TO SEE UNIQUE QUERY

SELECT category, 
    SUM(PROFIT) AS TOTAL_PROFIT,
    AVG(SALES) AS AVG_SALES,
    MAX(SALES) AS LARGE_SALES,
    MIN(SALES) AS MINIMUM_SALES
FROM Orders$
    WHERE Category = 'OFFICE SUPPLIES'--------------------- WE CAN FILTER THIS QUERY FOR ADDING WHERE CLAUSE
    Group by Category
;

--------------------------Group by-----------------------------------------

-----Scenario 1; total sales by categaroy

Select Category,
    sum(sales) as Total_sales,-----------------------use first column name then aggrerate function and use genric names for columns
    count(*) as order_count,
    avg(profit) as Avg_profit
from Orders$
    Group by category-----------------------------we cannnot use group by in aggrerate function WHICH HAS NO NUMRICAL DATA AND WHICH IS HAVES DUPLICATE NAMES  
;

-----------------------USING ORDER BY
Select Category,
    sum(sales) as Total_sales,-----------------------use first column name then aggrerate function and use genric names for columns
    count(*) as order_count,
    avg(profit) as Avg_profit
    from Orders$
Group by category
    ORDER BY Category desc-------
;

----------------------------------Scenario 2: Customer Count By Region and Segment------------------

SELECT  Region , Segment ,
    COUNT(DISTINCT [Customer ID]) as Customer_Count,
    SUM(SALES) AS TOTAL_SALES,
    AVG(PROFIT) AS AVG_PROFIT
FROM Orders$
    GROUP BY Region, Segment-----------------multipal grouping, showing customer matrics for combination
    ORDER BY Region asc ,Segment desc-----------------asc is defult
;

----------------------------------Scenario 3 : Monthty perfomance analysis-------------------

select Year([Order Date]) as Years,
    Month([Order Date]) as Months,

    count(*) as Orders,
    sum (Sales) as Monthly_Sales,
    sum (Profit) as Monthly_profit
from Orders$

    group by Year([Order Date]), Month([Order Date])
    order by Years,Months------------------------- originalname is not required for order by its use for final output
;

----------------------------------USING ROUND-UP ---------------------------------------
SELECT YEAR ([Order Date]) AS YEAR,
MONTH([Order Date]) AS MONTH,
COUNT(*) AS ORDERS,
SUM(SALES) AS MONTHLY_SALES,
SUM(PROFIT) AS MONTHLY_PROFIT,---------------------WITH DECIMAL
CEILING (SUM(PROFIT)) AS MONTHLY_ceiling,---------------------------------- CEILING MEANS ROUNDUP UPPER DIGIT
FLOOR (SUM(PROFIT)) AS MONTHLY_floor,---------------------------------- FLOOR MEANS ROUNDUP LOWER DIGIT
round (SUM(PROFIT),2) AS MONTHLY_PROFIT_round-------------------------round + 2 or any numbers
FROM Orders$
GROUP BY YEAR ([Order Date]), MONTH([Order Date])
ORDER BY YEAR, MONTH DESC
;

-----------------------------------Having clause---------------------
SELECT YEAR ([Order Date]) AS YEAR,
MONTH([Order Date]) AS MONTH,
COUNT(*) AS ORDERS,
SUM(SALES) AS MONTHLY_SALES,
SUM(PROFIT) AS MONTHLY_PROFIT,---------------------WITH DECIMAL
CEILING (SUM(PROFIT)) AS MONTHLY_ceiling,---------------------------------- CEILING MEANS ROUNDUP UPPER DIGIT
FLOOR (SUM(PROFIT)) AS MONTHLY_floor,---------------------------------- FLOOR MEANS ROUNDUP LOWER DIGIT
round (SUM(PROFIT),2) AS MONTHLY_PROFIT_round-------------------------round + 2 or any numbers
FROM Orders$
GROUP BY YEAR ([Order Date]), MONTH([Order Date])
having Sum(Sales) >= 50------------------ having use after groupby by using Aggrerate
;

-----------Scenario 1
-------Display the product categories  with high order value-------------

select Category,
    count(*) as order_count,
    sum(Sales) as Total_Sales, 
    Max (Profit) as Larger_profit 
from Orders$
    group by Category
    having max(profit)>100 and count(*)>1000---------------------------------After having aggrerate is important 
    order by order_count desc
;

------------------------------------
select Category,
    count(*) as order_count,
    sum(Sales) as Total_Sales, 
    Max (Profit) as Larger_profit 
from Orders$
    group by Category
    having max(profit)>100 and count(*)>1000---------------------------------After having aggrerate is important 
    order by order_count desc
;
----------------------------------------------------------------------------
-------------day 7------------------------------------------------------------------------------------
Use SELF_LEARNING

Create table Bank_Account-------------------------------open the new table bank Acoount
(   Account_ID InT Primary key,
    Customer_Name Varchar(50),
    Account_type Varchar(50),
    Balance_Amt decimal(10,2),
    Branch_Nam Varchar(50),
    Phone_No Bigint,
    City Varchar(100),
    Last_Transaction Date,
    Monthly_fees decimal(18,0),
)
;

select * from Bank_Account
-------------------------------------------------------------
INSERT INTO Bank_Account VALUES 
    (1, 'Amit Sharma', 'Savings', 25560.00, 'Connaught', 9811123456, 'Delhi', '2025-09-06', 250),
    (2, 'Riya Singh', 'Current', 40080.75, 'MG Road', 9888822233, 'Bangalore', '2025-09-01', 500),
    (3, 'Mehul Jain', 'Savings', 12000.50, 'Fort', 9933033030, 'Mumbai', '2025-09-07', 250),
    (4, 'Priya Sood', 'Current', 55050.00, 'Sector 17', 9777788889, 'Chandigarh', '2025-08-30', 500),
    (5, 'Neha Gupta', 'Savings', 31000.00, 'Hazratganj', 9212345678, 'Lucknow', '2025-09-02', 250),
    (6, 'Vikram Patel', 'Salary', 18500.00, 'Adyar', 9955512345, 'Chennai', '2025-09-05', 250),
    (7, 'Sara Khan', 'Current', 76000.00, 'Banjara Hills', 9887766554, 'Hyderabad', '2025-09-03', 500),
    (8, 'Rajesh Meena', 'Savings', 14200.70, 'Malviya Nagar', 9988991004, 'Jaipur', '2025-08-25', 250),
    (9, 'Anita Desai', 'Current', 68000.00, 'Bandra', 9323232323, 'Mumbai', '2025-09-04', 500),
    (10, 'Deepak Joshi', 'Salary', 47450.00, 'Sector 21', 9999292929, 'Gurgaon', '2025-09-07', 250),
    (11, 'Kiran Rao', 'Savings', 26850.25, 'Thane', 9966600550, 'Mumbai', '2025-09-06', 250),
    (12, 'Sohail Ahmed', 'Current', 59000.00, 'Koramangala', 9876543210, 'Bangalore', '2025-09-07', 500),
    (13, 'Naina Verma', 'Salary', 35210.00, 'Civil Lines', 9822221111, 'Delhi', '2025-08-29', 250),
    (14, 'Manish Aggarwal', 'Savings', 15600.00, 'Sector 62', 9944883322, 'Noida', '2025-09-05', 250)  
;

---------------------------------Date function-------------------------------------------------------
-----------------------Scnario:-HOW LONG HAS EACH CUSTOMER WITH THE BANK--------------------------------

Select Account_ID ,Customer_Name, Balance_Amt from Bank_Account;

Alter table Bank_Account
add Opening_date date;-------------------------------opening date was not selected then i create the colunm and insert date manually

-------------------------to find out days or years OR MONTHS the customer been with bank--------------------
Select 
    Account_ID, 
    Opening_date,
    DATEDIFF(DAY,OPENING_DATE,GETDATE()) AS DAYS_WITH_BANK,
    DATEDIFF(MONTH,OPENING_DATE,GETDATE()) AS MONTHS_WITH_BANK,
    DATEDIFF(YEAR,OPENING_DATE,GETDATE()) AS YEARS_WITH_BANK,
    Customer_Name, ---------, IS IMP
    Balance_Amt 
from Bank_Account;

-------Find the account open this year

Select Customer_Name, Opening_date from Bank_Account
where year(Opening_date) = 2025
;
Select Customer_Name, Opening_date from Bank_Account
where year(Opening_date) in (2025,2024)-----------------for multipal use In and (,)
;

------------------Give the list of customer how has not use account recently

Select 
    Customer_Name,
    Opening_date, 
    Last_Transaction 
from Bank_Account
    Where DATEDIFF(MONTH,Last_Transaction,GETDATE())>2

;

SELECT  CUSTOMER_NAME, OPENING_DATE, Last_Transaction,DATEDIFF(DAY,
Last_Transaction,GETDATE()) AS DAY_SINCE_LAST_USE
FROM BANK_ACCOUNT
WHERE DATEDIFF(DAY,Last_Transaction,GETDATE())> 5---------------5 means days
ORDER BY DAY_SINCE_LAST_USE
;

-----------------------------Views---------------------------------------------------------------

CREATE VIEW view_name AS
AS------------CONNENTING LINK
SELECT column1, column2, ...
FROM table_name-------------------------Base Table
WHERE condition;
ORDER BY

---------------------------------------Scnario:-Create a Bank summary view---------------------------
create view Summary_View
as
Select Branch_Nam,
       Count(*) as Total_Transation,   
       Avg(Monthly_fees) as Avg_monthly_fees, 
       sum(Balance_Amt) as Total_Deposit
       from Bank_Account
Group by Branch_Nam----------------------using the Aggrerate group by clasue is important
;------------we can use where, having, order by

Select * from Summary_View

drop view Summary_View-----------------to drop the view
drop view  NON_CONFIDENT_VIEW;
---------------------Non confident view---------------------------

CREATE VIEW NON_CONFIDENT_VIEW
as
Select City,
Avg(Balance_Amt) as Avg_Bal, 
SUM(Balance_Amt)as Total_Bal,
Branch_Nam
from Bank_Account
where  Account_type IN ('SAVING','CURRENT')------------IT SHOWS(VIEWS) THE BOTH SAVING AND CURRENT
GROUP BY City, Branch_Nam
;
select * from NON_CONFIDENT_VIEW

select * from Bank_Account

---------------------------------------------------------Day 8-----------------------

------- go to joins database-------------------------------

-------Create View Joining Orders and retunes tables-------------------

Select O.City, r.[Order ID],o.[Customer Name],r.Returned, Sum(Sales) as Total_Sales
from Orders$ O
Join 
Returns$ R
on
o.[Order ID]=R.[Order ID]
where o.City = 'Los Angeles'----------------Where use for filter with Operates
group by O.City, r.[Order ID],o.[Customer Name],r.Returned------------------group by use for Aggeratas function is used
having Sum(Sales)>500-------------------------Filter the Aggiration
Order By o.[Customer Name]----------------------Sort the Name in onw seq.
;
---------------------------------------------------------------------------------------------------------------
--------------Case Statement------------------------------------
Select column1,Column2,
Case
	When Condition1 then Result1
	When COndition2 then Result2
Else
	Defult Result
	End as New_Column
from Table_name---------------------------------------------Case statement Comes under From

-------------------------------------------------------------------------------------------
-----Scenario Classifed profit levels 
Select [Order ID], Profit,
Case when Profit > 50 then 'High'---------------for case When and Then is used
     when Profit > 5 then 'Modrate'
else 'Low'---------------------------------------Else use for no output
End as Profit_category--------------------------End is improtant as Header for data
from Orders$
;

-----Segment Customer by region-------------------
Select [Customer Name],[Order Date],[Product Name], Region,
Case when Region = 'East' Then 'Zone_1'
     when Region = 'West' Then 'Zone_2'
     when Region = 'Central' Then 'Zone_3'
     when Region = 'South' Then 'Zone_4'
Else 'No_Zone'
End as Zone
from Orders$

---------------------------------------------------------------------------------------------

--------Mark Late Shipment Orders

Select [Order Date],[Customer Name], [Ship Mode] , [Ship Date],Region, 
Case When [Ship Mode] = 'Same Day' then 'On Time'
     When [Ship Mode] = 'First Class' then 'On Time 1'
     When [Ship Mode] = 'Standard Class' then 'On Time 2'
Else 'Late Mark'
End Status
from Orders$

----------------------------------------------TCL-------------------------------------
COMMIT, ROLLBACK, SAVEPOINT------

BEGIN TRANSACTION
<dml STATEMENT>-----------------INSERT,UPDATE, DELETE
COMMIT

--------------------Insert the customer details and Commit the transations
Select * from Orders$

Begin Transaction-----------------------Begin Transaction is Important in Commit and Rollback
Insert Into Orders$ Values
(10000, 'CA-2025-12345', '2025-08-24','2025-08-24' ,'Second Class', 'RR-12345', 'Ruchika Rathi', 'Consumer', 'India', 'Pune', 'MH', 411021, 'West', 'cn-12345', 'Technology', 'Laptop', 'ABC', 50000,1,0,0, 'ruchika.rathi11@gmail.com')
Commit
;

Select * from Orders$
Where [Customer Name]= 'Ruchika Rathi'
;

Begin transaction
Delete from Orders$-----------------------------Delect the COlumn
Where [Customer Name]= 'Ruchika Rathi'
Rollback----------------------- While using Rollback it not get delete

------------------------------------Top/Limit------------------
-------------------------TOP CLAUSE IN SQL------------------------
SYNTEX
SELECT TOP (NUMBER PERCENT) COLUMN_NAME(S) -------------TOP 10 OR TOP PERCENTAGE
FROM TABLE_NAME 
WHERE CONDITION
gROUP BY
ORDER BY COLUMN NAME
------------------------------------------
--GET THE TOP 5 CUSTOMER BY SALES

SELECT TOP 5 [Customer Name],[Order Date],[Product Name],Sales FROM Orders$
ORDER BY SALES DESC

SELECT * FROM Orders$
lIMIT BY 5-----------------------IN OTHER DATABASE
-----------------------------------------------------

SELECT TOP 3 [Customer Name],Profit,Region FROM Orders$
ORDER BY Profit dESC
;
----------------------------------------------Day 9 -----------------------------------------------------------
-------------------------Stored procedure-------------------------------------------
Select * from Orders$

---Syntex
Create Procedure Procedure_name
@parameter1 datatype--------@ means Declaring Parameter
@parameter2 datatype--------------you can use multipal parameters
as --------------connecting key word
Begin----------------from this the actual Statement and query
SQL Statements
END

----------------------------------------------------------
--1.Get the sales Summary
CREATE PROCEDURE GET_SALES_SUMMARY
AS
BEGIN
SELECT
SUM(SALES) AS TOTAL_SALES,
COUNT(*) AS TOTAL_ORDERS,
AVG(SALES) AS AVERAGE_SALES
FROM Orders$
END

Exec GET_SALES_SUMMARY---------------to veiw the Stored procedure use this commend----------

Drop procedure GET_SALES_SUMMARY-----------------to drop the procedure
------------------------------------------------------------------------------------------------
---2. Customer order by region

CREATE PROCEDURE Cust_Orders_by_Region
    @REGION VARCHAR(100)
AS
BEGIN
    SELECT [Customer Name],
           COUNT(*) AS Orders_Count,
           SUM(Sales) AS Total_Sales,
           REGION
    FROM Orders$
    WHERE Region = @Region
    GROUP BY [Customer Name],Region
    ORDER BY Total_Sales DESC
END 

 EXEC Cust_Orders_by_Region
 @REGION = 'SOUTH'------------TO CHECK THE QUERY
 
Drop procedure Cust_Orders_by_Regions

------------------------------------------IF WE HAVE TO SEE MULTIPAL OUTPUT-----------------------------
CREATE PROCEDURE Cust_Orders_by_Regions
    @REGION1 VARCHAR(50),
    @REGION2 VARCHAR(50)
AS
BEGIN
    SELECT [Customer Name],
           COUNT(*) AS Orders_Count,
           SUM(Sales) AS Total_Sales,
           Region
    FROM Orders$
    WHERE Region IN (@REGION1, @REGION2)
    GROUP BY [Customer Name],Region
    ORDER BY Total_Sales DESC
END
;

-- Correct execution with both parameters
EXEC Cust_Orders_by_RegionS 
    @REGION1 = 'South', 
    @REGION2 = 'wEST'

----------------------------------Sub-query----------------------------------------------
-------------1.)Products with above avg Sales having
select * from Orders$

Select [Product ID],[Product Name],avg(Sales) as Avg_Sales-------------------normal query
from Orders$
Where [Product Name]like'%Chair%'--------------% use inside the ''
group by [Product ID],[Product Name]
having avg(Sales) >1000
order by Avg_Sales desc
;

-----------------------
SELECT [Product Name], SALES FROM Orders$
WHERE SALES > 
(SELECT AVG(SALES) FROM Orders$)------------------this is sub query
ORDER BY SALES DESC

-----------------------------------
---2.) Customer in top sales region
Select Distinct Region , [Customer Name]  from Orders$
where Region in 
    (select Region from Orders$---------------Region was driving column
    Group by Region------------------if we skip group by ot will give detail information
    having sum(sales) >10000)----------aggration use here resons to show the  sales 
;
--------------------------------------------------------Day 10-------------------------------------------------

Select * from Orders$

--- syntax
window function()-----------------------we can use aggerate function
    over( -----------------------------we can skip the group by while using Window function
[ partition by column1, column2]
[order by colum3]
[row/range specification]
)
-----------------------------------------------------------
----------sum() with partition by
----syntex by scenario
Sum() (expression)			
OVER (			
    [PARTITION BY group column]------------this is not group by function	
    [ORDER BY sort_column]			
---------------------------------------------------------------------------------
-------Running total of sales by region-----------
Select Region,[Order Date],[Customer Name],Sales,
Sum(Sales) -------------------------Window function	and we have not metion the header	
OVER (	------------------addup sales form first row to current row within each region		
    PARTITION BY Region------------ceate seprate calulation for each region E,C,S,W
    ORDER BY [Order Date]) -----------sort rows by date within each region
as
    Running_Total_as_Region
 from Orders$-------------window function comes under From
 Order by region ,[Order Date]
 ;


 -------MAX() by region-----------
Select Region,[Order Date],[Customer Name],Sales,
MAX(Sales) -------------------------Window function	and we have not metion the header	
OVER (	------------------addup sales form first row to current row within each region		
    PARTITION BY Region------------ceate seprate calulation for each region E,C,S,W
    ORDER BY [Order Date]) -----------sort rows by date within each region
as
    Running_maxTotal_as_Region
 from Orders$-------------window function comes under From
 Order by region , [Order Date] DESC
 ;


  --SHOW MAX SALES IN EACH CATEGORY FOR COMPARISON--
SELECT Category, [Product Name], Sales,---------------firsrt select this
MAX(Sales) OVER ------------------window function
(PARTITION BY Category) AS MAX_SALES_IN_CATEGORY
FROM Orders$
ORDER BY Category, Sales DESC;

  --SHOW MAX SALES IN EACH CATEGORY FOR COMPARISON(using formula)--
SELECT Category, [Product Name], Sales,---------------firsrt select this
MAX(Sales) OVER ------------------window function
(PARTITION BY Category) AS MAX_SALES_IN_CATEGORY,
round(sales/max(Sales) over(partition by Category)*100,2) as Percent_of_Max-------------formula is used 
FROM Orders$
ORDER BY Category, Sales DESC;
----------------------------------------------------------------------------------
----------------------------Rank()	Standard Ranking
--------------------------------------------------------
---------1.)Rank Customer by total sales
Select Top 5 [Customer Name],sum(Sales) as Total_Sales,
Rank() Over (Order by Sum(sales) Desc )as Customer_Sales_Rank ------------------partition is not used
from Orders$
Group by [Customer Name]
Order by Customer_Sales_Rank 
;
--------------------------------------------------------------------------
---------1.)Rank Customer by total sales
Select Top 10[Customer Name],Region,sum(Sales) as Total_Sales,
Rank() Over (Partition By Region Order by Sum(sales) Desc )as Customer_Sales_Rank ------------------partition use for Region 
from Orders$
Group by [Customer Name],Region
Order by Customer_Sales_Rank 
;

Select Top 100[Customer Name],Region,sum(Sales) as Total_Sales,
Rank() Over (Partition By Region Order by Sum(sales) Desc )as Customer_Sales_Rank,
Dense_Rank() Over (Partition By Region Order by Sum(sales) Desc )as Customer_Sales_Dense 
from Orders$
Group by [Customer Name],Region
Order by Customer_Sales_Rank 
;

-----------------------------------------Update function-------------------------------------
--------------------Simple Update
---------------------Add order size category based on quauitiy
select Category,Order_Size_Category,[Order Date] from Orders$
Update Orders$----------Using this we can add the column
Set Order_Size_Category = case
    When Quantity = 1 Then 'Signle Item'
    When Quantity Between 2 and 5 Then 'Small Order'
    When Quantity Between 6  and 10 Then 'Medium Order'
    When Quantity > 10 Then 'Large Order'
    Else 'unknown'
End
where Order_Size_Category is Null

Alter table orders$
add Order_Size_Category Char(100)----------------add this Colume in table

------------------------------------------------Q nad A-------------------------------------------------
---Get Customer Name Ship mode Sales when ship mode is standard class

Select [Customer Name],[Ship Mode],
Sum(Sales) as Total_sales 
from Orders$
Where [Ship mode] = 'Standard Class'
group by [Customer Name],[Ship Mode] 

----------Class 
Select [Customer Name],[Ship Mode],Sales 
from Orders$
Where [Ship mode] = 'Standard Class'
;
----Fatch Total Profit by region

Select [Product Name],Sum(Profit) as Total_Profit, Region 
from Orders$
group by [Product Name],Region
order by Total_Profit 

----------Class
Select Region,sum(Profit) as Total_profit from Orders$
group by Region

--Remove order with quantiy less  then 5
Delete  from Orders$
EMAIL_ID = Null

select * from Orders$

---Query to find duplicate order_id count
Select [Order ID], count(*) as Duplicate_Count from Orders$
group by [Order ID]
Having count(*)>1
