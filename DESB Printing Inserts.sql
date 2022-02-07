USE master;
GO

DROP DATABASE IF EXISTS final_project;
CREATE DATABASE final_project;
GO

USE final_project;


--Create Employee Table
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee
( EmployeeID			SMALLINT NOT NULL IDENTITY(1,1),
  FirstName				VARCHAR(30) NOT NULL,
  LastName				VARCHAR(30) NOT NULL,
  HireDate				DATE,
  BirthDate				DATE,
  PhoneNumber			CHAR(15),
  StreetAddress			VARCHAR(100) NOT NULL,
  City					VARCHAR(30) NOT NULL,
  [State]				CHAR(2) NOT NULL,
  ZipCode				VARCHAR(10) NOT NULL,
  DepartmentCode		CHAR(4) NOT NULL
  CONSTRAINT PK_EMPLOYEE_EmployeeID PRIMARY KEY (EmployeeID)
  CONSTRAINT CHECK_Employee_DepartmentCode CHECK ( DepartmentCode IN ( 'ACCT', 'PROD', 'SALE', 'SERV') )
);
INSERT INTO Employee (FirstName, LastName, HireDate, BirthDate, PhoneNumber, StreetAddress, City, State, ZipCode, DepartmentCode)
VALUES ('Meg','Lewis','1994-01-21','1976-03-06','(273) 277-9354','777 Brockton Avenue','Bountiful','UT','84123','PROD'),
('Greg','Robinson','2013-11-26','1979-06-16','(331) 969-5723','30 Memorial Drive','Sandy ','UT','84124','PROD'),
('NaTasha','Walker','2006-03-17','1960-11-04','(312) 537-3650','250 Hartford Avenue','Salt Lake City','UT','84125','PROD'),
('Donna','Young','2008-03-22','1983-10-03','(912) 252-1733','700 Oak Street','Murray','UT','84126','PROD'),
('Amy','Allen','1996-03-04','1968-06-04','(617) 552-6812','66-4 Parkhurst Rd','Holladay','UT','84126','PROD'),
('Brian','King','2013-04-23','1986-06-03','(532) 215-8589','591 Memorial Dr','Cottonwood','UT','84127','PROD'),
('Marty','Wright','2019-11-02','1979-01-08','(324) 336-8840','55 Brooksby Village Way','Brighton','UT','84128','PROD'),
('Dan','Scott','2018-05-29','1960-10-06','(951) 215-7075','137 Teaticket Hwy','Alta','UT','84129','PROD'),
('Pippa','Torres','2007-01-01','1974-10-30','(759) 959-2800','42 Fairhaven Commons Way','Park City','UT','84123','PROD'),
('Simon','Nguyen','2001-09-08','1972-02-25','(943) 385-3493','374 William S Canning Blvd','Sandy ','UT','84124','PROD'),
('Daniel','Hill','2001-01-01','1993-10-05','(370) 422-7819','121 Worcester Rd','Sandy ','UT','84125','PROD'),
('Judy','Flores','2002-08-24','1995-04-29','(272) 747-6073','677 Timpany Blvd','Salt Lake City','UT','84126','PROD'),
('David','Green','2010-07-11','1978-12-11','(424) 481-3117','337 Russell St','Bountiful','UT','84126','PROD'),
('NaTasha','Adams','2016-09-27','1963-11-20','(734) 769-2233','295 Plymouth Street','Salt Lake City','UT','84127','PROD'),
('Marie','Nelson','2000-04-13','1981-08-25','(462) 957-7843','1775 Washington St','Sandy ','UT','84128','PROD'),
('David','Baker','2012-02-02','1967-01-08','(645) 426-7647','280 Washington Street','Murray','UT','84129','PROD'),
('Simon','Hall','2004-06-15','1982-01-02','(893) 945-5396','20 Soojian Dr','Salt Lake City','UT','84123','PROD'),
('Meg','Rivera','2006-02-05','1981-06-26','(983) 200-9532','11 Jungle Road','Holladay','UT','84124','PROD'),
('Pippa','Campbell','2005-01-28','1991-05-24','(893) 540-9556','301 Massachusetts Ave','Sandy ','UT','84125','PROD'),
('Marty','Mitchell','1998-06-19','1997-03-25','(348) 249-5417','780 Lynnway','Cottonwood','UT','84126','ACCT'),
('Judy','Carter','2014-11-02','1990-01-20','(422) 470-2118','70 Pleasant Valley Street','Salt Lake City','UT','84126','ACCT'),
('Greg','Roberts','2020-08-25','1972-11-21','(761) 427-0479','830 Curran Memorial Hwy','Salt Lake City','UT','84127','ACCT'),
('Brian','Gomez','1993-04-08','1969-11-13','(900) 841-3173','1470 S Washington St','Murray','UT','84128','ACCT'),
('Amy','Phillips','2002-07-11','1971-10-09','(545) 282-4243','506 State Road','Bountiful','UT','84129','ACCT'),
('Dan','Evans','2013-12-26','1976-08-05','(767) 608-6476','742 Main Street','Cottonwood','UT','84123','ACCT'),
('David','Bailey','2002-03-26','1995-04-29','(294) 725-4344','72 Main St','Salt Lake City','UT','84124','SERV'),
('Donald','Reed','1997-09-15','1978-12-11','(630) 286-0030','200 Otis Street','Sandy ','UT','84125','SERV'),
('Janice','Kelly','2017-05-25','1963-11-20','(291) 273-9310','180 North King Street','Park City','UT','84126','SERV'),
('Roy','Howard','1998-11-16','1981-08-25','(336) 787-4958','555 East Main St','Sandy ','UT','84126','SERV'),
('Davies','Ramos','2013-06-04','1967-01-08','(453) 859-1423','555 Hubbard Ave-Suite 12','Salt Lake City','UT','84127','SERV'),
('Daniel','Kim','2014-12-02','1982-01-02','(958) 388-3739','300 Colony Place','Bountiful','UT','84128','SALE'),
('Davies','Cox','2012-05-27','1981-06-26','(396) 388-1059','301 Falls Blvd','Park City','UT','84129','SALE'),
('Susan','Ward','1992-04-16','1991-05-24','(893) 388-7459','36 Paramount Drive','Bountiful','UT','84123','SALE'),
('Glen','Richardson','2001-01-14','1997-03-25','(694) 600-4591','450 Highland Ave','Holladay','UT','84124','SALE'),
('John','Watson','2001-04-09','1990-01-20','(703) 983-9298','1180 Fall River Avenue','Sandy ','UT','84125','SALE'),
('Luci','Brooks','1993-07-14','1972-11-21','(992) 510-4402','1105 Boston Road','Park City','UT','84126','SALE'),
('Bob','Chavez','2017-11-28','1969-11-13','(682) 317-1614','100 Charlton Road','Bountiful','UT','84126','SALE'),
('Jason','Wood','1993-12-30','1971-10-09','(933) 933-9629','262 Swansea Mall Dr','Salt Lake City','UT','84127','SALE'),
('Brad','James','2018-08-17','1976-08-05','(244) 621-7076','333 Main Street','Murray','UT','84128','SALE'),
('Frederick','Bennet','1995-02-15','1976-04-30','(372) 234-2097','550 Providence Hwy','Bountiful','UT','84129','SALE')
;

