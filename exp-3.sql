#Exp-3

1.

ALTER TABLE SALESMEN ADD PRIMARY KEY SID;
ALTER TABLE CUSTOMERS ADD PRIMARY KEY(CID);
ALTER TABLE ORDERS ADD PRIMARY KEY(OID);

ALTER TABLE ORDERS ADD FOREIGN KEY(SID) REFERENCES SALESMEN(SID);
ALTER TABLE ORDERS ADD FOREIGN KEY(CID) REFERENCES CUSTOMERS(CID);

OP:(for all above queries)
ALTER TABLE

2.

CREATE TABLE CUST (
    CNO VARCHAR(15) CHECK(CNO LIKE 'C%'),
        CNAME VARCHAR(30) CHECK(UPPER(CNAME)=CNAME),
    OCCUPATION VARCHAR(30),
    PRIMARY KEY(CNO)
);
OP:
CREATE TABLE

=> 1st Error msg:
INSERT INTO CUST(CNO,CNAME) VALUES ('c12','VRAJ');

ERROR:  new row for relation "cust" violates check constraint "cust_cno_check"
DETAIL:  Failing row contains (c12, VRAJ, null).

=> 2nd Error msg:
INSERT INTO CUST(CNO,CNAME) VALUES ('C12','VRAj');

ERROR:  new row for relation "cust" violates check constraint "cust_cname_check"
DETAIL:  Failing row contains (C12, VRAj, null).

=> successfully run:
INSERT INTO CUST(CNO,CNAME) VALUES ('C12','VRAJ');
INSERT 0 1


------------------ some extra thongs -------------------
SCHEMA OF CUST : \d CUST;
CHECK() : check the condition 
        if true the execute the query successfully;
        else throw error msg;
String UPPER(String str) : convert lowercase to uppercase to the given string 
    so, now first of all convert cname in to the uppercase and after that compare with cname
    if true the execute the query successfully;
    else throw error msg;


3. SELECT SNAME FROM SALESMEN WHERE SNAME LIKE '_A%';
OP:
    sname
--------------
 JAY PANDEY
 MANAN GANDHI
(2 rows)

---->NOTE: I INSERTED ALL THE DATA IN CAPITAL MANNER SO, I WROTE '_A%' IN A QUERY;

4. 

5. SELECT * FROM CUSTOMERS ORDER BY CNAME DESC;
OP:

cid  |     cname      |   city    | state | pincode | product | class | country
------+----------------+-----------+-------+---------+---------+-------+---------
 C307 | SUNIL GANDHI   | SURAT     |       |         |         | B     |
 C305 | SMRITI MISHRA  | AHMEDABAD |       |         |         | B     |
 C304 | SAURABH MEHTA  | BARODA    |       |         |         | C     |
 C303 | SAPAN SHAH     | BANGLORE  |       |         |         | B     |
 C301 | NIRAV PATEL    | NADIAD    |       |         |         | B     |
 C302 | KIRAN DAVE     | DELHI     |       |         |         | A     |
 C306 | HARSHAL PANDYA | MUMBAI    |       |         |         | A     |
 C308 | BIMAL THAKKAR  | SURAT     |       |         |         | C     |
(8 rows)


