#Exp-2

1.

INSERT INTO SALESMEN (SID, SNAME, CITY, COMM) 
VALUES ('S101', 'AJAY PATEL', 'AHMEDABAD', 1200);
OP : INSERT 0 1
 
INSERT INTO SALESMEN (SID, SNAME, CITY, COMM) 
VALUES ('S102', 'CHINTAN SHAH', 'BARODA', 1500);
OP : INSERT 0 1
 
INSERT INTO SALESMEN (SID, SNAME, CITY, COMM) 
VALUES ('S103', 'VINAY MEHRA', 'PUNE', 1200);
OP : INSERT 0 1
 
INSERT INTO SALESMEN (SID, SNAME, CITY, COMM) 
VALUES ('S104', 'JAY PANDEY', 'SURAT', 800);
OP : INSERT 0 1
 
INSERT INTO SALESMEN (SID, SNAME, CITY, COMM) 
VALUES ('S105', 'JIMIT DAVE', 'MUMBAI', 300);
OP : INSERT 0 1
 
INSERT INTO SALESMEN (SID, SNAME, CITY, COMM) 
VALUES ('S106', 'MANAN GANDHI', 'AHMEDABAD', 1200);
OP : INSERT 0 1
 
2.

INSERT INTO CUSTOMERS(CID, CNAME, CITY, CLASS)
VALUES 
('C301', 'NIRAV PATEL', 'NADIAD', 'B'),
('C302', 'KIRAN DAVE', 'DELHI', 'A'),
('C303', 'SAPAN SHAH', 'BANGLORE', 'B'),
('C304', 'SAURABH MEHTA', 'BARODA', 'C'),
('C305', 'SMRITI MISHRA', 'AHMEDABAD', 'B'),
('C306', 'HARSHAL PANDYA', 'MUMBAI', 'A'),
('C307', 'SUNIL GANDHI', 'BARODA', 'B'),
('C308', 'BIMAL THAKKAR', 'SURAT', 'C');
OP : INSERT 0 8
 
3.

INSERT INTO ORDERS (OID, CID, SID, ODATE,O_AMT)
VALUES
('O501', 'C302', 'S102', '02-JAN-09', 700000),
('O502', 'C301', 'S105', '21-JAN-09', 10000),
('O503', 'C308', 'S103', '10-FEB-09', 250000),
('O504', 'C306', 'S104', '14-FEB-09', 400000),
('O505', 'C306', 'S102', '29-MAR-09', 100000),
('O506', 'C303', 'S101', '15-APR-09', 90000.05),
('O507', 'C304', 'S105', '24-JUN-09', 7500.75),
('O508', 'C306', 'S101', '27-SEP-09', 900000),
('O509', 'C302', 'S102', '21-DEC-09', 205000),
('O510', 'C307', 'S102', '30-DEC-09', 27800),
('O511', 'C303', 'S104', '31-DEC-09', 15000);
OP : INSERT 0 11
 

==> solved queries : 
1. SELECT * FROM SALESMEN;
OP:
 sid  |    sname     |   city    | salary | product | tgttoget |  comm   | country
------+--------------+-----------+--------+---------+----------+---------+---------
 S101 | AJAY PATEL   | AHMEDABAD |        |         |          | 1200.00 |
 S102 | CHINTAN SHAH | BARODA    |        |         |          | 1500.00 |
 S103 | VINAY MEHRA  | PUNE      |        |         |          | 1200.00 |
 S104 | JAY PANDEY   | SURAT     |        |         |          |  800.00 |
 S105 | JIMIT DAVE   | MUMBAI    |        |         |          |  300.00 |
 S106 | MANAN GANDHI | AHMEDABAD |        |         |          | 1200.00 |
(6 rows)

2. SELECT * FROM SALESMEN WHERE CITY='MUMBAI' OR CITY='PUNE';
OP:
 sid  |    sname    |  city  | salary | product | tgttoget |  comm   | country
------+-------------+--------+--------+---------+----------+---------+---------
 S103 | VINAY MEHRA | PUNE   |        |         |          | 1200.00 |
 S105 | JIMIT DAVE  | MUMBAI |        |         |          |  300.00 |
(2 rows)

3. SELECT CID,CNAME FROM CUSTOMERS WHERE CLASS='A';
OP:
 cid  |     cname
------+----------------
 C302 | KIRAN DAVE
 C306 | HARSHAL PANDYA
(2 rows)

4. 
ALTER TABLE SALESMEN ADD COLUMN COUNTRY VARCHAR(20);
OP: ALTER TABLE
ALTER TABLE CUSTOMERS ADD COLUMN COUNTRY VARCHAR(20);
OP: ALTER TABLE

5. UPDATE CUSTOMERS SET CITY='SURAT' WHERE CNAME='SUNIL GANDHI';
OP : UPDATE 1

6. SELECT * FROM CUSTOMERS WHERE CITY='BARODA';
OP: 
 cid  |     cname     |  city  | state | pincode | product | class | country
------+---------------+--------+-------+---------+---------+-------+---------
 C304 | SAURABH MEHTA | BARODA |       |         |         | C     |
(1 row)

7. SELECT SNAME FROM SALESMEN WHERE SALARY>20000;
OP:
 sname
-------
(0 rows)

8. UPDATE ORDERS SET O_AMT=500000 WHERE OID='O501';
OP:
UPDATE 1
 
9. SELECT OID,ODATE FROM ORDERS WHERE SID='S102';
OP:
 oid  |   odate
------+------------
 O505 | 2009-03-29
 O509 | 2009-12-21
 O510 | 2009-12-30
 O501 | 2009-01-02
(4 rows)