--Alter the Employee table to include EmailOptIn
ALTER TABLE Employee
ADD EmailOptIn CHAR(1) NOT NULL DEFAULT 'Y'

--Ensuring EmailOptIn can only take Y or N
ALTER TABLE Employee
ADD CONSTRAINT CHECK_Employee_EmailOptIn CHECK ( EmailOptIn IN ('Y', 'N') );

-- Create the EmployeeEmail table
DROP TABLE IF EXISTS EmployeeEmail;
CREATE TABLE EmployeeEmail
( EmployeeID			SMALLINT NOT NULL,
  EmailAddress			VARCHAR(254) NOT NULL,
  PrimaryEmailFlag		CHAR(1) NOT NULL DEFAULT 'Y'
  CONSTRAINT PK_EmployeeEmail_EmployeeID_EmailAddress PRIMARY KEY ( EmployeeID, EmailAddress ),
  CONSTRAINT FK_EmployeeEmail_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Employee ( EmployeeID ),
  CONSTRAINT CHECK_EmployeeEmail_PrimaryEmailFlag CHECK ( PrimaryEmailFlag IN ( 'Y', 'N' ) )
);
INSERT INTO EmployeeEmail ( EmployeeID, EmailAddress, PrimaryEmailFlag )
VALUES (1,'Meg.Lewis@desbprint.com','Y'),
(2,'Greg.Robinson@desbprint.com','Y'),
(2,'Greg.Robinson@gmaul.com','N'),
(3,'NaTasha.Walker@desbprint.com','Y'),
(4,'Donna.Young@desbprint.com','Y'),
(5,'Amy.Allen@desbprint.com','Y'),
(6,'Brian.King@desbprint.com','Y'),
(6,'Brian.King@yayhoo.com','N'),
(7,'Marty.Wright@desbprint.com','Y'),
(8,'Dan.Scott@desbprint.com','Y'),
(9,'Pippa.Torres@desbprint.com','Y'),
(10,'Simon.Nguyen@desbprint.com','Y'),
(11,'Daniel.Hill@desbprint.com','Y'),
(12,'Judy.Flores@desbprint.com','Y'),
(13,'David.Green@desbprint.com','Y'),
(14,'NaTasha.Adams@desbprint.com','Y'),
(15,'Marie.Nelson@desbprint.com','Y'),
(15,'Marie.Nelson@gmaul.com','N'),
(16,'David.Baker@desbprint.com','Y'),
(17,'Simon.Hall@desbprint.com','Y'),
(18,'Meg.Rivera@desbprint.com','Y'),
(19,'Pippa.Campbell@desbprint.com','Y'),
(20,'Marty.Mitchell@desbprint.com','Y'),
(21,'Judy.Carter@desbprint.com','Y'),
(22,'Greg.Roberts@desbprint.com','Y'),
(23,'Brian.Gomez@desbprint.com','Y'),
(24,'Amy.Phillips@desbprint.com','Y'),
(24,'Amy.Phillips@gmaul.com','N'),
(25,'Dan.Evans@desbprint.com','Y'),
(26,'David.Bailey@desbprint.com','Y'),
(27,'Donald.Reed@desbprint.com','Y'),
(28,'Janice.Kelly@desbprint.com','Y'),
(29,'Roy.Howard@desbprint.com','Y'),
(30,'Davies.Ramos@desbprint.com','Y'),
(31,'Daniel.Kim@desbprint.com','Y'),
(32,'Davies.Cox@desbprint.com','Y'),
(33,'Susan.Ward@desbprint.com','Y'),
(33,'Susan.Ward@yayhoo.com','N'),
(34,'Glen.Richardson@desbprint.com','Y'),
(35,'John.Watson@desbprint.com','Y'),
(36,'Luci.Brooks@desbprint.com','Y'),
(36,'Luci.Brooks@yayhoo.com','N'),
(37,'Bob.Chavez@desbprint.com','Y'),
(38,'Jason.Wood@desbprint.com','Y'),
(39,'Brad.James@desbprint.com','Y'),
(40,'Frederick.Bennet@desbprint.com','Y')
;

DROP TABLE IF EXISTS ServiceRep;
CREATE TABLE ServiceRep
( EmployeeID            SMALLINT NOT NULL,
  HourlyRate            DECIMAL (8,2),
  CONSTRAINT PK_ServiceRep_EmployeeID Primary Key ( EmployeeID ),
  CONSTRAINT FK_ServiceRep_EmployeeID Foreign Key ( EmployeeID ) References Employee ( EmployeeID )
);
INSERT INTO ServiceRep (EmployeeID, HourlyRate)
VALUES (26,24.5),
(27,27.75),
(28,28),
(29,28.6),
(30,30.9)
;

DROP TABLE IF EXISTS SalesRep;
CREATE TABLE SalesRep
( EmployeeID            SMALLINT NOT NULL,
  ServiceRepEmpID       SMALLINT NOT NULL,
  Comission_Rate        DECIMAL,
  Salary                DECIMAL (8,2),
  CONSTRAINT PK_SalesRep_EmployeeID Primary Key ( EmployeeID ),
  CONSTRAINT FK_SalesRep_EmployeeID Foreign Key ( EmployeeID ) References Employee ( EmployeeID ),
  CONSTRAINT FK_SalesRep_ServiceRepEmpID Foreign Key ( ServiceRepEmpID) References ServiceRep ( EmployeeID ),
);
INSERT INTO SalesRep (EmployeeID, ServiceRepEmpID, Comission_Rate, Salary)
VALUES (31,26,0.05,2000),
(32,26,0.05,2400),
(33,27,0.05,2300),
(34,27,0.05,2000),
(35,28,0.05,2500),
(36,28,0.05,2800),
(37,29,0.07,2100),
(38,29,0.07,2200),
(39,30,0.07,2650),
(40,30,0.08,3740)
;

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers
( CustomerID		SMALLINT NOT NULL IDENTITY(1,1),
  EmployeeID		SMALLINT NOT NULL,
  CompanyName		VARCHAR(30) NOT NULL,
  MainPhone			VARCHAR(15) NOT NULL,
  StreetAddress		VARCHAR(30) NOT NULL,
  City				VARCHAR(25) NOT NULL,
  State				CHAR(2) NOT NULL,
  Zip				VARCHAR(10) NOT NULL,
  CONSTRAINT PK_Customers_CustomerID PRIMARY KEY ( CustomerID ),
  CONSTRAINT FK_Customers_EmployeeID_SalesRep FOREIGN KEY ( EmployeeID ) REFERENCES SalesRep ( EmployeeID )
);

