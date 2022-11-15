====== CREATE TABLE =====

CREATE TABLE EMP_LAB8
(
    ID VARCHAR(10),
    ENAME VARCHAR(30),
    DOJ DATE,
    SALARY NUMERIC(20),
    DEPT VARCHAR(10),
    DEG VARCHAR(15),
    HOD VARCHAR(10),
    CID VARCHAR(10),

    PRIMARY KEY(ID)
);

CREATE TABLE COMPUTER_LAB8
(
    CID VARCHAR(10),
    COMPANY VARCHAR(15),
    MODAL VARCHAR(20),
    MYEAR NUMERIC(4),

    PRIMARY KEY(CID)
);

===== INSERT given DATA ======

INSERT INTO EMP_LAB8
(ID, ENAME, DOJ, SALARY, DEPT, DEG, HOD, CID)
VALUES 
('1', 'James', '01-Jan-15', 90000, 'IT', 'Head', NULL, '1001'),
('2', 'Ethan', '01-Jan-15', 95000, 'IC', 'Head', NULL, NULL),
('3', 'Emily', '01-Aug-15', 60000, 'IT', 'AP', '1', '1002'),
('4', 'Smith', '01-Sep-15', 55000, 'IT', 'ASP', '1', NULL),
('5', 'John', '01-Oct-15', 50000, 'IC', 'AP', '2', '1003');

INSERT INTO COMPUTER_LAB8
( CID, COMPANY, MODAL, MYEAR)
VALUES
('1001', 'Dell', 'Vostro', 2014),
('1002', 'Dell', 'Precision', 2014),
('1003', 'HP', 'Edge', 2013),
('1004', 'HP', 'Horizon', 2014);

===== QUERIES =====

1. Display emp_name, emp_id, hod_name, hod_id.
=>
SELECT E.ID, E.ENAME, H.ID AS HOD_ID, H.ENAME AS HOD_NAME 
FROM 
(SELECT ID, ENAME FROM EMP_LAB8 WHERE ID IS NOT NULL) AS E
LEFT OUTER JOIN
(
    SELECT ID, ENAME FROM EMP_LAB8 WHERE ID IN
    (SELECT HOD FROM EMP_LAB8 WHERE HOD IS NOT NULL)
) AS H
ON E.ID = H.ID;

