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