INSERT INTO Customers ( EmployeeID, CompanyName, MainPhone, StreetAddress, City, State, Zip)
VALUES (31,'APPLE INC','(273) 277-9354','85 Crooked Hill Road','Paisley','FL','76619'),
(31,'SAUDI ARAMCO','(331) 969-5723','872 Route 13','Vero Beach South','GA','86695'),
(32,'MICROSOFT CORP','(312) 537-3650','279 Troy Road','Bryantown','HI','36460'),
(32,'AMAZON.COM INC','(912) 252-1733','2465 Hempstead Turnpike','Ballard','ID','46117'),
(33,'ALPHABET INC','(617) 552-6812','6438 Basile Rowe','Kranzburg','IL','56116'),
(33,'FACEBOOK INC','(532) 215-8589','25737 US Rt 11','Benzonia','IN','66117'),
(34,'TENCENT','(324) 336-8840','901 Route 110','Riviera Beach','IA','96107'),
(34,'TESLA INC','(951) 215-7075','2400 Route 9','Manilla','KS','35650'),
(35,'ALIBABA GRP','(759) 959-2800','10401 Bennett Road','Mora','KY','45661'),
(35,'BERKSHIRE HATHAWAY','(943) 385-3493','1818 State Route 3','International Falls','LA','55476'),
(36,'TSMC','(370) 422-7819','4300 Lakeville Road','Lake Catherine','ME','65647'),
(36,'VISA INC','(272) 747-6073','990 Route 5 20','Bountiful','MD','76801'),
(37,'JPMORGAN CHASE','(424) 481-3117','311 RT 9W','Manhattan Beach','MA','86203'),
(37,'JOHNSON & JOHNSON','(734) 769-2233','200 Dutch Meadows Ln','Ballou','MI','96360'),
(38,'SAMSUNG ELECTRONICS','(462) 957-7843','100 Elm Ridge Center Dr','Cerro Gordo','MN','15124'),
(38,'KWEICHOW MOUTA','(645) 426-7647','1549 Rt 9','Stevinson','MS','25125'),
(39,'WALMART INC','(893) 945-5396','5360 Southwestern Blvd','Blacksburg','MO','36867'),
(39,'MASTERCARD INC','(983) 200-9532','103 North Caroline St','Aroma Park','MT','46066'),
(40,'UNITEDHEALTH GRP','(893) 540-9556','1000 State Route 36','Oley','NE','56274'),
(40,'LVMH MOET HENNESSY','(348) 249-5417','1400 County Rd 64','Earlham','NV','65653')
;

DROP TABLE IF EXISTS CustomerContact;
CREATE TABLE CustomerContact
( CustContactID			SMALLINT  NOT NULL IDENTITY(1,1),
  CustomerID			SMALLINT  NOT NULL,
  FullName				VARCHAR(40) NOT NULL,
  ContactPhone			VARCHAR(15)  NOT NULL,
  ContactEmail			VARCHAR(30)  NOT NULL,
  BirthDate				DATE NOT NULL,
  CONSTRAINT PK_CustomerContact_CustContactID_CustomerID PRIMARY KEY ( CustContactID, CustomerID ),
  CONSTRAINT FK_CustomerContact_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES Customers ( CustomerID )
);
INSERT INTO CustomerContact (CustomerID, FullName, ContactPhone, ContactEmail, BirthDate)
VALUES (1,'John Rodriguez','(453) 859-1423','john.rodriguez@customer.com','1975-06-23'),
(2,'Kathi Martinez','(958) 388-3739','kathi.martinez@customer.com','1983-07-18'),
(3,'Patrick Hernandez','(396) 388-1059','patrick.hernandez@customer.com','1962-06-13'),
(4,'Stephan Lopez','(893) 388-7459','stephan.lopez@customer.com','1992-10-22'),
(5,'Stephan Gonzales','(694) 600-4591','stephan.gonzales@customer.com','1960-08-24'),
(6,'David Wilson','(703) 983-9298','david.wilson@customer.com','1961-04-28'),
(7,'Mike Anderson','(992) 510-4402','mike.anderson@customer.com','1971-12-20'),
(8,'Frederick Thomas','(682) 317-1614','frederick.thomas@customer.com','1987-12-21'),
(9,'Brad Taylor','(933) 933-9629','brad.taylor@customer.com','1960-05-21'),
(10,'Jason Moore','(244) 621-7076','jason.moore@customer.com','1978-04-28'),
(11,'Bob Morgan','(372) 234-2097','bob.morgan@customer.com','1966-10-09'),
(12,'Luci Cooper','(823) 866-4958','luci.cooper@customer.com','1975-12-15'),
(13,'John Peterson','(259) 609-3941','john.peterson@customer.com','1975-01-16'),
(14,'Glen Bailey','(841) 935-5785','glen.bailey@customer.com','1981-01-19'),
(15,'Charlse Reed','(694) 987-5845','charlse.reed@customer.com','1964-08-16'),
(16,'Dan Kelly','(602) 761-1014','dan.kelly@customer.com','1966-05-20'),
(17,'Madison Howard','(427) 651-9085','madison.howard@customer.com','1985-03-12'),
(18,'Richard Ramos','(606) 617-7730','richard.ramos@customer.com','1995-08-30'),
(19,'Carley Kim','(781) 255-4633','carley.kim@customer.com','1989-03-31'),
(20,'Belinda Cox','(642) 942-6260','belinda.cox@customer.com','1984-02-11')
;

DROP TABLE IF EXISTS Production;
CREATE TABLE Production
( EmployeeID            SMALLINT NOT NULL,
  --OrderID               INT  NOT NULL,
  HourlyRate            DECIMAL (8,2),
  CONSTRAINT PK_Production_EmployeeID Primary Key ( EmployeeID ),
  CONSTRAINT FK_Production_EmployeeID Foreign Key ( EmployeeID ) References Employee ( EmployeeID )
  --,CONSTRAINT FK_Production_OrderID Foreign Key ( OrderID ) References Orders ( OrderID )
);

