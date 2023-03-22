create database SQLTASK5
USE SQLTASK5


create table Trainees(
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

insert into Trainees values(001,'Niharika','Verma', 80000,'2023-03-20','Admin')
insert into Trainees values(002,'Niha','rema', 90000,'2023-03-20','HR')
insert into Trainees values(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

SELECT * FROM Trainees


--  1.COUNT OF EMPLOYEES BY EACH DEPARTMENT--

SELECT COUNT(TRAINEE_ID) as 'No of Employees',DEPARTMENT FROM Trainees GROUP BY DEPARTMENT;

--2.DATE ADDING BY 5 --

SELECT DATEADD(DAY,5,JOINING_DATE)AS INDUCTIONPROGRAM FROM Trainees

--3.CHOOSE ALONG WITH CAST FUNCTION--

SELECT cast(JOINING_DATE as date) as 'JOINED DATE' ,
choose(month([JOINING_DATE]),'January','February','March','April','May','June','July','August','September','October','November','December') AS JOINING_MONTH 
FROM Trainees

--4.EACH DEPARTMENT SALARY TOTAL --

SELECT 
     COALESCE(DEPARTMENT, 'All DEPARTMENT Total') as DEPARTMENT, SUM(SALARY) AS TotalSalary  
FROM
    Trainees
GROUP BY ROLLUP (DEPARTMENT);

--5.TOP 3 RANDOM ID  --

select top 3 * from Trainees order by newid()


--6.COMPOSITE KEY IMPLEMENTATION   --

Create table STUDENTs (
name varchar(20),
phoneno int,
fathermobile int,
CONSTRAINT My_Composite_Key2 PRIMARY KEY (name,fathermobile)
);

-- 7.a) SIMPLE CASE STATEMENT  --

SELECT TRAINEE_ID,DEPARTMENT,SALARY,
CASE DEPARTMENT 
    WHEN 'ADMIN' THEN 'PROMOTED TO PROJECT LEAD'  
    WHEN 'Tester' THEN 'PROMOTED TO CGVAK DESIGNER DEPARTMENT'  
    WHEN 'HR' THEN 'CGVAK HR DEPARTMENT'  
    ELSE 'CGVAK LEAD DEPARTMENT'  
END AS DEPARTMENT FROM Trainees

--8.b) IIF STATEMENT  --

SELECT TRAINEE_ID,SALARY, IIF(SALARY>80000, 'MORE EXPERIENCE', 'LESS EXPERIENCE') as Result FROM Trainees;

-- 9.SEQUENCE CREATION   --

 CREATE SEQUENCE Empseq
AS INT
START WITH 1 
INCREMENT BY 7 

SELECT * FROM sys.sequences WHERE name = 'Empseq';
INSERT INTO Trainees values (009,'VIKRAM','VIJAY',NEXT VALUE for Empseq,'2023-03-20','HR')
select * from Trainees;

create sequence Id
as int
start with 1
increment by 1

create table Sequence_demo(
ID int primary key ,
NAME varchar(25)
)

insert into Sequence_demo values(next value for Id,'VIKRAM'),(next value for Id,'VIJAY')

SELECT * FROM Sequence_demo

DROP SEQUENCE Id

-- 9.SYNONYMS CREATION   --

CREATE SYNONYM A FOR SQLTASK3.dbo.ADDRESS
SELECT * FROM A
DROP SYNONYM A

--10.IDENTITY --

create table IDEN_DEMO(
ID int IDENTITY(1,1) ,
NAME varchar(25)
)

SET IDENTITY_INSERT IDEN_DEMO OFF;

INSERT INTO IDEN_DEMO(NAME)VALUES('VIKRAM')
SELECT * FROM IDEN_DEMO

SET IDENTITY_INSERT IDEN_DEMO ON;
INSERT INTO IDEN_DEMO(ID,NAME) VALUES(3,'VIJAY')

-----------------------END-----------------
