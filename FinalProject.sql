/*Creating Table*/   /*Insert Data into Table*/
/* \dt=> Dsiplay Tables Infromation Details  , \l=> Displays Details of Database*/         /* \d =access*/

/*Creating DataBase Name=> Project*/               
Creat Database Project;

/*Going to our database from postgres  => \connect project; */

/*Table 1 Start*/
CREATE table Employee( Emp_id varchar(10) PRIMARY KEY, role varchar(20), phone_no numeric(10),name varchar(20), salary numeric(10));


Insert into Employee (Emp_id,role,phone_no,name,salary) values ('E101','General','987654321','MaganBhai',100000);
Insert into Employee (Emp_id,role,phone_no,name,salary) values ('E102','General','987654322','ChhaganBhai',150000);
Insert into Employee (Emp_id,role,phone_no,name,salary) values ('E103','General','987654323','KathanBhai',100000);
Insert into Employee (Emp_id,role,phone_no,name,salary) values ('E104','Manager','987654324','SureshBhai',200000);
/*Table 1 Ends*/


/*Table 2 Start*/

CREATE TABLE Customer(CID varchar(10) PRIMARY KEY,c_address varchar(50), c_name varchar(20), ph_no numeric(10));


Insert into Customer (CID,c_address,c_name,ph_no) values ('C101','Vadodara','Heet',887654321);
Insert into Customer (CID,c_address,c_name,ph_no) values ('C102','Rajkot','Priyam',887654322);
Insert into Customer (CID,c_address,c_name,ph_no) values ('C103','Surat','Nisarg', 887654323);
Insert into Customer (CID,c_address,c_name,ph_no) values ('C104','Ahemdabad','Het',887654324);
/*Table 2 Ends*/


/*Table 3 Start*/

create table Orders(OID varchar(10) PRIMARY KEY,Item_name varchar(20), amount numeric(10));


Insert into Orders(OID, Item_name, amount)  values (1, 'Tv',50000);
Insert into Orders(OID, Item_name, amount)  values (2, 'Phone',15000);
Insert into Orders(OID, Item_name, amount)  values (3, 'Laptop',40000);
Insert into Orders(OID, Item_name, amount)  values (4, 'Tablet',10000);
/*Table 3 Ends*/



/*Table 4 Start*/

create table Billing( Bill_ID varchar(10) REFERENCES Orders(OID),Buyer_name varchar(30),mode_of_payment varchar(10),date_of_purchase Date);

Insert into Billing(Bill_ID,Buyer_name, mode_of_payment, date_of_purchase) values (1,'Heet','Online','1-02-22');
Insert into Billing(Bill_ID,Buyer_name, mode_of_payment, date_of_purchase) values (2,'Priyam','Online','1-04-22');
Insert into Billing(Bill_ID,Buyer_name, mode_of_payment, date_of_purchase) values (3,'Nisarg','Online','1-06-22');
Insert into Billing(Bill_ID,Buyer_name, mode_of_payment, date_of_purchase) values (4,'het','Online','1-08-22');
/*Table 4 Ends*/



/*Table 5 Start*/

create table Tv(Tv_id varchar(10) primary key,Tv_model varchar(30),Tv_company varchar(20),Tv_price numeric(10));

Insert into Tv (Tv_id, Tv_model, Tv_company, Tv_price)  values ('T1','B','MI',40000);
Insert into Tv (Tv_id, Tv_model, Tv_company, Tv_price)  values ('T2','B','SONY',100000);
Insert into Tv (Tv_id, Tv_model, Tv_company, Tv_price)  values ('T3','A','APPLE',200000);
Insert into Tv (Tv_id, Tv_model, Tv_company, Tv_price)  values ('T4','C','DELL',60000);
/*Table 4 Ends*/


/*Table 5 Start*/

create table Phone( Phone_id varchar(10) primary key, Phone_model varchar(30), Phone_company varchar(20), Phone_price numeric(10));