INSERT INTO Production (EmployeeID, HourlyRate)
VALUES (1,26.75),
(2,13.25),
(3,15.75),
(4,32),
(5,37.5),
(6,22),
(7,18.5),
(8,19.75),
(9,18.9),
(10,24.74),
(11,20),
(12,21.5),
(13,17.8),
(14,36.5),
(15,21.2),
(16,18.12),
(17,34.89),
(18,22.25),
(19,19.6)
;

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
( OrderID				INT  NOT NULL IDENTITY(1,1),
  CustomerID			SMALLINT  NOT NULL,
  OrderDate				DATE NOT NULL,
  OrderTime				TIME NOT NULL,
  CONSTRAINT PK_Orders_OrderID PRIMARY KEY ( OrderID ),
  CONSTRAINT FK_Orders_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES Customers ( CustomerID )
);

INSERT INTO Orders (CustomerID, OrderDate, OrderTime)
VALUES (19,'2021-05-03','10:55:30.000'),
(11,'2021-01-08','08:30:00.000'),
(5,'2021-11-25','09:45:30.000'),
(4,'2021-05-16','10:20:15.000'),
(14,'2021-11-27','11:05:22.000'),
(19,'2021-05-30','12:15:50.000'),
(4,'2021-04-07','13:38:20.000'),
(9,'2021-03-23','14:46:55.000'),
(5,'2021-06-14','16:19:18.000'),
(19,'2021-08-21','16:48:25.000'),
(20,'2021-09-01','15:18:05.000'),
(11,'2021-01-29','15:32:45.000'),
(1,'2021-03-07','16:19:18.000'),
(16,'2021-01-15','16:48:25.000'),
(12,'2021-07-20','16:55:32.000'),
(19,'2021-04-01','12:15:50.000'),
(12,'2021-08-27','11:05:22.000'),
(4,'2021-10-30','10:20:15.000'),
(20,'2021-08-29','08:30:00.000'),
(7,'2021-09-13','12:15:50.000'),
(20,'2021-09-06','16:48:25.000'),
(17,'2021-10-03','13:38:20.000'),
(7,'2021-05-02','14:46:55.000'),
(17,'2021-05-05','16:48:25.000'),
(18,'2021-01-31','16:19:18.000'),
(2,'2021-02-22','16:48:25.000'),
(15,'2021-11-10','10:20:15.000'),
(3,'2021-05-05','09:45:30.000'),
(6,'2021-11-17','12:15:50.000'),
(2,'2021-06-13','13:38:20.000'),
(2,'2021-08-27','16:19:18.000'),
(10,'2021-05-21','11:05:22.000'),
(2,'2021-09-30','16:19:18.000'),
(6,'2021-04-06','10:20:15.000'),
(10,'2021-07-10','09:45:30.000'),
(13,'2021-06-01','12:15:50.000'),
(20,'2021-03-17','08:30:00.000'),
(11,'2021-06-05','16:19:18.000'),
(1,'2021-09-06','09:45:30.000'),
(5,'2021-07-14','13:38:20.000')
;

DROP TABLE IF EXISTS OrderLine;
CREATE TABLE OrderLine
( OrderLineID			SMALLINT  NOT NULL IDENTITY(1,1),
  OrderID				INT  NOT NULL,
  Description			VARCHAR(100) NOT NULL,
  Quantity				SMALLINT  NOT NULL,
  Price					DECIMAL(7,2)  NOT NULL,
  CONSTRAINT PK_OrderLine_OrderLineID_OrderID PRIMARY KEY ( OrderLineID, OrderID ),
  CONSTRAINT FK_OrderLine_OrderID FOREIGN KEY ( OrderID ) REFERENCES Orders ( OrderID )
);

INSERT INTO OrderLine (OrderID, Description, Price, Quantity)
VALUES (1,'Posters',500,205),
(2,'Menu Cards',2000,325),
(3,'Tickets',5000,275),
(3,'Direct Mail',450,269),
(4,'Postcards',1000,260),
(5,'Envelopes',2000,425),
(6,'Business Cards',250,72),
(7,'Booklet - Stitched',600,498),
(8,'Brochure',3000,395),
(8,'Flyer',750,186),
(8,'Posters',500,205),
(9,'Menu Cards',2000,325),
(10,'Tickets',5000,275),
(11,'Direct Mail',450,269),
(12,'Postcards',1000,260),
(13,'Envelopes',2000,425),
(14,'Business Cards',250,72),
(14,'Booklet - Stitched',600,498),
(15,'Brochure',3000,395),
(15,'Flyer',750,186),
(16,'Posters',500,205),
(17,'Menu Cards',2000,325),
(18,'Tickets',5000,275),
(19,'Direct Mail',450,269),
(19,'Postcards',1000,260),
(20,'Envelopes',2000,425),
(20,'Business Cards',250,72),
(21,'Booklet - Stitched',600,498),
(22,'Brochure',3000,395),
(23,'Flyer',750,186),
(24,'Posters',500,205),
(25,'Menu Cards',2000,325),
(26,'Tickets',5000,275),
(26,'Direct Mail',450,269),
(27,'Postcards',1000,260),
(27,'Envelopes',2000,425),
(27,'Business Cards',250,72),
(28,'Booklet - Stitched',600,498),
(29,'Brochure',3000,395),
(30,'Flyer',750,186),
(31,'Posters',500,205),
(32,'Menu Cards',2000,325),
(33,'Tickets',5000,275),
(34,'Direct Mail',450,269),
(35,'Postcards',1000,260),
(36,'Envelopes',2000,425),
(37,'Business Cards',250,72),
(38,'Booklet - Stitched',600,498),
(39,'Brochure',3000,395),
(40,'Flyer',750,186)
;

DROP TABLE IF EXISTS Accounting;
CREATE TABLE Accounting
( EmployeeID             SMALLINT NOT NULL,
  Salary                 DECIMAL (8,2),
  CONSTRAINT PK_Accounting_EmployeeID Primary Key ( EmployeeID ),
  CONSTRAINT FK_Accounting_EmployeeID Foreign Key ( EmployeeID ) References Employee ( EmployeeID )
);

INSERT INTO Accounting (EmployeeID, Salary)
VALUES (20,126000),
(21,92450),
(22,86852),
(23,64500),
(24,72500),
(25,62750)
;

