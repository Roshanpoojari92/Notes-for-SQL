CREATE DATABASE JOINS;

use JOINS

------------------------------DAY 4---------------------------------------------------
--------(WE ARE CREATING TWO TABLE MEMBERS AND BOOKS) and learn CONSTRAINTS--------------------------

CREATE TABLE MEMBERS
(
MEMBER_ID INT PRIMARY KEY,-------CONSTRAINTS (NOT NULL AND UNIQUE)
NAMES VARCHAR(100) NOT NULL,-----CONSTRAINTS
CITY CHAR (50),
EMAIL_ID VARCHAR(100) UNIQUE ------------CONSTRAINTS
)
;
CREATE TABLE BOOKS
(
BOOK_ID INT,
TITAL CHAR(150),
AUTHOR CHAR(50),
MEMBER_ID INT FOREIGN KEY REFERENCES MEMBERS,---------------FOREIGN KEY with references
ISSUESED_DATE DATE,
DUE_DATE DATE
)
;

SELECT * FROM MEMBERS;---------------PRIMARY KEY
SELECT * FROM BOOKS;-----------------FOREIGN KEY

------------------------------Composite key example(DONT RUN QUERY)-------------------------------------------------------
(
Create table table_name
emp_id int PRIMARY KEY(EMP_ID,CITY),
city Numbers in,
salary money
)
---------------------------------------------------------------------------------------------
------------------------CREATED MEMBERS TABLE USNING INSERT INTO TABLE_NAME VALUES------------------------------------------
INSERT INTO MEMBERS VALUES--------------------VALUES IS IMPORTANt WHILE INSERTING TableE DETAILS--------------------
(01,'TOM','CHINCHWAD','TOM@BABA.COM'),
(02,'JOM','PIMPRI','JOM@BABA.COM'),
(03,'KOM','KESHVNAGAR','KOM@BABA.COM'),-------NO BOOKS ISSUESED
(04,'COM','PUNE','COM@BABA.COM'),
(05,'ROM','MUMBAI','ROM@BABA.COM'),-------NO BOOKS ISSUESED
(06,'SOM','PUNE','SOM@BABA.COM')
;
-------------------------CREATED BOOKS TABLE USNING INSERT INTO TABLE_NAME VALUES
INSERT INTO BOOKS VALUES
(101,'THE ALCHEMIST', 'PAULO COLRA', 01,'2025-08-10','2025-08-27'), 
(102,'THE JUMBO', 'JAMBU BABA', 02,'2025-05-10','2025-05-12'), 
(103,'THE RONADINO', 'MARK BRAKE', NULL,'2025-09-12',NULL), 
(104,'THE MESSI', 'MESSI ', 04,'2025-06-06','2025-06-18'), 
(105,'THE DHONI', 'DHONI WIFE', NULL,'2025-07-08',NULL), 
(106,'THE SACHIN', 'ANJALI TENDULKAR', 06,'2025-04-23','2025-04-30')
;

---------------------------INNER JOIN (aliash means shorcut name as BK and MB)----------------------------------------
SELECT * FROM BOOKS BK-------------LEFT TABLE
INNER JOIN
MEMBERS MB-------------------------RIGHT TABLE
ON
BK.MEMBER_ID=MB.MEMBER_ID
;
---------------------------------------------------------------------------------------------------------------
---------------1. Shows only rows where MEMBER has borrowed a book------------------
SELECT BK.MEMBER_ID,BK.AUTHOR,
MB.NAMES,MB.CITY 
FROM BOOKS BK---- BK AND MB IS ALIASHE
INNER JOIN
MEMBERS MB
ON
BK.MEMBER_ID=MB.MEMBER_ID
;
-----------------------------------
-------------------------------------LEFT JOIN--------------------------------------
----.2 ALL BOOKS MEMBERS IF BORROWED---------------------
SELECT B.BOOK_ID,B.TITAL,B.AUTHOR,--------LEFT TABLE 
M.MEMBER_ID, M.NAMES --------------------RIGHT TABLE
FROM BOOKS B
LEFT JOIN
MEMBERS M
ON
B.MEMBER_ID=M.MEMBER_ID
;

use JOINS

-------------------------------RIGHT JOIN------------------------------------------
-----3 ALL  MEMBERS BOOKS IF BORROWED----------------------------------------
SELECT MB.MEMBER_ID,MB.NAMES, MB.CITY,----------------RIGHT JOIN
BK.ISSUESED_DATE, BK.TITAL----------------------------LEFT JOIN
FROM MEMBERS MB 
RIGHT JOIN
BOOKS BK
ON
MB.MEMBER_ID=BK.MEMBER_ID
;
-------------
SELECT BK.BOOK_ID,BK.TITAL, 
MB.NAMES, MB.EMAIL_ID
FROM BOOKS BK
RIGHT JOIN
MEMBERS MB
ON 
BK.MEMBER_ID=MB.MEMBER_ID
;
----------------------FULL JOINS------------------------------------
---4. ALL BOOKS AND ALL MEMBERS
SELECT * FROM BOOKS B
FULL JOIN
MEMBERS M
ON
B.MEMBER_ID=M.MEMBER_ID
;