Insert into Phone (Phone_id, Phone_model,Phone_company,Phone_price) values (1,'101','Samsung',10000);
Insert into Phone (Phone_id, Phone_model,Phone_company,Phone_price) values (2,'102','Samsung',20000);
Insert into Phone (Phone_id, Phone_model,Phone_company,Phone_price) values (3,'201','Micromax',10000);
Insert into Phone (Phone_id, Phone_model,Phone_company,Phone_price) values (4,'202','Micromax',15000);
Insert into Phone (Phone_id, Phone_model,Phone_company,Phone_price) values (5,'301','Apple',100000);
Insert into Phone (Phone_id, Phone_model,Phone_company,Phone_price) values (6,'302','Apple',500000);
Insert into Phone (Phone_id, Phone_model,Phone_company,Phone_price) values (7,'401','MI',10000);
Insert into Phone (Phone_id, Phone_model,Phone_company,Phone_price) values (8,'402','MI',15000);
/*Table 5 Ends*/



/*Table 6 Start */

create table Laptop( Laptop_id varchar(10) primary key, Laptop_model varchar(30),Laptop_company varchar(20),Laptop_price numeric(10));

Insert into Laptop( Laptop_id, Laptop_model,Laptop_company ,Laptop_price) values (1,'A','Dell',50000);
Insert into Laptop( Laptop_id, Laptop_model,Laptop_company ,Laptop_price) values (3,'C','Dell',70000);
Insert into Laptop( Laptop_id, Laptop_model,Laptop_company ,Laptop_price) values (4,'A','HP',40000);
Insert into Laptop( Laptop_id, Laptop_model,Laptop_company ,Laptop_price) values (5,'A','Apple',200000);
/*Table 6 Ends*/



/*Table 7 Starts*/

create table Tablet(Tablet_id varchar(10) primary key,Tablet_model varchar(30),Tablet_company varchar(20),Tablet_price numeric(10));


Insert into Tablet(Tablet_id, Tablet_model, Tablet_company, Tablet_price) values (1,'A','Dell',10000);
Insert into Tablet(Tablet_id, Tablet_model, Tablet_company, Tablet_price) values (2,'B','Dell',15000);
Insert into Tablet(Tablet_id, Tablet_model, Tablet_company, Tablet_price) values (3,'A','Apple',80000);
Insert into Tablet(Tablet_id, Tablet_model, Tablet_company, Tablet_price) values (4,'B','Apple',60000);
/*Table 7 Ends*/


/*Table 8 Starts*/
/*No Meaning of creating this Table*/

create table Items(P_id varchar(10) REFERENCES Phone(Phone_id), L_id varchar(10) REFERENCES Laptop(Laptop_id), T_id varchar(10) REFERENCES Tablet(Tablet_id), Tv_id varchar(10) REFERENCES Tv(Tv_id) );

Insert into Items(T_id, L_id,T_id) values  ();
/*Table 8 Ends*/



/*Table 9 Starts*/

create table Supplier(S_id varchar(10) primary key,supplier_name varchar(30),supplier_address varchar(20), office_no numeric(10),product varchar(20));

Insert into  Supplier(S_id,Supplier_name,Supplier_address,office_no,product)   values (1020304050,'CompanyA','Rajkot',1010,'Phone');
Insert into  Supplier(S_id,Supplier_name,Supplier_address,office_no,product)   values (1020304051,'CompanyB','Porbandar',2010,'Laptop');
Insert into  Supplier(S_id,Supplier_name,Supplier_address,office_no,product)   values (1020304052,'CompanyC','Nadiad',4010,'Laptop');
Insert into  Supplier(S_id,Supplier_name,Supplier_address,office_no,product)   values (1020304053,'CompanyD','Surat',3010,'Tablet');
/*Table 9 Ends*/


/*Table 10 Starts*/

 Create table Purchase_order(Purchase_id varchar(10) primary key,S_id varchar(10) REFERENCES Supplier(S_id), pur_product varchar(20), quantity numeric(10), amount numeric(10));