DROP TABLE IF EXISTS Invoice;
CREATE TABLE Invoice
( InvoiceID				INT  NOT NULL IDENTITY(1,1),
  EmployeeID			SMALLINT  NOT NULL,
  CustomerID			SMALLINT NOT NULL,
  OrderID				INT NOT NULL,
  InvoiceDate			DATE NOT NULL,
  --OrderTime			TIME NOT NULL,
  CONSTRAINT PK_Invoice_InvoiceID PRIMARY KEY ( InvoiceID ),
  CONSTRAINT FK_Invoice_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Accounting ( EmployeeID ),
  CONSTRAINT FK_Invoice_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES Customers ( CustomerID ),
  CONSTRAINT FK_Invoice_OrderID FOREIGN KEY ( OrderID ) REFERENCES Orders ( OrderID )
);

INSERT INTO Invoice (EmployeeID, CustomerID, OrderID, InvoiceDate)
VALUES (23,19,1,'2021-06-03'),
(23,11,2,'2021-02-08'),
(23,5,3,'2021-12-23'),
(23,4,4,'2021-06-16'),
(25,14,5,'2021-12-27'),
(23,19,6,'2021-06-30'),
(23,4,7,'2021-05-07'),
(23,9,8,'2021-04-23'),
(23,5,9,'2021-07-14'),
(25,19,10,'2021-09-21'),
(23,20,11,'2021-10-01'),
(23,11,12,'2021-02-25'),
(23,1,13,'2021-04-07'),
(23,16,14,'2021-03-15'),
(23,12,15,'2021-08-20'),
(25,19,16,'2021-05-01'),
(23,12,17,'2021-09-27'),
(23,4,18,'2021-11-30'),
(23,20,19,'2021-09-29'),
(23,7,20,'2021-11-13'),
(23,20,21,'2021-11-06'),
(23,17,22,'2021-11-03'),
(23,7,23,'2021-06-02'),
(25,17,24,'2021-06-05'),
(23,18,25,'2021-02-20'),
(23,2,26,'2021-03-22'),
(23,15,27,'2021-12-10'),
(23,3,28,'2021-06-05'),
(23,6,29,'2021-12-17'),
(23,2,30,'2021-07-13'),
(23,2,31,'2021-09-27'),
(23,10,32,'2021-06-21'),
(23,2,33,'2021-10-30'),
(25,6,34,'2021-05-06'),
(23,10,35,'2021-08-10'),
(23,13,36,'2021-09-01'),
(23,20,37,'2021-04-17'),
(23,11,38,'2021-07-05'),
(23,1,39,'2021-10-06'),
(23,5,40,'2021-08-14')
;

DROP TABLE IF EXISTS InvoiceLine;
CREATE TABLE InvoiceLine
( InvoiceLineID			SMALLINT  NOT NULL IDENTITY(1,1),
  InvoiceID				INT  NOT NULL,
  Description			VARCHAR(100) NOT NULL,
  Quantity				SMALLINT  NOT NULL,
  Price					DECIMAL(7,2)  NOT NULL,
  CONSTRAINT PK_InvoiceLine_InvoiceLineID_InvoiceID PRIMARY KEY ( InvoiceLineID, InvoiceID ),
  CONSTRAINT FK_InvoiceLine_InvoiceID FOREIGN KEY ( InvoiceID ) REFERENCES Invoice ( InvoiceID )
);

INSERT INTO InvoiceLine (InvoiceID, Description, Quantity, Price)
VALUES (1,'Posters',500,205),
(2,'Menu Cards',2000,325),
(3,'Tickets',5000,275),
(3,'Direct Mail',450,269),
(4,'Postcards',1000,260),
(5,'Envelopes',2000,425),
(6,'Business Cards',250,72),
(7,'Booklet - Stitched',600,498),
(8,'Brochure',3000,395),
(8,'Flyer',750,186),
(8,'Posters',500,205),
(9,'Menu Cards',2000,325),
(10,'Tickets',5000,275),
(11,'Direct Mail',450,269),
(12,'Postcards',1000,260),
(13,'Envelopes',2000,425),
(14,'Business Cards',250,72),
(14,'Booklet - Stitched',600,498),
(15,'Brochure',3000,395),
(15,'Flyer',750,186),
(16,'Posters',500,205),
(17,'Menu Cards',2000,325),
(18,'Tickets',5000,275),
(19,'Direct Mail',450,269),
(19,'Postcards',1000,260),
(20,'Envelopes',2000,425),
(20,'Business Cards',250,72),
(21,'Booklet - Stitched',600,498),
(22,'Brochure',3000,395),
(23,'Flyer',750,186),
(24,'Posters',500,205),
(25,'Menu Cards',2000,325),
(26,'Tickets',5000,275),
(26,'Direct Mail',450,269),
(27,'Postcards',1000,260),
(27,'Envelopes',2000,425),
(27,'Business Cards',250,72),
(28,'Booklet - Stitched',600,498),
(29,'Brochure',3000,395),
(30,'Flyer',750,186),
(31,'Posters',500,205),
(32,'Menu Cards',2000,325),
(33,'Tickets',5000,275),
(34,'Direct Mail',450,269),
(35,'Postcards',1000,260),
(36,'Envelopes',2000,425),
(37,'Business Cards',250,72),
(38,'Booklet - Stitched',600,498),
(39,'Brochure',3000,395),
(40,'Flyer',750,186)
;

--CREATE the Vendors table
DROP TABLE IF EXISTS Vendors;
CREATE TABLE Vendors
(	VendorID			SMALLINT NOT NULL IDENTITY(1,1),
	VendorName			VARCHAR(50),
	VendorDescription	VARCHAR(100),
	StreetAddress		VARCHAR(50),
	City				VARCHAR (30),
	State				CHAR(2), 
	Zipcode				VARCHAR (10),
	PhoneNumber			VARCHAR(15),
CONSTRAINT PK_Vendors_VendorID PRIMARY KEY ( VendorID )
);

