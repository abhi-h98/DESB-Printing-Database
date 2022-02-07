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
  PhoneNumber			CHAR(12),
  StreetAddress			VARCHAR(100) NOT NULL,
  City					VARCHAR(30) NOT NULL,
  [State]				CHAR(2) NOT NULL,
  ZipCode				VARCHAR(10) NOT NULL
  CONSTRAINT PK_EMPLOYEE_EmployeeID PRIMARY KEY (EmployeeID)
);

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

DROP TABLE IF EXISTS ServiceRep;
CREATE TABLE ServiceRep
( EmployeeID            SMALLINT NOT NULL IDENTITY (1,1),
  HourlyRate            DECIMAL (8,2),
  CONSTRAINT PK_ServiceRep_EmployeeID Primary Key ( EmployeeID ),
  CONSTRAINT FK_ServiceRep_EmployeeID Foreign Key ( EmployeeID ) References Employee ( EmployeeID )
);


DROP TABLE IF EXISTS SalesRep;
CREATE TABLE SalesRep
( EmployeeID            SMALLINT NOT NULL IDENTITY (1,1),
  ServiceRepEmpID       SMALLINT NOT NULL,
  Comission_Rate        DECIMAL,
  Salary                DECIMAL (8,2),
  CONSTRAINT PK_SalesRep_EmployeeID Primary Key ( EmployeeID ),
  CONSTRAINT FK_SalesRep_EmployeeID Foreign Key ( EmployeeID ) References Employee ( EmployeeID ),
  CONSTRAINT FK_SalesRep_ServiceRepEmpID Foreign Key ( ServiceRepEmpID) References ServiceRep ( EmployeeID ),
);

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

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
( OrderID				INT  NOT NULL IDENTITY(1,1),
  CustomerID			SMALLINT  NOT NULL,
  OrderDate				DATE NOT NULL,
  OrderTime				TIME NOT NULL,
  CONSTRAINT PK_Orders_OrderID PRIMARY KEY ( OrderID ),
  CONSTRAINT FK_Orders_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES Customers ( CustomerID )
);

DROP TABLE IF EXISTS OrderLine;
CREATE TABLE OrderLine
( OrderLineID			SMALLINT  NOT NULL IDENTITY(1,1),
  OrderID				INT  NOT NULL,
  Description			VARCHAR(100) NOT NULL,
  Price					DECIMAL(7,2)  NOT NULL,
  Quantity				SMALLINT  NOT NULL,
  CONSTRAINT PK_OrderLine_OrderLineID_OrderID PRIMARY KEY ( OrderLineID, OrderID ),
  CONSTRAINT FK_OrderLines_OrderID FOREIGN KEY ( OrderID ) REFERENCES Orders ( OrderID )
);

DROP TABLE IF EXISTS Production;
CREATE TABLE Production
( EmployeeID            SMALLINT NOT NULL IDENTITY (1,1),
  OrderID               INT  NOT NULL,
  HourlyRate            DECIMAL (8,2),
  CONSTRAINT PK_Production_EmployeeID Primary Key ( EmployeeID ),
  CONSTRAINT FK_Production_EmployeeID Foreign Key ( EmployeeID ) References Employee ( EmployeeID ),
  CONSTRAINT FK_Production_OrderID Foreign Key ( OrderID ) References Orders ( OrderID )
);

DROP TABLE IF EXISTS Accounting;
CREATE TABLE Accounting
( EmployeeID             SMALLINT NOT NULL IDENTITY (1,1),
  Salary                 DECIMAL (8,2),
  CONSTRAINT PK_Accounting_EmployeeID Primary Key ( EmployeeID ),
  CONSTRAINT FK_Accounting_EmployeeID Foreign Key ( EmployeeID ) References Employee ( EmployeeID )
);

DROP TABLE IF EXISTS Invoice;
CREATE TABLE Invoice
( InvoiceID				INT  NOT NULL IDENTITY(1,1),
  EmployeeID			SMALLINT  NOT NULL,
  CustomerID			SMALLINT NOT NULL,
  OrderID				INT NOT NULL,
  OrderDate				DATE NOT NULL,
  OrderTime				TIME NOT NULL,
  CONSTRAINT PK_Invoice_InvoiceID PRIMARY KEY ( InvoiceID ),
  CONSTRAINT FK_Invoice_EmployeeID FOREIGN KEY ( EmployeeID ) REFERENCES Accounting ( EmployeeID ),
  CONSTRAINT FK_Invoice_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES Customers ( CustomerID ),
  CONSTRAINT FK_Invoice_OrderID FOREIGN KEY ( OrderID ) REFERENCES Orders ( OrderID )
);

DROP TABLE IF EXISTS InvoiceLine;
CREATE TABLE InvoiceLine
( InvoiceLineID			SMALLINT  NOT NULL IDENTITY(1,1),
  InvoiceID				INT  NOT NULL,
  Description			VARCHAR(100) NOT NULL,
  Price					DECIMAL(7,2)  NOT NULL,
  Quantity				SMALLINT  NOT NULL,
  CONSTRAINT PK_InvoiceLine_InvoiceLineID_InvoiceID PRIMARY KEY ( InvoiceLineID, InvoiceID ),
  CONSTRAINT FK_InvoiceLine_InvoiceID FOREIGN KEY ( InvoiceID ) REFERENCES Invoice ( InvoiceID )
);

