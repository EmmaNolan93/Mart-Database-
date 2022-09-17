DROP table if exists livestock;
alter table livestock
modify Age decimal(3) NOT Null;
CREATE TABLE livestock
(
lot_num INT(2) NOT NULL UNIQUE,
Card_num int(8) primary key,
Age decimal(3) NOT NULL,
Weight int(3) NOT NULL,
Sex  varchar(7) NOT NULL,
breed varchar(20) Not Null,
TB_date date NOT NULL,
OBVD  date ,
Rings_Num int(1),
FOREIGN KEY Rings_num(Rings_num) REFERENCES Rings(Rings_num)
ON UPDATE CASCADE
ON DELETE Restrict
);

drop table if exists Buyer;
alter TABLE Buyer;
CREATE TABLE Buyer
(
UID INT(6) PRIMARY KEY AUTO_INCREMENT,
name varchar(20) NOT NULL,
eircode varchar(20)NOT NULL,
phone_num int(10)NOT NULL,
check(phone_num <=  9999999999)
);

drop table if exists Seller;
alter Table Seller
modify phone_num varchar(10) NOT NULL;
CREATE TABLE Seller
(
herd_num INT(6) PRIMARY KEY AUTO_INCREMENT,
Name varchar(10) NOT NULL,
eircode varchar(20) NOT NULL,
phone_num varchar(10) NOT NULL 
check(phone_num <=  9999999999)
);

DROP TABLE IF EXISTS Auctioner;
alter Table Auctioner
drop check auctioner_chk_1;
CREATE TABLE Auctioner
(
Auc_ID INT(6) PRIMARY KEY AUTO_INCREMENT,
Name varchar(20) NOT NULL,
address varchar(30) NOT NULL,
phone_num int(10) NOT NULL UNIQUE,
Rate int(10) NOT NULL,
check(phone_num <=  9999999999)
);

alter Table employees
drop check employees_chk_1;
create table employees(
emp_id INT(6) AUTO_INCREMENT PRIMARY KEY,
  last_name VARCHAR(15) NOT NULL,
  first_name VARCHAR(15) NOT NULL,
  phone_num INT(10) NOT NULL UNIQUE,
  Role varchar(10) NOT NULL,
  check(phone_num <=  9999999999)
);

DROP TABLE IF EXISTS Rings;
create table Rings(
Rings_num INT(1) PRIMARY KEY
);


DROP TABLE IF EXISTS Assigned;
alter table Assigned
add Time_End Time;
create table Assigned
(
emp_id INT(6) NOT NULL,
Rings_num INT(1) NOT NULL,
primary Key(emp_id, rings_num),
Time_start Time Not Null,
Time_End TIME NOT NULL,
FOREIGN KEY emp_id(emp_id) REFERENCES employees(emp_id),
FOREIGN KEY Rings_num(Rings_num) REFERENCES Rings(Rings_num)
ON UPDATE CASCADE
ON DELETE Restrict
);

DROP TABLE IF exists Sale;
alter table Sale;
create table Sale
(
date  Date NOT NULL,
Price INT(10) NOT NULL,
UID INT(6) NOT NULL,
herd_num INT(6) NOT Null,
Auc_Id INT(6) NOT NULL,
Card_num INT(8) NOT NULL,
primary Key(Auc_Id, Card_num),
FOREIGN KEY Auc_Id(Auc_Id) REFERENCES Auctioner(Auc_Id),
FOREIGN KEY herd_num(herd_num) REFERENCES seller(herd_num),
foreign key Card_num(Card_num) references livestock(Card_num),
foreign key UID(UID) references Buyer(UID)
ON UPDATE CASCADE
ON DELETE Restrict
);

insert Rings(Rings_num)
value(1);
insert Rings(Rings_num)
value(2);
insert Rings(Rings_num)
value(3);
insert Rings(Rings_num)
value(4);
insert Rings(Rings_num)
value(5);


insert livestock(lot_num, Card_num, Age, Weight, Sex, breed, TB_date, OBVD, Rings_num)
value(54, 1234464, 2, 780, 'M', 'Belgium Blue', '2021-09-12', '0000-00-00', 2);