-----------------------CROSS JOINS-----------------------------------
SELECT * FROM BOOKS B
CROSS JOIN
MEMBERS M
;

----------------------------------------------------DAY 5 RECAP-----------------------------------------------------
-----------------------CREATE 3 TABLE(PATIENTS/DOCTORS/APPOINTMENTS -----------------------------------
------PATIENTS TABLE
CREATE TABLE PATIENTS
(
PATIENTE_ID INT PRIMARY KEY,
FRIST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),----TYPE CORRECT SPELLINGS VARCHAR
DATE_OF_BIRTH DATE,
PHONE_NO BIGINT,
LOCATIONS VARCHAR(70),
INSURANCE_ID VARCHAR(100),
REGISTRAION_DATE DATE
)
;
----------------------------------------------------------------
------DOCTOR TABLE
CREATE TABLE DOCTORS
(
DOCTOR_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(100) UNIQUE,
LAST_NAME VARCHAR(100),
SPECIALTIY VARCHAR(50),
CITY CHAR(50),
YEARS_OF_EXPn INT,
GENDER CHAR(1)
)
;
---------------------------------------------------------------
--------------APPOINTMENTS TABLE
CREATE TABLE APPOINTMENTS
(
APP_ID INT PRIMARY KEY,
PATIENT_ID INT FOREIGN KEY REFERENCES PATIENTS,
DOCTOR_ID INT FOREIGN KEY REFERENCES DOCTORS,
APP_DATE DATE,
APP_TYPE VARCHAR(50),
APP_STATUS VARCHAR(100),
BILLING_AMOUNT DECIMAL(8,2)----------------DECIMAL USE 8 MEANS NUMBERS AND 2 MEANS AFTER DECIMAL POINT-------------
)
;
------------------------------------------INSERT THE DATE IN TABLE
SELECT * FROM PATIENTS
SELECT * FROM DOCTORS
SELECT * FROM APPOINTMENTS

 Insert into Patients values
 (1,'JOHN', 'SMITH', '1975-05-15', 8000800088, 'NEW YORK', 1001,'2025-08-16'),
 (2,'TOM', 'JMITH', '1985-06-19', 8000800087, 'PUNE', 1002,'2025-08-11'),
 (3,'ROM', 'AMITH', '1979-10-15', 8000800089, 'MUMBAI', 1003,'2025-08-12'),
 (4,'JOM', 'TMITH', '1976-09-18', 8000800079, 'UDUPI', 1004,'2025-08-19'),
 (5,'COM', 'PMITH', '1999-08-28', 8000800050, 'MANGLORE', 1005,'2025-08-01'),
 (6,'DOM', 'OMITH', '1993-05-30', 8000800090, 'BANGLORE', 1006,'2025-08-05'),
 (7,'POM', 'RMITH', '1978-07-01', 8000800050, 'JAMNAGAR', 1007,'2025-08-08'),
 (8,'LOM', 'FMITH', '1998-06-04', 8000800456, 'DEHLI', 1008,'2025-08-07'),
 (9,'AOM', 'LMITH', '1979-11-19', 8000800789, 'CAHNDIGHAD', 1009,'2025-08-13'),
 (10,'GOM', 'RMITH', '1954-12-03', 8000800987, 'SATATRA', 1010,'2025-08-14')
 ;

 INSERT INTO Doctors VALUES
(1, 'ROSHAN', 'POOJARI', 'Cardiologist', 'NEW_YORK', 10, 'M'),
(2, 'SAJEENA', 'POOJARI', 'Pediatrician', 'UDUPI', 9, 'F'),
(3, 'UDAY', 'POOJARI', 'Gynecologist', 'PUNE', 2, 'M'),
(4, 'RAVI', 'POOJARI', 'Dermatologist', 'MANGLORE', 3, 'M'),
(5, 'KRISHVI', 'POOJARI', 'Orthopedic Surgeon', 'JAPAN', 15, 'F');
;

INSERT INTO APPOINTMENTS VALUES
(201,1,2,'2025-08-08','Check-up','Done',1500.00),
(202,2,1,'2025-09-10','Follow_up','not-completed',500.00),
(203,3,2,'2025-10-01','Emergancy','Done',1600.00),
(204,4,5,'2025-02-09','Follow-up','Done',1550.00),
(205,5,4,'2025-03-11','Check-up','not-completed',1750.00),
(206,6,2,'2025-06-12','Check-up','not-completed',2000.00),
(207,7,3,'2025-07-15','Check-up','Done',1890.00)
;

