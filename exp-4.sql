#Exp-4 

1. 
SELECT C.CID, C.CNAME, C.CITY,O.O_AMT FROM 
CUSTOMERS C INNER JOIN ORDERS O
ON C.CID = O.CID;

OP:
 cid  |     cname      |   city   |   o_amt
------+----------------+----------+-----------
 C301 | NIRAV PATEL    | NADIAD   |  10000.00
 C308 | BIMAL THAKKAR  | SURAT    | 250000.00
 C306 | HARSHAL PANDYA | MUMBAI   | 400000.00
 C306 | HARSHAL PANDYA | MUMBAI   | 100000.00
 C303 | SAPAN SHAH     | BANGLORE |  90000.05
 C304 | SAURABH MEHTA  | BARODA   |   7500.75
 C306 | HARSHAL PANDYA | MUMBAI   | 900000.00
 C302 | KIRAN DAVE     | DELHI    | 205000.00
 C307 | SUNIL GANDHI   | SURAT    |  27800.00
 C303 | SAPAN SHAH     | BANGLORE |  15000.00
 C302 | KIRAN DAVE     | DELHI    | 500000.00
(11 rows)

2.
SELECT 
SALESMEN.SID, SALESMEN.SNAME, SALESMEN.CITY,SALESMEN.COMM,
ORDERS.OID, ORDERS.CID, ORDERS.ODATE, ORDERS.O_AMT
FROM 
ORDERS INNER JOIN SALESMEN
ON ORDERS.SID = SALESMEN.SID;

OP:
 sid  |    sname     |   city    |  comm   | oid  | cid  |   odate    |   o_amt
------+--------------+-----------+---------+------+------+------------+-----------
 S105 | JIMIT DAVE   | MUMBAI    |  300.00 | O502 | C301 | 2009-01-21 |  10000.00
 S103 | VINAY MEHRA  | PUNE      | 1200.00 | O503 | C308 | 2009-02-10 | 250000.00
 S104 | JAY PANDEY   | SURAT     |  800.00 | O504 | C306 | 2009-02-14 | 400000.00
 S102 | CHINTAN SHAH | BARODA    | 1500.00 | O505 | C306 | 2009-03-29 | 100000.00
 S101 | AJAY PATEL   | AHMEDABAD | 1200.00 | O506 | C303 | 2009-04-15 |  90000.05
 S105 | JIMIT DAVE   | MUMBAI    |  300.00 | O507 | C304 | 2009-06-24 |   7500.75
 S101 | AJAY PATEL   | AHMEDABAD | 1200.00 | O508 | C306 | 2009-09-27 | 900000.00
 S102 | CHINTAN SHAH | BARODA    | 1500.00 | O509 | C302 | 2009-12-21 | 205000.00
 S102 | CHINTAN SHAH | BARODA    | 1500.00 | O510 | C307 | 2009-12-30 |  27800.00
 S104 | JAY PANDEY   | SURAT     |  800.00 | O511 | C303 | 2009-12-31 |  15000.00
 S102 | CHINTAN SHAH | BARODA    | 1500.00 | O501 | C302 | 2009-01-02 | 500000.00

3.
SELECT CUSTOMERS.CID, CUSTOMERS.CNAME, CUSTOMERS.CITY,CUSTOMERS.CLASS 
FROM
ORDERS INNER JOIN CUSTOMERS
ON CUSTOMERS.CID = ORDERS.CID
WHERE SID='S102' OR SID='S105';

OP:
 cid  |     cname      |  city  | class
------+----------------+--------+-------
 C301 | NIRAV PATEL    | NADIAD | B
 C302 | KIRAN DAVE     | DELHI  | A
 C302 | KIRAN DAVE     | DELHI  | A
 C304 | SAURABH MEHTA  | BARODA | C
 C306 | HARSHAL PANDYA | MUMBAI | A
 C307 | SUNIL GANDHI   | SURAT  | B
(6 rows)

4.
SELECT SALESMEN.SID, SALESMEN.SNAME, SALESMEN.CITY, SALESMEN.COMM, CUSTOMERS.CNAME
FROM 
(ORDERS INNER JOIN SALESMEN ON ORDERS.SID=SALESMEN.SID)
INNER JOIN CUSTOMERS ON ORDERS.CID = CUSTOMERS.CID;

OP:
 sid  |    sname     |   city    |  comm   |     cname
------+--------------+-----------+---------+----------------
 S105 | JIMIT DAVE   | MUMBAI    |  300.00 | NIRAV PATEL
 S103 | VINAY MEHRA  | PUNE      | 1200.00 | BIMAL THAKKAR
 S104 | JAY PANDEY   | SURAT     |  800.00 | HARSHAL PANDYA
 S102 | CHINTAN SHAH | BARODA    | 1500.00 | HARSHAL PANDYA
 S101 | AJAY PATEL   | AHMEDABAD | 1200.00 | SAPAN SHAH
 S105 | JIMIT DAVE   | MUMBAI    |  300.00 | SAURABH MEHTA
 S101 | AJAY PATEL   | AHMEDABAD | 1200.00 | HARSHAL PANDYA
 S102 | CHINTAN SHAH | BARODA    | 1500.00 | KIRAN DAVE
 S102 | CHINTAN SHAH | BARODA    | 1500.00 | SUNIL GANDHI
 S104 | JAY PANDEY   | SURAT     |  800.00 | SAPAN SHAH
 S102 | CHINTAN SHAH | BARODA    | 1500.00 | KIRAN DAVE
(11 rows)