--CREATE the Vendors table
DROP TABLE IF EXISTS Vendors;
CREATE TABLE Vendors
(	VendorID			SMALLINT NOT NULL IDENTITY(1,1),
	VendorName			VARCHAR(25),
	VendorDescription	VARCHAR(100),
	StreetAddress		VARCHAR(25),
	City				VARCHAR (25),
	State				CHAR(2), 
	Zipcode				VARCHAR (10),
	PhoneNumber			VARCHAR(15),
CONSTRAINT PK_Vendors_VendorID PRIMARY KEY ( VendorID )
);

Drop TABLE IF EXISTS PurchaseOrder;
CREATE TABLE PurchaseOrder
( PurchaseOrderID			SMALLINT NOT NULL IDENTITY (1,1),
  VendorID					SMALLINT NOT NULL,
  EmployeeID				SMALLINT NOT NULL,
  OrderDate					DATETIME,
  CONSTRAINT PK_PurchaseOrder_PurchaseOrderID_VendorID Primary Key ( PurchaseOrderID, VendorID ), 
  CONSTRAINT FK_PurchaseOrder_VendorID Foreign Key ( VendorID ) References Vendors ( VendorID ),
  CONSTRAINT FK_PurchaseOrder_EmployeeID Foreign Key ( EmployeeID) References Employee ( EmployeeID), 
); 


--CREATE the Materials table
DROP TABLE IF EXISTS Materials;
CREATE TABLE Materials
(	MaterialID					SMALLINT NOT NULL IDENTITY(1,1),
	PurchaseOrderID				SMALLINT NOT NULL,
	VendorID					SMALLINT NOT NULL,
	Price						DECIMAL(8,2),
	Description					VARCHAR(100)
CONSTRAINT PK_Materials_MaterialID_VendorID_PurchaseOrderID PRIMARY KEY ( MaterialID, VendorID, PurchaseOrderID ),
CONSTRAINT FK_Materials_VendorID FOREIGN KEY (VendorID) REFERENCES Vendors ( VendorID ),
CONSTRAINT FK_Materials_PurchaseOrderID_VendorID FOREIGN KEY (PurchaseOrderID, VendorID) REFERENCES PurchaseOrder (PurchaseOrderID, VendorID)
);

--CREATE the VendorServices table
DROP TABLE IF EXISTS VendorServices;
CREATE TABLE VendorServices
(	PurchaseOrderID				SMALLINT NOT NULL IDENTITY(1,1),
	VendorID					SMALLINT NOT NULL,
	VendorServiceDescription	VARCHAR(100),
CONSTRAINT PK_VendorServices_VendorServiceID_VendorID PRIMARY KEY ( PurchaseOrderID, VendorID ),
CONSTRAINT FK_VendorServices_VendorID FOREIGN KEY ( VendorID ) REFERENCES Vendors ( VendorID )
);

DROP TABLE IF EXISTS PurchaseOrderLine;
CREATE TABLE PurchaseOrderLine
( PurchaseOrderLineID		SMALLINT NOT NULL IDENTITY (1,1),
  PurchaseOrderID			SMALLINT NOT NULL,
  VendorID					SMALLINT NOT NULL,
  Description				VARCHAR(100),
  Price						Decimal(8,2),
  Quantity 					SMALLINT NOT NULL,
  CONSTRAINT PK_PurchaseOrderLine_PurchaseOrderLineID Primary Key ( PurchaseOrderLineID ),
  CONSTRAINT FK_PurchaseOrderLine_PurchaseOrderID_VendorID Foreign Key ( PurchaseOrderID, VendorID ) References PurchaseOrder ( PurchaseOrderID, VendorID ),
  );

  Drop Table if exists Machine;
Create Table Machine
( MachineID			SMALLINT NOT NULL IDENTITY (1,1),
  Name				VARCHAR(30),
  DESCRIPTION		VARCHAR(100),
  CONSTRAINT PK_MACHINE_MachineID PRIMARY KEY (MachineID)
  );

  Drop table if exists Job;
Create Table Job
( JobID			SMALLINT NOT NULL IDENTITY(1,1),
  JobInputID	SMALLINT NOT NULL,
  MachineID		SMALLINT NOT NULL,
  OrderID		INT  NOT NULL,
  OrderLineID	SMALLINT NOT NULL,
  Description	VARCHAR(100),
  CONSTRAINT PK_JOB_JOBID PRIMARY KEY (JobID),
  CONSTRAINT FK_JOB_MachineID FOREIGN KEY ( MachineID ) REFERENCES Machine ( MachineID ),
  CONSTRAINT FK_JOB_OrderLineID_OrderID FOREIGN KEY ( OrderLineID, OrderID ) REFERENCES OrderLine ( OrderLineID, OrderID )
); 

 
 Drop TABLE if exists JobInput;
CREATE TABLE JobInput
( JobInputID		SMALLINT NOT NULL IDENTITY (1,1),
  JobID				SMALLINT NOT NULL,
  VendorID			SMALLINT NOT NULL,
  PurchaseOrderLineID	SMALLINT NOT NULL,	
  DESCRIPTION		VARCHAR(100),
  CONSTRAINT PK_JobInput_JobInputID PRIMARY KEY ( JobInputID ),
  CONSTRAINT FK_JobInput_JobID Foreign key (JobID) References Job ( JobID ),
  CONSTRAINT FK_JobInput_PurchaseOrderLineID FOREIGN KEY (PurchaseOrderLineID) REFERENCES PurchaseOrderLine ( PurchaseOrderLineID),
  );