INSERT INTO Vendors (VendorName, VendorDescription, StreetAddress, City, State, Zipcode, PhoneNumber)
VALUES ('SKYMAIL INTERNATIONAL INC','Mailing Services','1476 S 3600 W SUITE B  ','SALT LAKE CITY','UT','84104','(801) 388-3739'),
('TRADE PRINT FINISHING','Coil Binding Materials','2530 S WEST TEMPLE  ','SALT LAKE CITY','UT','84115','(801) 388-1059'),
('TRU-CUT','Finishing Materials','3045 W DIRECTORS ROW UNIT B','SALT LAKE CITY','UT','84104','(801) 388-7459'),
('PERFECT REGISTER','Bindery Materials','1850 S 900 W  ','SALT LAKE CITY','UT','84104','(801) 600-4591'),
('LEFAVOR ENVELOPE CO.','Envelopes','PO BOX 27238  ','SALT LAKE CITY','UT','84127-0035','(801) 983-9298'),
('FOIL GRAPHICS','Cutting Dies','2550 DECKER LAKE BLVD  #7','SALT LAKE CITY','UT','84119','(801) 510-4402'),
('FUJIFILM NORTH AMERICA INC','Printing Plates','4572 WEST CALIFORNIA AVE  SUITE A100-200','SALT LAKE CITY','UT','84104','(801) 317-1614'),
('GRAPHIC INK','Offset Litho Inks','PO BOX 27488  ','SALT LAKE CITY','UT','84127-0488','(801) 933-9629'),
('INTERMOUNTAIN PRINT FINISHING INC','Wire-O Binding Materials','4033 S 210 W  ','SALT LAKE CITY','UT','84107','(801) 621-7076'),
('CONSOLIDATED DIRECT MAIL','Mailing Services','2550 S DECKER LAKE BLVD #18  ','SALT LAKE CITY','UT','84119','(801) 234-2097'),
('CPMI SOLUTIONS','Digital Toners','3781 WEST 2270 SOUTH, SUITE A  ','SALT LAKE CITY','UT','84120','(801) 866-4958'),
('CUTTING EDGE','Cutting Blades and Sharpening','1415 700 W #5  ','SALT LAKE CITY','UT','84104','(801) 609-3941'),
('EAGLE DIRECT RESPONSE','Mailing Services','1939 SOUTH 4130 WEST  ','SALT LAKE CITY','UT','84104','(801) 935-5785'),
('SALT LAKE MAILING & PRINTING','Mailing Services','1841 PIONEER ROAD  ','SALT LAKE CITY','UT','84104','(801) 987-5845'),
('PACKSIZE NOW','Shipping Cartons','2590 WEST DIRECTORS ROW, SUITE D  ','SALT LAKE CITY','UT','84104','(801) 761-1014'),
('ONE STOP','CD Duplication and Replication','3149 SOUTH STATE STREET, SUITE A  ','SALT LAKE CITY','UT','84115','(801) 651-9085'),
('VISIBLE SCM PACKAGING','Product Packaging','5160 WILEY POST WAY  ','SALT LAKE CITY ','UT','84116','(801) 617-7730'),
('TURNKEY DIRECT INC','Stitching Wire','265 WEST CENTRAL AVE  ','SALT LAKE CITY ','UT','84107','(801) 255-4633'),
('KELLY SPICERS STORE','Printing Paper','215 ADMIRAL BYRD ROAD, SUITE 100  ','LOS ANGELES','CA','90074-9317','(642) 942-6260'),
('SPICERS PAPER','Printing Paper','515 WEST PICKETTE CIRCLE','LOS ANGELES','CA','90074-9316','(814) 896-3233')
;

Drop TABLE IF EXISTS PurchaseOrder;
CREATE TABLE PurchaseOrder
( PurchaseOrderID			SMALLINT NOT NULL IDENTITY (1,1),
  VendorID					SMALLINT NOT NULL,
  EmployeeID				SMALLINT NOT NULL,
  OrderDate					DATE NOT NULL,
  CONSTRAINT PK_PurchaseOrder_PurchaseOrderID_VendorID Primary Key ( PurchaseOrderID, VendorID ), 
  CONSTRAINT FK_PurchaseOrder_VendorID Foreign Key ( VendorID ) References Vendors ( VendorID ),
  CONSTRAINT FK_PurchaseOrder_EmployeeID Foreign Key ( EmployeeID) References Accounting ( EmployeeID), 
); 

INSERT INTO PurchaseOrder (VendorID, EmployeeID, OrderDate)
VALUES (20,24,'2021-09-01'),
(20,24,'2021-01-29'),
(20,24,'2021-03-07'),
(20,24,'2021-01-15'),
(20,24,'2021-07-20'),
(20,24,'2021-04-01'),
(20,24,'2021-08-27'),
(20,24,'2021-10-30'),
(20,24,'2021-08-29'),
(20,24,'2021-09-13'),
(11,24,'2021-09-06'),
(8,24,'2021-10-03'),
(19,24,'2021-05-02'),
(19,24,'2021-05-05'),
(19,24,'2021-01-31'),
(19,24,'2021-02-22'),
(19,24,'2021-11-10'),
(19,24,'2021-05-05'),
(9,24,'2021-11-17'),
(2,24,'2021-06-13'),
(20,24,'2021-08-27'),
(20,24,'2021-05-21'),
(3,24,'2021-09-30'),
(18,24,'2021-04-06'),
(17,24,'2021-07-10'),
(7,24,'2021-06-01'),
(7,24,'2021-03-17'),
(19,24,'2021-06-05'),
(19,24,'2021-09-06'),
(9,24,'2021-07-14'),
(20,24,'2021-02-28'),
(20,24,'2021-03-17'),
(19,24,'2021-10-03'),
(8,24,'2021-01-31'),
(11,24,'2021-02-22'),
(20,24,'2021-11-10'),
(7,24,'2021-05-05'),
(17,24,'2021-11-17'),
(18,24,'2021-06-13'),
(20,24,'2021-02-01')
;

--CREATE the Materials table
DROP TABLE IF EXISTS Materials;
CREATE TABLE Materials
(	MaterialID					SMALLINT NOT NULL IDENTITY(1,1),
	VendorID					SMALLINT NOT NULL,
	Description					VARCHAR(100),
	Price						DECIMAL(8,2)
CONSTRAINT PK_Materials_MaterialID_VendorID_PurchaseOrderID PRIMARY KEY ( MaterialID, VendorID ),
CONSTRAINT FK_Materials_VendorID FOREIGN KEY (VendorID) REFERENCES Vendors (VendorID)
);

INSERT INTO Materials (VendorID, Description, Price)
VALUES (20,'Topkote Gloss 100lb Text',100),
(20,'Topkote Gloss 100lb Cover',120),
(20,'Sundance 110lb Cover',125),
(20,'Mohawk 80lb Smooth Cover',320),
(20,'Mohawk 80lb Smooth Text',210),
(19,'Williamsburg 50LB Smooth Uncoated  Offset',180),
(19,'Williamsburg 70LB Smooth Uncoated  Offset',169),
(20,'Pacesetter Digital 100LB Gloss Coated Text',111),
(20,'Pacesetter Digital 130LB Silk Coated Cover',169),
(20,'Pacesetter Digital 100LB Silk Coated Text',122),
(20,'Pacesetter #9 Envelopes 24LB Wove Env',350),
(20,'Pacesetter #10 Regular 24LB Wove Env',450),
(11,'Digital Toner 4 Color Process',55),
(8,'Offset Litho Ink CYMK',26),
(7,'Printing Plates',12),
(17,'Shipping Cartons',4.25),
(9,'Wire-O Spools',152),
(2,'Coil Binding Sticks',21),
(18,'Stitching Wire',210),
(3,'Optically Clear Laminate',110)
;

