--0 DATABASE
--creating database

CREATE DATABASE SQLPRACTICE

--1 CREATE
--SQL query to create WORKER Table

CREATE TABLE WORKER(
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);1

--2 ROUGH VALUES INSERT INTO WORKER 
--SQL Query to insert above values in WORKER Table

INSERT INTO WORKER(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT
)VALUES
(1,'AMIT','SINGH',1000,'2019-03-20 09:00:00','AHR'),
(2,'BMIT','SINGH',2000,'2019-03-20 09:00:00','BHR'),
(3,'CMIT','SINGH',3000,'2019-03-20 09:00:00','CHR'),
(4,'DMIT','SINGH',4000,'2019-03-20 09:00:00','DHR'),
(5,'EMIT','SINGH',5000,'2019-03-20 09:00:00','EHR'),
(6,'FMIT','SINGH',6000,'2019-03-20 09:00:00','FHR'),
(7,'GMIT','SINGH',7000,'2019-03-20 09:00:00','GHR'),
(8,'HMIT','SINGH',8000,'2019-03-20 09:00:00','HHR')
;

--3 DELETE COMMAND TO DELETE WHOLE DATA FROM TABLE

DELETE FROM WORKER;

--4 INSERT USEFULL DATA

INSERT INTO WORKER(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT
)VALUES
(1,'AMIT','SINGH',1000,'2019-03-20 09:00:00','HR'),
(2,'SUNIL','YADAV',2000,'2020-03-20 09:00:00','TALENT'),
(3,'SANJU','SRIVASTAVA',3000,'2018-03-20 09:00:00','HR'),
(4,'ASHOK','SRIVASTAVA',4000,'2021-03-20 09:00:00','SUPPORT'),
(5,'AJAY','SINGH',4000,'2019-03-20 09:00:00','QA'),
(6,'ANIL','YADAV',6000,'2023-03-20 09:00:00','DEVOPS'),
(7,'SHIV','TIWARI',6000,'2020-03-20 09:00:00','QA'),
(8,'DEVA','PANDEY',8000,'2022-03-20 09:00:00','HR');


--5 FORIEGN KEY
--SQL Query to create table Title which has WORKER_REF_ID as foreign key

CREATE TABLE TITLE(
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY(WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) ON DELETE CASCADE);
--NOTE-The ON DELETE CASCADE option in SQL is used to automatically delete rows in a child table when the corresponding row in the parent table is deleted.

--6 INSERT DATA IN TITLE TABLE