Insert into Purchase_order(Purchase_id,S_id,pur_product,quantity,amount)   values ('P1',1020304050,'Phone',5,50000);
Insert into Purchase_order(Purchase_id,S_id,pur_product,quantity,amount)   values ('P2',1020304051,'Laptop',2,100000);
Insert into Purchase_order(Purchase_id,S_id,pur_product,quantity,amount)   values ('P3',1020304052,'Laptop',1,50000);
Insert into Purchase_order(Purchase_id,S_id,pur_product,quantity,amount)   values ('P4',1020304053,'Tablet',1,10000);
/*Table 10 Ends*/




/*Table 11 Starts*/
 
 Create table Payment( payment_id varchar(10)  PRIMARY KEY,mode_of_payment varchar(10), date DATE,amount numeric(10));


Insert into Payment(payment_id,mode_of_payment,date,amount) values (1,'Online','1-02-2022','50000');
Insert into Payment(payment_id,mode_of_payment,date,amount) values (2,'Online','1-04-2022','100000');
Insert into Payment(payment_id,mode_of_payment,date,amount) values (3,'Online','1-06-2022','50000');
Insert into Payment(payment_id,mode_of_payment,date,amount) values (4,'Online','1-08-2022','10000');
/*Table 11 Ends*/








/*Questions*/

1)Count Supplier_name who purchase amount>25000

=> Select count(*) as countSupplier FROM Supplier INNER JOIN Purchase_order ON Supplier.S_id =Purchase_order.S_id Where amount>25000;   

2)Display Total Sales of company in month of august 2022

=> Select count(*) as Sales from billing where subtract(month from date_of_purchase)='08' and subtract(year from date_of_purchase)='2022'; 
Select count(*) as Sales from billing where date_of_purchase='08/2022'; 

3)Display details of customers who purchase laptop in 2022

4)give the supplier detials who are supplying iphone and samsung

5) give the customer detials haing billing amount> 1lakh


\l => Showing Database




Drop table table_name;           //delete table
1234 & postgres


















/*
Insert into Computer (c_id,Company,model,Manf_Year) values ('1001','DELL','BOSTRO','1-01-2013');
Insert into Computer (c_id,Company,model,Manf_Year) values ('1002','DELL','PRECISION','1-01-2014');
Insert into Computer (c_id,Company,model,Manf_Year) values ('1003','HP','EDGE','1-01-2013');
Insert into Computer (c_id,Company,model,Manf_Year) values ('1004','HP','HORION','1-01-2014');
*/
/*
emp also class work
CREATE table Computer (c_id varchar(10) PRIMARY KEY,Company varchar(20),model varchar(20),Manf_Year Date);
*/

/*Postgres = 1234*/



/*Query Practise*/


/*Most Basic Select Query*/

 1) Display the Customers who are from vadodara.
 => Select * from customer where c_address='Vadodara';

/*Between & And Operator*/
2)Display Payment recieve between 1 February to 1 April;
=> Select * from Payment where date between '1-02-2022' and '1-04-2022';

/*Like Operator*/
3)Display Customer Name start with 'A'
=> Select * from customer where c_name like 'H%';

/*Order By => ordering in acending */
4)Display Employee Deatials accoring to sort their name
=> Select  * from Employee order by name asc;

/*Aggregate function use & use of group by because we want alo display name with aggregate function*/
5)Disply count total sales of company in month of august 2022 with Buyer Name
=> Select Buyer_name,count(*) as sales from billing where  date_of_purchase between '1-08-2022' and '31-08-2022' group by Buyer_name;

/*Simple Aggregate Function also use of alias*/
6)Disply count total sales of company in month of august 2022
=> Select count(*) as sales from billing where  date_of_purchase between '1-08-2022' and '31-08-2022';

/*Aggregate Function + Group BY + Order by*/
7)Disply count total sales of company in month of august to April 2022 with Buyer Name with desceding order of name
=> select Buyer_name,count(*) as sales from billing where  date_of_purchase between '1-04-2022' and '31-08-2022' group by Buyer_name ORDER BY Buyer_name DESC;

/*Aggregate Function with Inner join*/
8)Count Supplier name who purchase amount>25000
=> Select count(*) as countSupplier from Supplier Inner join Purchase_order on Supplier.S_id=Purchase_order.S_id where amount>25000;