DROP TABLE IF EXISTS PurchaseOrderLine;
CREATE TABLE PurchaseOrderLine
( PurchaseOrderLineID		SMALLINT NOT NULL IDENTITY (1,1),
  PurchaseOrderID			SMALLINT NOT NULL,
  VendorID					SMALLINT NOT NULL,
  MaterialID				SMALLINT NULL DEFAULT NULL,
  Description				VARCHAR(100),
  Price						Decimal(8,2),
  Quantity 					SMALLINT NOT NULL,
  CONSTRAINT PK_PurchaseOrderLine_PurchaseOrderLineID_PuchaseOrderID Primary Key ( PurchaseOrderLineID, PurchaseOrderID ),
  CONSTRAINT FK_PurchaseOrderLine_PurchaseOrderID_VendorID Foreign Key ( PurchaseOrderID, VendorID ) References PurchaseOrder ( PurchaseOrderID, VendorID ),
  CONSTRAINT FK_PurchaseOrderLine_MaterialID_VendorID Foreign Key ( MaterialID, VendorID ) References Materials ( MaterialID, VendorID ),
  );

  INSERT INTO PurchaseOrderLine (PurchaseOrderID, VendorID, MaterialID, Description, Price, Quantity)
  VALUES (1,20,1,'Topkote Gloss 100lb Text',100,2),
(1,20,2,'Topkote Gloss 100lb Cover',120,3),
(2,20,4,'Mohawk 80lb Smooth Cover',320,1),
(3,20,11,'Pacesetter #9 Envelopes 24LB Wove Env',350,1),
(4,20,1,'Topkote Gloss 100lb Text',100,1),
(5,20,2,'Topkote Gloss 100lb Cover',120,1),
(6,20,3,'Sundance 110lb Cover',125,1),
(7,20,4,'Mohawk 80lb Smooth Cover',320,1),
(8,20,5,'Mohawk 80lb Smooth Text',210,1),
(9,20,1,'Topkote Gloss 100lb Text',100,2),
(10,20,2,'Topkote Gloss 100lb Cover',120,3),
(11,11,13,'Digital Toner 4 Color Process',55,1),
(12,8,14,'Offset Litho Ink CYMK',26,1),
(13,19,6,'Williamsburg 50LB Smooth Uncoated  Offset',180,1),
(14,19,7,'Williamsburg 70LB Smooth Uncoated  Offset',169,1),
(15,19,6,'Williamsburg 50LB Smooth Uncoated  Offset',180,1),
(16,19,7,'Williamsburg 70LB Smooth Uncoated  Offset',169,1),
(17,19,6,'Williamsburg 50LB Smooth Uncoated  Offset',180,1),
(18,19,7,'Williamsburg 70LB Smooth Uncoated  Offset',169,1),
(19,9,17,'Shipping Cartons',4.25,1),
(20,2,18,'Coil Binding Sticks',21,1),
(21,20,1,'Topkote Gloss 100lb Text',100,1),
(22,20,2,'Topkote Gloss 100lb Cover',120,1),
(23,3,20,'Optically Clear Laminate',110,1),
(24,18,19,'Stitching Wire',210,1),
(25,17,16,'Shipping Cartons',4.25,1),
(26,7,15,'Printing Plates',12,100),
(27,7,15,'Printing Plates',12,200),
(28,19,6,'Williamsburg 50LB Smooth Uncoated  Offset',180,1),
(28,19,7,'Williamsburg 70LB Smooth Uncoated  Offset',169,2),
(29,19,6,'Williamsburg 50LB Smooth Uncoated  Offset',180,1),
(30,9,17,'Shipping Cartons',4.25,250),
(31,20,8,'Pacesetter Digital 100LB Gloss Coated Text',111,1),
(32,20,9,'Pacesetter Digital 130LB Silk Coated Cover',169,1),
(33,19,6,'Williamsburg 50LB Smooth Uncoated  Offset',180,1),
(34,8,14,'Offset Litho Ink CYMK',26,5),
(35,11,13,'Digital Toner 4 Color Process',55,4),
(36,20,12,'Pacesetter #10 Regular 24LB Wove Env',450,1),
(37,7,15,'Offset Litho Ink CYMK',26,1),
(38,17,16,'Shipping Cartons',4.25,100),
(39,18,19,'Stitching Wire',210,1),
(40,20,3,'Sundance 110lb Cover',125,1)
;

  Drop Table if exists Machine;
Create Table Machine
( MachineID			SMALLINT NOT NULL IDENTITY (1,1),
  Name				VARCHAR(30) NOT NULL,
  Description		VARCHAR(100) NULL DEFAULT NULL,
  CONSTRAINT PK_MACHINE_MachineID PRIMARY KEY (MachineID)
  );

  INSERT INTO Machine (Name, Description)
  VALUES ('Man Roland MR500','Offset Press'),
('Xerox D136','Digital Printer'),
('HP Indigo 7900','Digital Printer'),
('Konica 6120','Digital Printer'),
('Konica C6085','Digital Printer'),
('Jet Press 750S','Inkjet Press'),
('Ricoh C9210','Digital Printer'),
('Kompac Onyx 30 Coater','Offline Coater'),
('Stahl F50 Folder','Folder'),
('Itotec 56in Cutter','Guillotine Cutter'),
('Seal-O-Tron Shrink Wrapper','Shrink wrapper with heat tunnel'),
('Polar 36in Cutter','Guillotine Cutter'),
('Challenge MS5 Triple Drill','3-hole drill'),
('Rosback Stitcher','Saddle Stitcher'),
('JB Speedy-Lam 330R10l','Laminator')
;

  Drop table if exists Job;
Create Table Job
( JobID			SMALLINT NOT NULL IDENTITY(1,1),
  OrderLineID	SMALLINT NOT NULL,
  OrderID		INT NOT NULL,
  Description	VARCHAR(100) NOT NULL,
  CONSTRAINT PK_JOB_JOBID PRIMARY KEY (JobID),
  CONSTRAINT FK_JOB_OrderLineID_OrderLine FOREIGN KEY ( OrderLineID, OrderID ) REFERENCES OrderLine ( OrderLineID, OrderID )
); 

