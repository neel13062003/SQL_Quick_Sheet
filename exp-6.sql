#Exp-6

1. SELECT COUNT(*) AS TOTAL_ORDERS FROM ORDERS; OR.
   SELECT COUNT(OID) AS TOTAL_ORDERS FROM ORDERS;
OP:
 total_orders
--------------
           11
(1 row)


2. SELECT COUNT(COMM) FROM SALESMEN WHERE COMM > 500;
OP:
 count
-------
     5
(1 row)

3. 
SELECT SID, AVG(O_AMT) FROM ORDERS
GROUP BY SID;
OP:
 sid  |          avg
------+-----------------------
 S101 |   495000.025000000000
 S105 | 8750.3750000000000000
 S103 |   250000.000000000000
 S102 |   208200.000000000000
 S104 |   207500.000000000000
(5 rows)

----------------------- : EXTRA : -----------------------
SELECT SID, ROUND(AVG(O_AMT)) FROM ORDERS
GROUP BY SID;
OP:
 sid  | round
------+--------
 S101 | 495000
 S105 |   8750
 S103 | 250000
 S102 | 208200
 S104 | 207500
(5 rows)

SELECT SID, ROUND(AVG(O_AMT),2) FROM ORDERS
GROUP BY SID;
OP:
 sid  |   round
------+-----------
 S101 | 495000.03
 S105 |   8750.38
 S103 | 250000.00
 S102 | 208200.00
 S104 | 207500.00
(5 rows)

SELECT SID, FLOOR(AVG(O_AMT)) FROM ORDERS
GROUP BY SID;
OP:
 sid  | floor
------+--------
 S101 | 495000
 S105 |   8750
 S103 | 250000
 S102 | 208200
 S104 | 207500
(5 rows)

SELECT SID, CEILING(AVG(O_AMT)) FROM ORDERS
GROUP BY SID;
OP:
 sid  | floor
------+--------
 S101 | 495000
 S105 |   8750
 S103 | 250000
 S102 | 208200
 S104 | 207500
(5 rows)

----------------------- : EXTRA : -----------------------

4.
SELECT OID, O_AMT, (O_AMT * 5) AS NEW_AMT FROM ORDERS
WHERE O_AMT > 12000;
OP:
 oid  |   o_amt   |  new_amt
------+-----------+------------
 O503 | 250000.00 | 1250000.00
 O504 | 400000.00 | 2000000.00
 O505 | 100000.00 |  500000.00
 O506 |  90000.05 |  450000.25
 O508 | 900000.00 | 4500000.00
 O509 | 205000.00 | 1025000.00
 O510 |  27800.00 |  139000.00
 O511 |  15000.00 |   75000.00
 O501 | 500000.00 | 2500000.00
(9 rows)

5. SELECT MIN(SALARY) AS MIN_SAL, MAX(SALARY) AS MAX_SAL FROM SALESMEN;
OP:
 min_sal | max_sal
---------+---------
         |
(1 row) 

6.

LEFT(String, no. characters prints from "left side") FUNCTION : ----------
EX:1 SELECT ('Hello World') AS ACTUAL_STR, LEFT('Hello World', 7) AS LEFT_FUN;
EX:2 SELECT ('Hello World') AS ACTUAL_STR, LEFT('Hello World', 20) AS LEFT_FUN;
EX:3 SELECT ('Hello World') AS ACTUAL_STR, LEFT('Hello World',0) AS LEFT_FUN;

OP:1
 actual_str  | left_fun
-------------+----------
 Hello World | Hello W
(1 row)

OP: 2
 actual_str  |  left_fun
-------------+-------------
 Hello World | Hello World
(1 row)

OP: 3
 actual_str  | left_fun
-------------+----------
 Hello World |
(1 row)

RIGHT(String, no. characters prints from "right side") FUNCTION : ----------
EX:1 SELECT ('Hello World') AS ACTUAL_STR, RIGHT('Hello World', 7) AS RIGHT_FUN;
EX:2 SELECT ('Hello World') AS ACTUAL_STR, RIGHT('Hello World', 20) AS RIGHT_FUN;
EX:3 SELECT ('Hello World') AS ACTUAL_STR, RIGHT('Hello World',0) AS RIGHT_FUN;

OP: 1
 actual_str  | right_fun
-------------+-----------
 Hello World | o World
(1 row)

OP: 2
 actual_str  |  right_fun
-------------+--------------
 Hello World | Hello World
(1 row)

OP: 3
 actual_str  | right_fun
-------------+-----------
 Hello World | 
(1 row)

#special case : for negetive values :
* suppose nagetive value is '-n' then prints total no.of characters = str.length() - n;

eg: LEFT('Hello World',-1) then print #characters = 11 - 1 = 10 from left side;
op: Hello Worl

eg: RIGHT('Hello World',-1) then print #characters = 11 - 1 = 10 from right side;
op: ello World

EX: 1 SELECT ('Hello World') AS ACTUAL_STR, LEFT('Hello World',-4) AS LEFT_FUN;
EX: 2 SELECT ('Hello World') AS ACTUAL_STR, RIGHT('Hello World',-4) AS RIGHT_FUN;
EX: 3 SELECT ('Hello World') AS ACTUAL_STR, LEFT('Hello World',-15) AS LEFT_FUN; [#IMP]
EX: 4 SELECT ('Hello World') AS ACTUAL_STR, RIGHT('Hello World',-15) AS RIGHT_FUN; [#IMP]

OP: 1
 actual_str  | left_fun
-------------+----------
 Hello World | Hello W
(1 row)

OP: 2
 actual_str  | right_fun
-------------+-----------
 Hello World | o World
(1 row)

op: 3
 actual_str  | left_fun
-------------+----------
 Hello World |
(1 row)

op: 4
 actual_str  | right_fun
-------------+----------
 Hello World |
(1 row)

7.
FLOOR : Return the largest integer value that is equal to or less than 23478.23
CEILING : Return the largest integer value that is equal to or greater than 23478.23

EX : 

=> SELECT FLOOR(23478.23);
OP:
 floor
-------
 23478
(1 row)

=> SELECT FLOOR(-13.5);
OP:
 floor
-------
   -14
(1 row)

=> SELECT CEILING(23478.23);
OP:
 ceiling
---------
   23479
(1 row)

=> SELECT CEILING(-13.5);
OP:
 ceiling
---------
     -13
(1 row)

