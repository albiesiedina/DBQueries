USE master
GO

CREATE DATABASE MaintenanceCompany
GO

USE MaintenanceCompany

CREATE TABLE Customer (
	CustomerID 				int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    CustomerName			nvarchar(120) NOT NULL,
    Address					nvarchar(MAX) NULL,
    Email					nvarchar(255) NULL,
    Phone					nvarchar(10) NULL,
	CreatedBy 				nvarchar(50) default user_name() NOT NULL,
	CreatedDateTime			datetime default getdate() NOT NULL,
	UpdatedBy				nvarchar(50) default user_name() NOT NULL,
	UpdatedDateTime			datetime default getdate() NOT NULL
);

CREATE TABLE Builder (
	BuilderID 				int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    BuilderName				nvarchar(120) NOT NULL,
	BillingPerson			nvarchar(120) NOT NULL,
	BillingAddress			nvarchar(max) NOT NULL,
	BillingPhone			nvarchar(10) NOT NULL,
	BillingEmail			nvarchar(max) NOT NULL,
	SalesPerson				nvarchar(120) NULL,
	SalesAddress			nvarchar(max) NULL,
	SalesPhone 				nvarchar(10) NULL,
	SalesEmail				nvarchar(max) NULL,
	SiteManager				nvarchar(120) NULL,
	SiteManagerAddress		nvarchar(max) NULL,
	SiteManagerPhone		nvarchar(10) NULL,
	SiteManagerEmail		nvarchar(max) NULL,
    CreatedBy 				nvarchar(50) default user_name() NOT NULL,
	CreatedDateTime			datetime default getdate() NOT NULL,
	UpdatedBy				nvarchar(50) default user_name() NOT NULL,
	UpdatedDateTime			datetime default getdate() NOT NULL
);

CREATE TABLE House (
	HouseID					int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    CustomerID				int NULL,
    BuilderID				int	NULL,
    Description				nvarchar(255) NOT NULL,
    Address 				nvarchar(MAX) NULL,
    LotArea					nvarchar(20) NULL,
    HouseArea 				int NULL,
	CreatedBy 				nvarchar(50) default user_name() NOT NULL,
	CreatedDateTime			datetime default getdate() NOT NULL,
	UpdatedBy				nvarchar(50) default user_name() NOT NULL,
	UpdatedDateTime			datetime default getdate() NOT NULL,
    FOREIGN KEY (BuilderID) References Builder(BuilderID) ON DELETE SET NULL,
	FOREIGN KEY (CustomerID) References Customer(CustomerID) ON DELETE SET NULL
);

CREATE TABLE [Option] (
	OptionID				int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    OptionName 				nvarchar(40) NOT NULL,
    Description 			nvarchar(255) NULL,
    Price 					money NOT NULL,
	Cost 					money NULL,
    Margin 					decimal(18, 2) NULL,
	CreatedBy 				nvarchar(50) default user_name() NOT NULL,
	CreatedDateTime			datetime default getdate() NOT NULL,
	UpdatedBy				nvarchar(50) default user_name() NOT NULL,
	UpdatedDateTime			datetime default getdate() NOT NULL,
);

CREATE TABLE OptionDetail (
	OptionDetailID 			int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	OptionID				int NOT NULL,
    Item 					nvarchar(20) NULL,
    Description 			nvarchar(255) NOT NULL,
    Quantity 				int NULL,
	Colour					nvarchar(20) NULL,
    Size 					nvarchar(20) NULL,
    InstallLocation 		nvarchar(50) NULL,
	CreatedBy 				nvarchar(50) default user_name() NOT NULL,
	CreatedDateTime			datetime default getdate() NOT NULL,
	UpdatedBy				nvarchar(50) default user_name() NOT NULL,
	UpdatedDateTime			datetime default getdate() NOT NULL,
	FOREIGN KEY (OptionID) References [Option](OptionID) ON DELETE CASCADE
);

CREATE TABLE HouseOption (
	HouseID					int NOT NULL,
	OptionID				int NOT NULL,
	CreatedBy 				nvarchar(50) default user_name() NOT NULL,
	CreatedDateTime			datetime default getdate() NOT NULL,
	UpdatedBy				nvarchar(50) default user_name() NOT NULL,
	UpdatedDateTime			datetime default getdate() NOT NULL,
	PRIMARY KEY (HouseID, OptionID),
	FOREIGN KEY (HouseID) References House(HouseID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (OptionID) References [Option](OptionID) ON DELETE CASCADE ON UPDATE CASCADE
);