[ *NOTE: HERE WE CAN'T USE INNER JOIN. THINK ABOUT IT.]
OP:
 id | ename | hod_id | hod_name
----+-------+--------+----------
 1  | James | 1      | James
 2  | Ethan | 2      | Ethan
 4  | Smith |        |
 3  | Emily |        |
 5  | John  |        |
(5 rows)


2. Display id, name of employees other than smith who work in the same department as smith.
=>
SELECT E.ID, E.ENAME FROM EMP_LAB8 E 
WHERE
E.ENAME != 'Smith' AND
E.DEPT = (SELECT DEPT FROM EMP_LAB8 WHERE ENAME = 'Smith');

OP:
 id | ename
----+-------
 1  | James
 3  | Emily
(2 rows)

3. Display emp_name, emp_id, hod_name, hod_id , who has alloted computers and also display the computer company.

SELECT 
E.ID, E.ENAME, H.ID AS HOD_ID, H.ENAME AS HOD_NAME, E.COMPANY AS COMPANY
FROM
(
    SELECT EMP_LAB8.ID, EMP_LAB8.ENAME, COMPUTER_LAB8.COMPANY FROM 
    EMP_LAB8 INNER JOIN COMPUTER_LAB8 
    ON EMP_LAB8.CID = COMPUTER_LAB8.CID
    WHERE 
    EMP_LAB8.ID IS NOT NULL
) AS E
LEFT OUTER JOIN
(
    SELECT EMP_LAB8.ID, EMP_LAB8.ENAME FROM 
    EMP_LAB8 INNER JOIN COMPUTER_LAB8 
    ON EMP_LAB8.CID = COMPUTER_LAB8.CID
    WHERE EMP_LAB8.ID IN 
    (SELECT HOD FROM EMP_LAB8 WHERE HOD IS NOT NULL)
) AS H
ON E.ID = H.ID;

OP:
 id | ename | hod_id | hod_name | company
----+-------+--------+----------+---------
 1  | James | 1      | James    | Dell
 3  | Emily |        |          | Dell
 5  | John  |        |          | HP
(3 rows)

======== OR. ==========

SELECT 
E.ID, E.ENAME, E.COMPANY AS EMP_COMP,
H.ID AS HOD_ID, H.ENAME AS HOD_NAME, H.COMPANY AS H_COMP
FROM
(
    SELECT EMP_LAB8.ID, EMP_LAB8.ENAME, COMPUTER_LAB8.COMPANY FROM 
    EMP_LAB8 INNER JOIN COMPUTER_LAB8 
    ON EMP_LAB8.CID = COMPUTER_LAB8.CID
    WHERE 
    EMP_LAB8.ID IS NOT NULL
) AS E
LEFT OUTER JOIN
(
    SELECT EMP_LAB8.ID, EMP_LAB8.ENAME, COMPUTER_LAB8.COMPANY FROM 
    EMP_LAB8 INNER JOIN COMPUTER_LAB8 
    ON EMP_LAB8.CID = COMPUTER_LAB8.CID
    WHERE EMP_LAB8.ID IN 
    (SELECT HOD FROM EMP_LAB8 WHERE HOD IS NOT NULL)
) AS H
ON E.ID = H.ID;
OP:
 id | ename | emp_comp | hod_id | hod_name | h_comp
----+-------+----------+--------+----------+--------
 1  | James | Dell     | 1      | James    | Dell
 3  | Emily | Dell     |        |          |
 5  | John  | HP       |        |          |
(3 rows)


4. Display name of each slaesman and customers and their city name for which salesman and customer belongs to same city.

SELECT SALESMEN.SNAME, CUSTOMERS.CNAME, CUSTOMERS.CITY FROM
SALESMEN INNER JOIN CUSTOMERS
ON SALESMEN.CITY = CUSTOMERS.CITY;

OP:
    sname     |     cname      |   city
--------------+----------------+-----------
 AJAY PATEL   | SMRITI MISHRA  | AHMEDABAD
 CHINTAN SHAH | SAURABH MEHTA  | BARODA
 JAY PANDEY   | SUNIL GANDHI   | SURAT
 JAY PANDEY   | BIMAL THAKKAR  | SURAT
 JIMIT DAVE   | HARSHAL PANDYA | MUMBAI
 MANAN GANDHI | SMRITI MISHRA  | AHMEDABAD
(6 rows)

5.Make a list with order number, purchase amount, customer name and their for those orders where order amount is in between 50000 & 502000.

SELECT ORDERS.OID, ORDERS.O_AMT, CUSTOMERS.CNAME, CUSTOMERS.CITY
FROM
ORDERS INNER JOIN CUSTOMERS
ON ORDERS.CID = CUSTOMERS.CID
WHERE 
ORDERS.O_AMT BETWEEN 50000 AND 502000;

OP:
 oid  |   o_amt   |     cname      |   city
------+-----------+----------------+----------
 O501 | 500000.00 | KIRAN DAVE     | DELHI
 O509 | 205000.00 | KIRAN DAVE     | DELHI
 O506 |  90000.05 | SAPAN SHAH     | BANGLORE
 O505 | 100000.00 | HARSHAL PANDYA | MUMBAI
 O504 | 400000.00 | HARSHAL PANDYA | MUMBAI
 O503 | 250000.00 | BIMAL THAKKAR  | SURAT
(6 rows)

6. Write sql statements to display with salesmen is working for which customer.

SELECT T1.SID, T1.SNAME, CUSTOMERS.CID, CUSTOMERS.CNAME FROM
(
    SELECT SALESMEN.SID ,SALESMEN.SNAME, ORDERS.CID
    FROM
    SALESMEN INNER JOIN ORDERS
    ON SALESMEN.SID = ORDERS.SID
) T1
INNER JOIN CUSTOMERS
ON T1.CID = CUSTOMERS.CID;

OP:
 sid  |    sname     | cid  |     cname
------+--------------+------+----------------
 S105 | JIMIT DAVE   | C301 | NIRAV PATEL
 S103 | VINAY MEHRA  | C308 | BIMAL THAKKAR
 S104 | JAY PANDEY   | C306 | HARSHAL PANDYA
 S102 | CHINTAN SHAH | C306 | HARSHAL PANDYA
 S101 | AJAY PATEL   | C303 | SAPAN SHAH
 S105 | JIMIT DAVE   | C304 | SAURABH MEHTA
 S101 | AJAY PATEL   | C306 | HARSHAL PANDYA
 S102 | CHINTAN SHAH | C302 | KIRAN DAVE
 S102 | CHINTAN SHAH | C307 | SUNIL GANDHI
 S104 | JAY PANDEY   | C303 | SAPAN SHAH
 S102 | CHINTAN SHAH | C302 | KIRAN DAVE
(11 rows)