SELECT * FROM PATIENTS
SELECT * FROM DOCTORS
SELECT * FROM APPOINTMENTS

--------------------------------------------------------------------------------------------------
---------------------INNER JOIN : CONNECTING 3 TABLE( TO FETCH ONLY COMMON DATA BETWEEN 3 TABLES)----------------
SELECT APP.APP_DATE AS APPOINTMENT_DATE,-------------APPOINTMENT TABLE( AS COMMAND CHANGE TABLE GENRIC NAME )
PA.FRIST_NAME AS PATIENTS_NAMES,PA.LOCATIONS AS AREAS,-------PATIENTS TABLE
DA.SPECIALTIY,DA.DOCTOR_ID -------DOCTOR TABLE
FROM APPOINTMENTS AS APP
INNER JOIN-------------------------------------------------------ALL COMMON IS SHOWS IN TABLE
PATIENTS AS PA--------------FIRST JOIN
ON
APP.PATIENT_ID=PA.PATIENTE_ID
INNER JOIN
DOCTORS AS DA---------------SECOND JOIN
ON
PA.DOCTOR_ID=DA.DOCTOR_ID
;

-------------------------INSERT THE COMMON COLUMN IN PATIENTS TABLE AS DOCTOR_ID BY USING ALTER TABLE 
ALTER TABLE PATIENTS
ADD DOCTOR_ID INT;

------------------------------LEFT JOIN------------------------------------------------------------
SELECT A.APP_DATE AS [APPOINTMEN DATE] ,A.APP_STATUS AS STATUS, 
P.FRIST_NAME ,P.REGISTRAION_DATE, 
D.DOCTOR_ID , D.SPECIALTIY,D.FIRST_NAME   
FROM APPOINTMENTS A
LEFT JOIN-----------------------------APPOINTMENT IS LEFT JOIN  SO TABLE SHOWS AS 7 ROWS
PATIENTS P
ON
A.PATIENT_ID =P.PATIENTE_ID
INNER JOIN
DOCTORS D
ON
A.DOCTOR_ID=D.DOCTOR_ID
;

----------------------------------------------------RIGHT JOIN

SELECT P.PATIENTE_ID ,P.FRIST_NAME, 
A.APP_DATE,A.BILLING_AMOUNT,
D.FIRST_NAME,D.SPECIALTIY 
FROM PATIENTS P
RIGHT JOIN-----------------------------
APPOINTMENTS A
ON
P.PATIENTE_ID =A.PATIENT_ID
INNER JOIN
DOCTORS D
ON
P.DOCTOR_ID=D.DOCTOR_ID
;

----------------------------------STRING FUNCTION-----------------------------------------
USE JOINS

SELECT * FROM PATIENTS
SELECT * FROM DOCTORS
SELECT * FROM APPOINTMENTS

------------------------CONCAT SYNTEX (COLUMN NAME1,'  ',COULUMN NAME2)-----------------------------
SELECT CONCAT(FRIST_NAME,'  ',LAST_NAME) AS FULL_NAME ----------------AS IS IMPORTANT FOR TITLE NAME OF COLUMN
FROM PATIENTS;

------------------------UPPER--------------------------------------------------------------------
SELECT UPPER(APP_STATUS) AS STATUS
FROM APPOINTMENTS;

--------------LOWER-------------------------------------------------------------------------
SELECT LOWER(FIRST_NAME) AS first_name
FROM DOCTORS;

--------------LEFT AND RIGHT---------------------------------------------
SELECT 
left(PHONE_NO,3) as first_3_digit, 
right(PHONE_NO,5)as last_5_digit	 
FROM PATIENTS;
----------------------------len-----------------------------
SELECT LEN(SPECIALTIY) AS LEN_OF_SPECIALTIY FROM DOCTORS;

----------------------------REPLACE--------------------------------------
SELECT PHONE_NO FROM PATIENTS;



--------------------------------------------Day 8---------------------------------------------------
use JOINS------------------------Use the Database

select * from DOCTORS

Create View Appointment_Details
AS
Select Aap.APP_DATE, Aap.APP_STATUS, Dr.FIRST_NAME,dr.SPECIALTIY 
from APPOINTMENTS Aap
Join-------------------------use Join in View
DOCTORS Dr
on 
Aap.DOCTOR_ID=Dr.DOCTOR_ID
Where Dr.SPECIALTIY in ( 'Pediatrician','Cardiologist')--------- we can use where Clause 
;
Drop View Appointment_Details-----------------if i want to have change anything in View you should be drop it

Select * from Appointment_Details

----------------Creating Views based on multipal Table

CREATE VIEW VIEW NAME--------------------------Step 2 
AS
SELECT * FROM TABLE 1-----------------------Step 1 frist start from Select
JOIN
TABLE 2---------------------------Step 3
ON
TABLE1 KEY TABLE2
-------------------------------------------------------------------------
-------------------------Create view joining Orders and Retunes---------------------