/*Order By*/
9)Display Laptop Detials with their price arranging in aceding order
=> Select * from laptop order by Laptop_price asc;

/*Left join*/
10)Display Detials of Customers who purchase laptop in 2022
=> Select c_name,c_address,ph_no from Customer LEFT JOIN Billing on  Customer.CID=Billing.Bill_ID ;

/*Same with SubQuery*/
=> Select c_name,c_address,ph_no from Customer where CID in (select bill_id from orders);

/*Full Outer Join*/
11)Display Details of Customer whose purchase is >2000;
=>
SELECT a.Buyer_name AS "Name",a.date_of_purchase AS "Date",b.Item_name AS "b.Item",b.amount AS "Amount" FROM   billing a  FULL OUTER JOIN Orders b ON a.Bill_ID = b.OID where amount>2000; 

/*Cross Join*/
12)Give Customer Details having billing amount> 50K
=>select Distinct c_name,c_address,ph_no from customer cross join orders where amount>'45000';

/*Using SubQuery*/
13)Display Supplier Deatails whose purchase amount > 50000
=> Select * from supplier where S_id in (Select S_id from Purchase_order where amount>'50000');

/*Using SubQuery*/
14)Display Details of Customer Who purchase Laptop in 2022
=> Select * from customer inner join billing on customer.c_name=billing.Buyer_name where bill_id=(select oid from orders where Item_name='Laptop');

/*Using SubQuery*/
15)Display Details of Customer Who purchase Laptop in 2022
=>Select * from customer inner join billing on customer.c_name=billing.Buyer_name where bill_id=(select oid from orders where Item_name='Laptop') and date_of_purchase between '1-01-2022' and '31-12-2022';

/*Using SubQuery*/
16)Display Supplier Detials Whose Supplying Tablet/Iphone as we wish
=>Select * from supplier where s_id in (select s_id from Purchase_order where pur_product='Tablet');

/*Using SubQuery*/
17)Give Customer Details having billing amount >1lakh
=>Select Distinct c_name,c_address,ph_no from Customer inner join Billing on  c_name = (Select Buyer_name from Billing where  bill_id=(select oid from orders where amount=50000) );

/*In cross join where and other join on*/


18) view = > Use
#create view bill_view as
   #select * from billing where bill_id='1';
//Create view 
   #select * from bill_view;

19)Rowtype => Use

/*Extra*/
create table users( userid serial primary key,username varchar(30) not null,fname varchar(30) not null,lname varchar(30),birthdate date,email varchar(50) not null,city varchar(30),state varchar(30),country varchar(30),unique(email),unique(username)); 
alter table users add constraint "users_email_check" check(email like '%@%.%');

insert into users (userid ,username,fname,lname,birthdate,email,city,state,country) values (1,'Neel Soni','Neel','Soni','2003-06-13','neelnsoni13@gmail.com','bayad','gujarat','india');
insert into users (userid ,username,fname,lname,birthdate,email,city,state,country) values (2,'Kalp Soni','Kalp','Soni','2009-01-10','kalpnsoni13@gmail.com','bayad','gujarat','india');
insert into users (userid ,username,fname,lname,birthdate,email,city,state,country) values (3,'Yugansh Soni','Yugansh','Soni','2009-01-10','yuganshsoni13@gmail.com','ahem','gujarat','india');
insert into users (userid ,username,fname,lname,birthdate,email,city,state,country) values (4,'Jinansh Soni','Jinansh','Soni','2009-01-10','jinanshsoni@gmail.com','kapadvanj','gujarat','india');
insert into users (userid ,username,fname,lname,birthdate,email,city,state,country) values (5,'Helly Soni','Helly','Soni','2009-01-10','hellysoni@gmail.com','bayad','ahem','india');


 /*Rowtype*/
do $$
declare total users%rowtype;
begin
select * from users
into total where userid=1;
raise notice 'the details of users are:% %',
total.username, total.city;
End
$$
language plpgsql;