insert livestock(lot_num, Card_num, Age, Weight, Sex, breed, TB_date, OBVD, Rings_num)
value(34, 12345645, 2, 325, 'F', 'Charlie', '2021-04-12', '0000-00-00', 4);

insert livestock(lot_num, Card_num, Age, Weight, Sex, breed, TB_date, OBVD, Rings_num)
value(25, 12345678, 2, 400, 'M', 'Charlie', '2021-01-09', '0000-00-00', 2);

insert livestock(lot_num, Card_num, Age, Weight, Sex, breed, TB_date, OBVD, Rings_num)
value(23, 12332156, 0.3, 120, 'M', 'limousine', '2021-10-05', '2021-11-4', 3);

insert Buyer(UID, name, eircode, phone_num)
value(default, 'Patrick Boland', 'R95 TY86', 1234567890); 

insert Buyer(UID, name, eircode, phone_num)
value(default, 'Nicky Bolger', 'R95 TY45', 872687301); 

insert Buyer(UID, name, eircode, phone_num)
value(default, 'John Costello', 'R85 TY23', 0866064765); 

insert Seller(herd_num, Name, eircode, phone_num)
value(123423, 'Alex Copper', 'R12 TY67', 0872235276);

insert Seller(herd_num, Name, eircode, phone_num)
value(123456, 'Patrick Bergin', 'R23 TY45', 052101016);

insert Seller(herd_num, Name, eircode, phone_num)
value(124356, 'Bob Copper', 'R12 TY67', 0872235288);

insert Seller(herd_num, Name, eircode, phone_num)
value(1243487, 'Daniel Nolan', 'R12 TY34', 0872235288);

insert Auctioner(Auc_id, Name, address, phone_num, Rate)
value(default, 'John Murphy', '24 Patrick Street', 0866064765, 5);

insert Auctioner(Auc_id, Name, address, phone_num, Rate)
value(default, 'Jason Todd', '24 Patrick Street', 0844502345, 5);


insert employees(emp_id, last_name, first_name, phone_num, Role)
value(123451, 'Martina', 'Boland', 0857615596, 'Cleaner');

insert employees(emp_id, last_name, first_name, phone_num, Role)
value(123456, 'Padriag', 'Barton', 0857615596, 'Cleaner');

insert Assigned(emp_id, Rings_num, Time_start, Time_End)
value(123451, 1, '10:35:10', '16:30:10');

insert Assigned(emp_id, Rings_num, Time_start, Time_End)
value(123456, 2, '09:35:10', '16:30:10');

select date, Price, UID, herd_num, Auc_Id, Card_num 
from 
Sale;

insert Sale(date, Price, UID, herd_num, Auc_Id, Card_num)
value('2021-12-01', 1200, 1, 123456, 1,  12332156);

insert Sale(date, Price, UID, herd_num, Auc_Id, Card_num)
value('2021-12-01', 1500, 2, 124356, 2,  12345678);

insert Sale(date, Price, UID, herd_num, Auc_Id, Card_num)
value('2021-12-02', 1300, 1, 1243487, 1,  1234464);

insert Sale(date, Price, UID, herd_num, Auc_Id, Card_num)
value('2021-12-02', 1600, 3, 123423, 2,  12345645);


SELECT  
    date_format(c.date,  '%W, %d %M %Y') 'Date',
    Concat('€','', Price) AS price,
    o.breed 'Breed',
    o.Sex
FROM Sale c
LEFT JOIN livestock o ON c.Card_num = o.Card_num;

SELECT
    c.Auc_Id 'Auctioneer ID',
    c.Rate 'Commision Rate',
    Concat('€','', Price) AS 'Price of cattle sold'
FROM auctioner c
LEFT JOIN sale o ON c.Auc_Id = o.Auc_Id;

select emp_id 'Employees ID', Rings_num 'Ring', TIME_FORMAT(Time_start, "%h:%i %p") 'Shifts starts:', TIME_FORMAT(Time_End, "%h:%i %p")'Shifts Ends:'
from 
assigned;

SELECT name 'Full Name', UID 'ID'
from 
Buyer;

Select Name, herd_num 'Herd Number', eircode 'Eircode'
from 
seller;
  