INSERT INTO Job (OrderLineID, OrderID, Description)
VALUES (1,1,'Posters'),
(2,2,'Menu Cards'),
(3,3,'Tickets'),
(4,3,'Direct Mail'),
(5,4,'Postcards'),
(6,5,'Envelopes'),
(7,6,'Business Cards'),
(8,7,'Booklet - Stitched'),
(9,8,'Brochure'),
(10,8,'Flyer'),
(11,8,'Posters'),
(12,9,'Menu Cards'),
(13,10,'Tickets'),
(14,11,'Direct Mail'),
(15,12,'Postcards'),
(16,13,'Envelopes'),
(17,14,'Business Cards'),
(18,14,'Booklet - Stitched'),
(19,15,'Brochure'),
(20,15,'Flyer'),
(21,16,'Posters'),
(22,17,'Menu Cards'),
(23,18,'Tickets'),
(24,19,'Direct Mail'),
(25,19,'Postcards'),
(26,20,'Envelopes'),
(27,20,'Business Cards'),
(28,21,'Booklet - Stitched'),
(29,22,'Brochure'),
(30,23,'Flyer'),
(31,24,'Posters'),
(32,25,'Menu Cards'),
(33,26,'Tickets'),
(34,26,'Direct Mail'),
(35,27,'Postcards'),
(36,27,'Envelopes'),
(37,27,'Business Cards'),
(38,28,'Booklet - Stitched'),
(39,29,'Brochure'),
(40,30,'Flyer'),
(41,31,'Posters'),
(42,32,'Menu Cards'),
(43,33,'Tickets'),
(44,34,'Direct Mail'),
(45,35,'Postcards'),
(46,36,'Envelopes'),
(47,37,'Business Cards'),
(48,38,'Booklet - Stitched'),
(49,39,'Brochure'),
(50,40,'Flyer')
;

 Drop TABLE if exists JobInput;
CREATE TABLE JobInput
( JobInputID		SMALLINT NOT NULL IDENTITY (1,1),
  JobID				SMALLINT NOT NULL,
  PurchaseOrderID	SMALLINT NOT NULL,
  VendorID			SMALLINT NOT NULL,
  Description			VARCHAR(100),
  CONSTRAINT PK_JobInput_JobInputID PRIMARY KEY ( JobInputID ),
  CONSTRAINT FK_JobInput_JobID Foreign key (JobID) References Job ( JobID ),
  CONSTRAINT FK_JobInput_PurchaseOrderID_VendorID FOREIGN KEY (PurchaseOrderID, VendorID) REFERENCES PurchaseOrder ( PurchaseOrderID, VendorID),
  );

INSERT INTO JobInput (JobID, PurchaseOrderID, VendorID, Description )
VALUES (1,1,20,'Paper'),
(1,11,11,'Ink'),
(2,2,20,'Paper'),
(3,3,20,'Paper'),
(4,4,20,'Paper'),
(5,5,20,'Paper'),
(6,6,20,'Paper'),
(7,7,20,'Paper'),
(8,8,20,'Paper'),
(9,9,20,'Paper'),
(10,10,20,'Paper'),
(11,14,19,'Paper'),
(12,15,19,'Paper'),
(13,16,19,'Paper'),
(14,17,19,'Paper'),
(15,18,19,'Paper'),
(16,21,20,'Paper'),
(17,22,20,'Paper'),
(18,28,19,'Paper'),
(19,29,19,'Paper'),
(20,31,20,'Paper')
;

   Drop TABLE if exists JobProduction;
CREATE TABLE JobProduction
( JobID					SMALLINT NOT NULL,
  MachineID				SMALLINT NOT NULL,
  StartDateTime			DATETIME NOT NULL,
  Instructions			VARCHAR(255) NOT NULL,	
  DESCRIPTION		VARCHAR(100),
  CONSTRAINT PK_JobProduction_JobID_MachineID_StartDateTime PRIMARY KEY ( JobID, MachineID, StartDateTime ),
  CONSTRAINT FK_JobProduction_JobID Foreign key (JobID) References Job ( JobID ),
  CONSTRAINT FK_JobProduction_MachineID FOREIGN KEY (MachineID) REFERENCES Machine ( MachineID )
  );

INSERT INTO JobProduction (JobID, MachineID, StartDateTime, Instructions)
VALUES (1,1,'2021-05-03 10:55:30.000','Print Posters'),
(2,2,'2021-01-08 08:30:00.000','Print Menu Cards'),
(3,3,'2021-11-25 09:45:30.000','Print Tickets'),
(4,3,'2021-05-16 10:20:15.000','Print Direct Mail Letters'),
(5,4,'2021-11-27 11:05:22.000','Print Postcards'),
(6,5,'2021-05-30 12:15:50.000','Print Envelopes'),
(7,6,'2021-04-07 13:38:20.000','Print Business Cards'),
(8,7,'2021-03-23 14:46:55.000','Print Booklet - Stitched'),
(9,1,'2021-06-14 16:19:18.000','Print Brochure'),
(10,2,'2021-08-21 16:48:25.000','Print Flyer'),
(11,3,'2021-09-01 15:18:05.000','Print Posters'),
(12,3,'2021-01-29 15:32:45.000','Print Menu Cards'),
(13,4,'2021-03-07 16:19:18.000','Print Tickets'),
(14,5,'2021-01-15 16:48:25.000','Print Direct Mail'),
(15,6,'2021-07-20 16:55:32.000','Print Postcards'),
(16,7,'2021-04-01 12:15:50.000','Print Envelopes'),
(17,1,'2021-08-27 11:05:22.000','Print Business Cards'),
(18,2,'2021-10-30 10:20:15.000','Print Booklet - Stitched'),
(19,3,'2021-08-29 08:30:00.000','Print Brochure'),
(20,3,'2021-09-13 12:15:50.000','Print Flyer'),
(21,4,'2021-09-06 16:48:25.000','Print Posters'),
(22,5,'2021-10-03 13:38:20.000','Print Menu Cards'),
(23,6,'2021-05-02 14:46:55.000','Print Tickets'),
(24,7,'2021-05-05 16:48:25.000','Print Direct Mail'),
(25,1,'2021-01-31 16:19:18.000','Print Postcards'),
(26,2,'2021-02-22 16:48:25.000','Print Envelopes'),
(27,3,'2021-11-10 10:20:15.000','Print Business Cards'),
(28,3,'2021-05-05 09:45:30.000','Print Booklet - Stitched'),
(29,4,'2021-11-17 12:15:50.000','Print Brochure'),
(30,5,'2021-06-13 13:38:20.000','Print Flyer')
;