2) Use lab
/*In my table  -  Of Employee */ 
/* For Achieving Output => Output Is Present in One Row */
do $$
declare total employee%rowtype;
begin
select * from employee
into total where emp_id='E101';
raise notice 'Name of Employee is "%" &  Salery  is "%".',
total.name,total.salary;
End
$$
language plpgsql;


/*Cursor*/

Create a Cursor which traverses through users table where the country of
the user is INDIA.

BEGIN;
DECLARE mycursor CURSOR FOR
SELECT * FROM USERS WHERE COUNTRY = 'india';
FETCH NEXT FROM mycursor;                      //We can repeat and check step by step like tracing in AMP
FETCH PRIOR FROM mycursor;
CLOSE mycursor;
end;


//Lets Create Cursor in our program => Use (3)

Create a Cursor which traverses through users table where role is General.


BEGIN;
DECLARE mycursor CURSOR FOR
SELECT * FROM employee WHERE role = 'General';
FETCH NEXT FROM mycursor;                      
FETCH PRIOR FROM mycursor;
CLOSE mycursor;
end;


20)  use (4)
 
=> Insert into purchase order trigger

Insert into Purchase_order(Purchase_id,S_id,pur_product,quantity,amount)   values ('P1',1020304050,'Phone',-2,50000);




//Funtion &  Triggers
1)
Function and trigger which keeps log of all the users who
bought premium and make an entry in the customer_audit table .



*Function*

/*customer_Audit name table banse*/
/*$$ = if note want to write => $customer_saudit $*/
/*In Insert into 'customer_audit' chhe e table name chhe*/
CREATE OR REPLACE FUNCTION do_customer_audit() RETURNS TRIGGER AS $customer_audit$                                                               
    BEGIN
        IF NEW.ispremium = true THEN
            INSERT INTO customer_audit(time_now,usertype,amt) values(NOW(),NEW.usertypeid,199);
            RETURN NEW;
        END IF;
        RETURN NULL;
    END;
$customer_audit$
LANGUAGE PLPGSQL;

*Trigger*
/*cust_audit trigger name , usertype = table name*/
CREATE TRIGGER cust_audit
AFTER INSERT OR UPDATE OR DELETE on usertype
FOR EACH ROW EXECUTE PROCEDURE
do_customer_audit();                                 

/*Function Logic*/      /*So first creat function*/
/*For each row or each statement*/

/*UserType Table*/
// usertype
create table usertype( usertypeid varchar(5) primary key,startdate date not null,enddate date,userid integer,ispremium boolean,constraint "fk_usertype_user" foreign key (userid)references users(userid) on delete set null);

// customer_audit
create table customer_audit( time_now TIMESTAMP , usertype varchar(5) , amt INT);




2) Function and trigger which checks user’s age and if it is
less than 12 then it won’t allow to insert or update in user’s
table.


<FUNCTION>

CREATE FUNCTION CHECK_AGE() RETURNS TRIGGER AS $$
  BEGIN
    IF DATE_PART('YEAR',CURRENT_DATE) - DATE_PART('YEAR',NEW.BIRTHDATE) < 12 THEN RAISE EXCEPTION 'AGE SHOULD BE ATLEAST 12';
    END IF;
    RETURN NEW;
  END;
$$
LANGUAGE PLPGSQL;


<TRIGGER>

CREATE TRIGGER AGE_CHECK
BEFORE INSERT OR UPDATE ON USERS
FOR EACH ROW EXECUTE PROCEDURE CHECK_AGE();

insert into users(userid,username,fname,lname,birthdate,email,city,state,country) values (5,'Chagan Patel','Chagan','Patel','2015-01-01','chagan@gmail.com','Kumbhalgadh','Rajashthan','India');






//In Project //
purchase_order quantity is 0 then trigger show and not to insert or upadte to quantity 0;
insert into purchase_order (purchase_id,s_id,pur_product,quantity,amount) values ('p5','1020304054','Laptop','0','0');


<FUNCTION>

