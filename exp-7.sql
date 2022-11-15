#Exp-7

1. 
SELECT CNAME FROM CUSTOMERS 
WHERE CID = (SELECT MAX(CID) FROM CUSTOMERS);
OP:
     cname
---------------
 BIMAL THAKKAR
(1 row)


2.
SELECT CNAME FROM CUSTOMERS WHERE CID IN
(SELECT CID FROM ORDERS WHERE SID IN
(SELECT SID FROM SALESMEN WHERE CITY='AHMEDABAD'));
OP:
     cname
----------------
 SAPAN SHAH
 HARSHAL PANDYA
(2 rows)


3.
note :
for, Early date = use min()
for, late date = use max()

SELECT OID, CID, SID, ODATE, O_AMT FROM ORDERS
WHERE ODATE = (SELECT MIN(ODATE) FROM ORDERS);

-- OR. --

SELECT OID, CID, SID, ODATE, O_AMT FROM ORDERS
WHERE EXTRACT(DAY FROM ODATE) IN 
(
    SELECT MIN(EXTRACT(DAY FROM ODATE)) FROM ORDERS
    WHERE EXTRACT(MONTH FROM ODATE) IN
    (
        SELECT MIN(EXTRACT(MONTH FROM ODATE)) FROM ORDERS 
        WHERE EXTRACT(YEAR FROM ODATE) IN
        (
            SELECT MIN(EXTRACT(YEAR FROM ODATE)) FROM ORDERS
        )
    )
);

OP:
 oid  | cid  | sid  |   odate    |   o_amt
------+------+------+------------+-----------
 O501 | C302 | S102 | 2009-01-02 | 500000.00
(1 row)


* ------ : EXTRA : -----

* Display order info for which order taken latest.

SELECT OID, CID, SID, ODATE, O_AMT FROM ORDERS
WHERE ODATE = (SELECT MAX(ODATE) FROM ORDERS);

-- OR. --

SELECT OID, CID, SID, ODATE, O_AMT FROM ORDERS
WHERE EXTRACT(DAY FROM ODATE) IN 
(
    SELECT MAX(EXTRACT(DAY FROM ODATE)) FROM ORDERS
    WHERE EXTRACT(MONTH FROM ODATE) IN
    (
        SELECT MAX(EXTRACT(MONTH FROM ODATE)) FROM ORDERS 
        WHERE EXTRACT(YEAR FROM ODATE) IN
        (
            SELECT MIN(EXTRACT(YEAR FROM ODATE)) FROM ORDERS
        )
    )
);

OP:
 oid  | cid  | sid  |   odate    |  o_amt
------+------+------+------------+----------
 O511 | C303 | S104 | 2009-12-31 | 15000.00
(1 row)