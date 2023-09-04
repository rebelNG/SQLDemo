USE bob_shoes;

CREATE TABLE Orders.OrderTracking (
	OrderId int auto_increment NOT NULL,
    OrderDate datetime(0) NOT NULL,
    RequestedDate datetime(0) not null,
    DeliveryDate datetime(0) null,
    CustName varchar(200) not null,
    CustAddress varchar(200) not null,
    ShoeStyle varchar(200) not null,
    ShoeSize varchar(10) not null,
    SKU char(8) not null,
    UnitPrice numeric(7,2) not null,
    Quantity smallint not null,
    Discount numeric(4,2) not null,
    IsExpedited bit not null,
    TotalPrice DECIMAL(10,2) GENERATED ALWAYS AS (Quantity * UnitPrice * (1.0 - Discount)) STORED,
    primary key (OrderId)
)
ENGINE = InnoDB
row_format = dynamic;

truncate table Orders.OrderTracking;
insert into Orders.OrderTracking(
	OrderDate, RequestedDate, CustName, CustAddress, ShoeStyle, ShoeSize, SKU, UnitPrice, Quantity, Discount, IsExpedited
)
values
	('20230301', '20230401', 'Arthur Dent', 'Golgafrincham', 'Oxford',
    '10_D', 'OXFORD01', 50.0, 1, 0, 0),
    ('20230301', '20230401', 'Arthur Dent', 'Golgafrincham', 'BabySneakers',
    '3', 'BABYSH01', 20.0, 1, 0, 0),
    ('20230301', '20230401', 'Arthur Dent', 'Golgafrincham', 'Killer Heels',
    '7', 'HEELS001', 75.0, 1, 0, 0),
    ('20231001', '20230401', 'Arthur Dent', 'Golgafrincham', 'Boots',
    '10_D', 'BOOTS001', 50.1, 1, 0, 0),
    ('20231001', '20230401', 'Arthur Dent', 'Golgafrincham', 'Slippers',
    '3', 'SLIPPERS', 20.0, 1, 0, 0);


drop table if exists Orders.OrderItems, Orders.Orders, Orders.Stock, Orders.Customers, Orders.Salutations, Orders.Address;

create table Orders.Address(
	AddressID int auto_increment not null,
		constraint PK_Address_AddressID primary key (AddressID),
	CustStreet VARCHAR(100) NOT NULL,
    CustCity VARCHAR(100) NOT NULL,
    CustStateProv VARCHAR(100) NOT NULL,
    CustCountry VARCHAR(100) NOT NULL,
    CustPostalCode VARCHAR(20) NOT NULL
);

create table Orders.Salutations(
	SalutationID int auto_increment not null,
		constraint PK_Salutations_SalutationID primary key (SalutationID),
	Salutation varchar(5) not null
);

CREATE TABLE Orders.Customers (
    CustID INT AUTO_INCREMENT NOT NULL,
		CONSTRAINT PK_Customers_CustID PRIMARY KEY (CustID),
    CustName VARCHAR(200) NOT NULL,
    SalutationID int NOT NULL,
		constraint FK_Customers_SalutationID_Salutations_SalutationID
			foreign key (SalutationID)
            references Orders.Salutations (SalutationID),
	AddressID int not null,
		constraint FK_Customers_AddressID_Address_AddressID
			foreign key (AddressID)
            references Orders.Address (AddressID)
);

create table Orders.Stock(
	StockID int auto_increment not null,
    constraint PK_Stock_StockID primary key (StockID),
	StockSKU char(8) not null,
    StockSize varchar(10) not null,
    StockName varchar(100) not null,
    StockPrice numeric(7,2) not null
    -- constraint PK_Stock_StockSKU_StockSize primary key (StockSKU, StockSize)
);

CREATE TABLE Orders.Orders (
    OrderID INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_Orders_OrderID PRIMARY KEY (OrderID),
    OrderDate DATE NOT NULL,
    OrderRequestedDate DATE NOT NULL,
    OrderDeliveryDate DATETIME(0) NULL,
    CustID INT NOT NULL,
    CONSTRAINT FK_Orders_CustID_Customers_CustID
        FOREIGN KEY (CustID)
        REFERENCES Orders.Customers (CustID),
    OrderIsExpedited BIT NOT NULL
);

CREATE TABLE Orders.OrderItems (
    OrderItemID INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_OrderItems_OrderItemID PRIMARY KEY (OrderItemID),
    OrderID INT NOT NULL,
    CONSTRAINT FK_OrderItems_OrderID_Orders_OrderID
        FOREIGN KEY (OrderID)
        REFERENCES Orders.Orders (OrderID),
    StockID INT NOT NULL,
    CONSTRAINT FK_OrderItems_StockID_Stock_StockID
        FOREIGN KEY (StockID)
        REFERENCES Orders.Stock (StockID),
    Quantity SMALLINT NOT NULL,
    Discount NUMERIC(4, 2) NOT NULL
);

insert into Orders.Address ( CustStreet, CustCity, CustStateProv, CustCountry, CustPostalCode)
values	('1 Main St', 'Golgafrincham', 'GuideShire', 'UK', '1MSGGS'),
		('42 Cricket St.', 'Islington', 'Greater London', 'UK', '42CSIGL');

insert into Orders.Salutations (Salutation)
values ('Mr.'), ('Miss'), ('Mrs.');

insert into Orders.Customers (CustName, SalutationID, AddressID)
values	('Arthur Dent', 1, 1),
		('trillian Astra', 2, 2);
        
insert into Orders.Stock (StockSKU, StockName, StockSize, StockPrice)
values	('OXFORD01', 'Oxford', '10_D', 50.0),
		('BABYSH01', 'Sneakers', '3', 20.0),
        ('HEELS001', 'Killer Heels', '7', 75.0);
        
insert into Orders.Orders( OrderDate, OrderRequestedDate, CustID, OrderIsExpedited)
values	('20230301', '20230401', 1, 0),
		('20230301', '20230401', 2, 0);

insert into Orders.OrderItems( OrderID, StockID, Quantity, Discount)
values	(1, 1, 1, 20.0),
		(2, 3, 1, 20.0)
        