CREATE FUNCTION CHECK_purchase2() RETURNS TRIGGER AS $$
  BEGIN
    if NEW.quantity=false THEN
        RAISE EXCEPTION 'Your Order not be empty';
    END IF;
    RETURN NEW;
  END;
$$
LANGUAGE PLPGSQL;


<TRIGGER>      <!Age_check = purchase_check is name we can write anything>

CREATE TRIGGER purchase_CHECK1
BEFORE INSERT OR UPDATE ON purchase_order
FOR EACH ROW EXECUTE PROCEDURE CHECK_purchase2();







/*****************************************************************/



*Function*

create table Orders(OID varchar(10) PRIMARY KEY,Item_name varchar(20), amount numeric(10));
Insert into Orders(OID, Item_name, amount)  values (1, 'Tv',50000);

create table order_audit(oid_1 varchar(10) NOT NULL,Item_name1 varchar(10) NOT NULL,entry_date text NOT NULL);

/*customer_Audit name table banse*/
/*$$ = if note want to write => $customer_saudit $*/
/*In Insert into 'customer_audit' chhe e table name chhe*/
/*Here order_audit table banavu padse */
CREATE OR REPLACE FUNCTION do_order_audit() RETURNS TRIGGER AS $TriggerNameAsIWant$                                                               
    BEGIN
            INSERT INTO order_audit(oid_1,Item_name1,entry_date) values(NEW.oid,NEW.Item_name,current_timestamp);
            RETURN NEW;
    END;  
$TriggerNameAsIWant$
LANGUAGE PLPGSQL;

*Trigger*
/*cust_audit trigger name , orders = table name*/
CREATE TRIGGER order_audit_here_trigger_name15
Before  INSERT OR UPDATE OR DELETE on Orders
FOR EACH ROW EXECUTE PROCEDURE
do_order_audit(); 


 use (5)
Insert into Orders(OID, Item_name, amount)  values (20, 'Laptop',50000);
# select Distinct * from order_audit;



/*Create or replace means either you create new function or replace with this*/
/*Drop table table_name*/
/*Delete from table_name where id=1;*/


/*New Trigger*/


create trigger checkage
   before insert on 






Some of The Most Important SQL Commands
SELECT - extracts data from a database
UPDATE - updates data in a database
DELETE - deletes data from a database
INSERT INTO - inserts new data into a database
CREATE DATABASE - creates a new database
ALTER DATABASE - modifies a database
CREATE TABLE - creates a new table
ALTER TABLE - modifies a table
DROP TABLE - deletes a table
CREATE INDEX - creates an index (search key)
DROP INDEX - deletes an index

1)SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

2) SELECT DISTINCT Country FROM Customers;

3) SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

4)SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;

5) UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

6)DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

7) SELECT MIN(Price) AS SmallestPrice
FROM Products;

8)SELECT AVG(Price)
FROM Products;                      Avg,count,supplier_name

9)SELECT * FROM Customers WHERE CustomerName LIKE 'a%';

10)SELECT * FROM Customers WHERE CustomerName LIKE '_r%';

11)SELECT * FROM Customers WHERE City LIKE 'ber%';

12)SELECT column_name(s) FROM table_name WHERE column_name IN (SELECT STATEMENT);

13)SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;

14) SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;

15)SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;

/*Inner Join*/
16)SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

/*Left Join*/
17)SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

/*Right Join*/
18)SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

/*Full Join*/
19)SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

The UNION operator is used to combine the result-set of two or more SELECT statements.
20)SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

21)SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

/*The GROUP BY statement is often used with aggregate functions 
( COUNT() , MAX() , MIN() , SUM() , AVG() ) to group the result-set by one or more columns.*/

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;


SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;

/*Self Join*/
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;


/*Exits*/

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

/*Not Null*/
ALTER TABLE Persons
MODIFY COLUMN Age int NOT NULL;


/*Check*/
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

/*Date*/

SELECT * FROM Orders WHERE OrderDate='2008-11-11'


/*View*/

1)CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

SELECT * FROM [Brazil Customers];

// If one word view name then not require additional [] brackets

//Good
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