INSERT INTO TITLE (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(1, 'Manager', '2021-02-20 00:00:00'),
(2, 'Executive', '2021-06-11 00:00:00'),
(8, 'Executive', '2021-06-11 00:00:00'),
(5, 'Manager', '2021-06-11 00:00:00'),
(4, 'Asst. Manager', '2021-06-11 00:00:00'),
(7, 'Executive', '2021-06-11 00:00:00'),
(6, 'Lead', '2021-06-11 00:00:00'),
(3, 'Lead', '2021-06-11 00:00:00');


--7 CREATE TABLE JOB GRADE

CREATE TABLE JOB_GRADES(
GRADE_LEVEL CHAR(2),
LOWEST_SAL INT,
HIGHEST_SAL INT
);

INSERT INTO JOB_GRADES(GRADE_LEVEL,LOWEST_SAL,HIGHEST_SAL)VALUES
('A',1000,2999),
('B',3000,4999),
('C',5000,8000);


--8 CLONE
--a SQL query to clone a new table WorkCopy from another table.SELECT * INTO WorkerCopy FROM WORKER;--9 ALIAS--SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;--10 UPPER/LOWER--a SQL query to fetch “FIRST_NAME” from Worker table in upper case.SELECT LOWER(FIRST_NAME) FROM WORKER;SELECT UPPER(FIRST_NAME) FROM WORKER;--11 DISTINCT--an SQL query to fetch unique values of DEPARTMENT from Worker table. SELECT DISTINCT DEPARTMENT FROM WORKER;--12 REPLACE--a SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’SELECT REPLACE(FIRST_NAME,'M','N') FROM WORKER;--13 CONCAT--a SQL query to print the FIRST_NAME and LAST_NAMEfrom Worker table into a single column COMPLETE_NAME. Aspace char should separate them.SELECT CONCAT(FIRST_NAME,'',LAST_NAME) AS 'COMPLETE_NAME' FROM WORKER;--14 ORDER BY ASC/DESC--a SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;SELECT * FROM WORKER ORDER BY FIRST_NAME DESC;--15 IN/NOT IN--a SQL query to print details for Workers with the first name as “Rahul” and “Lavesh” from Worker tableSELECT * FROM WORKER WHERE FIRST_NAME IN('ASHOK','SHIV');SELECT * FROM WORKER WHERE FIRST_NAME NOT IN('ASHOK','AJAY');--16 LIKE 'S%'--a SQL query to print details of the Workers whose FIRST_NAME starts with ‘S’.SELECT * FROM WORKER WHERE FIRST_NAME LIKE 'S%';--17 LIKE '%A%'--a SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%D%';--18 LIKE '%N'--a SQL query to print details of the Workers whose FIRST_NAME ends with 'n’.SELECT * FROM WORKER WHERE SALARY LIKE '4%';--19 LIKE_--a SQL query to print details of the Workers whose FIRST_NAME ends with ‘l’ and contains five alphabets.SELECT * FROM WORKER WHERE FIRST_NAME LIKE '___V';--20 BETWEEN --a SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.SELECT * FROM WORKER WHERE SALARY BETWEEN 4000 AND 8000;--21 DATE --a SQL query to print details of the Workers who have joined in Mar’2019.SELECT * FROM WORKER WHERE YEAR(JOINING_DATE)=2019 AND MONTH(JOINING_DATE)=3;--22 CURR DATE --a SQL query to show the current date and time.SELECT GETDATE();  --FOR SQL SERVER--23 COUNT--a SQL query to fetch the count of employees working in the department ‘Admin’.SELECT COUNT(*) FROM WORKER WHERE DEPARTMENT = 'HR';--24 GROUP BY--a SQL query to fetch the no. of workers for each department in the descending order.SELECT DEPARTMENT,COUNT(WORKER_ID) AS NO_OF_WORKERS FROM WORKERGROUP BY DEPARTMENTORDER BY NO_OF_WORKERS DESC;--25 GROUP BY--a SQL query to fetch departments along with the total salaries paid for each of them.SELECT DEPARTMENT , SUM(SALARY) AS TOTAL_SAL FROM WORKER GROUP BY DEPARTMENT;--26 GROUP BY--a SQL query to show all departments along with the number of people in there.SELECT DEPARTMENT,COUNT(DEPARTMENT) AS 'N0_OF_WORKERS'FROM WORKER GROUP BY DEPARTMENT;--27 HAVING--a SQL query to fetch the departments that have less than five People in it.SELECT DEPARTMENT, COUNT(WORKER_ID) AS 'NO_OF_WORKERS'FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID)<3;--28 UNION ALL-- a SQL query to show one row twice in results from a table with department 'HR'.SELECT FIRST_NAME,DEPARTMENT FROM WORKER W WHERE W.DEPARTMENT='HR'UNION ALLSELECT FIRST_NAME, DEPARTMENT FROM WORKER W1 WHERE W1.DEPARTMENT='HR';--29 SUBQUERRY--a SQL query to fetch the names of workers who earn the highest salary. SELECT FIRST_NAME, SALARY FROM WORKER WHERE SALARY =(SELECT MAX(SALARY) FROM WORKER);--30 SUBQUEERY--a SQL query to show the second highest salary from A table.SELECT MAX(SALARY) FROM WORKER WHERE SALARYNOT IN (SELECT MAX(SALARY) FROM WORKER);--31 TOP--a SQL query to show the top n (say 10) records of a table.SELECT TOP 10 * FROM WORKER ORDER BY SALARY DESC; --32 SUBQUERY--a SQL query to determine the 3rd highest salary without using TOP or limit method.SELECT SALARY
FROM WORKER W1
WHERE 3= (
SELECT COUNT( DISTINCT ( W2.SALARY ) )
FROM WORKER W2
WHERE W2.SALARY >= W1.SALARY
);--33 SUBQUERY--a SQL query to fetch three max salaries from a tableSELECT distinct SALARY from WORKER a WHERE 3 >= (SELECT
count(distinct SALARY) from WORKER b WHERE a.SALARY <= b.SALARY)
order by a.SALARY desc;--34 CROSS JOIN--a SQL query to fetch the list of employees with the same salary.SELECT DISTINCT W.WORKER_ID, W.FIRST_NAME,W.SALARYFROM WORKER W, WORKER W1WHERE W.SALARY=W1.SALARYAND W.WORKER_ID!=W1.WORKER_ID;--35 INNER JOIN--a SQL query to print details of the Workers who are also MANAGER.SELECT DISTINCT W.FIRST_NAME,T.WORKER_TITLE FROM WORKER WINNER JOIN TITLE TON W.WORKER_ID=T.WORKER_REF_ID AND WORKER_TITLE IN ('MANAGER');--36 INNER JOIN--a SQL query to find the first name, last name, salary, and job grade for all employees. SELECT W.FIRST_NAME,W.LAST_NAME,W.SALARY,J.GRADE_LEVELFROM WORKER W JOIN JOB_GRADES J ONW.SALARY BETWEEN J.LOWEST_SAL AND J.HIGHEST_SAL;--37 INNER JOIN--a SQL query to compute the average salary of Workers for each job titleSELECT T.WORKER_TITLE, AVG(W.SALARY) AS AVERAGE_SALARY
FROM WORKER W
INNER JOIN TITLE T ON W.WORKER_ID = T.WORKER_REF_ID
GROUP BY T.WORKER_TITLE;
--38 INNER  JOIN--a SQL query to print the name of employees having the highest salary in each department.SELECT T.DEPARTMENT,T.FIRST_NAME,T.SALARY FROM(SELECT MAX(SALARY) AS TOTALSALARY,DEPARTMENT FROM WORKERGROUP BY DEPARTMENT) AS TEMPNEW INNER JOIN WORKER T ON TEMPNEW.DEPARTMENT=T.DEPARTMENTAND TEMPNEW.TOTALSALARY=T.SALARY;--39 VIEWCREATE VIEW HRSTAFF AS
SELECT * FROM WORKER
WHERE DEPARTMENT = 'HR';

SELECT * FROM HRSTAFF; --CHECK THIS SEPRATELY

--40 ALTER
ALTER TABLE WORKER ADD AGE INT;

--40A UPDATE
UPDATE WORKER
SET AGE =   CASE WORKER_ID
            WHEN 1 THEN 23
            WHEN 2 THEN 22
            WHEN 3 THEN 20
            WHEN 4 THEN 22
            WHEN 5 THEN 20
            WHEN 6 THEN 25
            WHEN 7 THEN 26
            WHEN 8 THEN 25
          END;


SELECT * FROM WORKER;