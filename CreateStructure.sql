CREATE TABLE dbo.SKU
(
    ID int PRIMARY KEY identity(1,1),
    Code AS 's' + CAST(ID AS VARCHAR)  UNIQUE , 
    Name varchar(200) not null
	
);
CREATE TABLE dbo.Basket
(
	ID int PRIMARY KEY identity(1,1),
	ID_SKU int REFERENCES dbo.SKU(ID),
	Quantity int CHECK(Quantity >= 0),
	Value int CHECK(Value >= 0),
	PurchaseDate datetime DEFAULT(SYSDATETIME()),
	DiscountValue int
);
CREATE TABLE dbo.Family
(
	ID int PRIMARY KEY identity(1,1),
	SurName varchar(200) not null,
	BudgetValue int
);

