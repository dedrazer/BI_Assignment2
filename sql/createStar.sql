-- clean

use iict6011a02;
go

truncate table star.saleFact;
drop table star.saleFact;
go

truncate table star.client;
drop table star.client;
go

truncate table star.orderItem;
drop table star.orderItem;
go

truncate table star.[time];
drop table star.[time];
go

drop schema star;
go

use master;
go


-- create

use iict6011a02;
go

create schema star;
go

create table star.orderItem(
	orderKey uniqueidentifier primary key default newsequentialid()
	, orderOLTPId uniqueidentifier not null 
	, unitsSold tinyint not null
	, storeCost float not null
	, storePrice float not null
	, productName nvarchar(256) not null
	, unique (orderOLTPId, productName)
);
go

create table star.[time](
	timeKey uniqueidentifier primary key default newsequentialid()
	, orderDate date not null
	, [year] numeric(4,0)
	, [month] numeric(2,0)
	, [day] numeric(2,0)
);
go

create table star.client(
	clientKey uniqueidentifier primary key default newsequentialid()
	, clientOLTPId uniqueidentifier not null unique
	, firstName nvarchar(256) not null
	, lastName nvarchar(256) not null
	, dateOfBirth date not null
	, gender char not null
	, maritialStatus char not null
	, postCode integer not null
	, carCount tinyint not null
	, childCount tinyint not null
	, childrenAtResidence tinyint not null
	, isHomeOwner bit not null
	, memberShipDate date not null
	, occupationName nvarchar(256) not null
	, membershipLevelName nvarchar(256) not null
	, educationLevelName nvarchar(256) not null
	, yearlyIncomeDescription nvarchar(256) not null
);
go

create table star.saleFact(
	saleKey uniqueidentifier not null primary key default newsequentialid()
	, orderOLTPId uniqueidentifier not null
	, clientKey uniqueidentifier not null foreign key references star.client(clientKey)
	, orderKey uniqueidentifier not null foreign key references star.orderItem(orderKey)
	, timeKey uniqueidentifier not null foreign key references star.[time](timeKey)
	, unique (orderOLTPId, orderKey)
);
go

-- remove redundancy

WITH CTE AS
(
SELECT orderId, prd.productId, unitsSold, storeCost, storePrice, ROW_NUMBER() OVER (PARTITION BY orderId, prd.productId ORDER BY orderId, prd.productId) AS RN
FROM	oltp.orderItem oit
		join oltp.product prd
		on (oit.productId = prd.productId)
)
DELETE 
FROM oltp.orderItem
WHERE orderId IN
(SELECT orderId
FROM CTE
WHERE RN <> 1)
AND productId IN
(SELECT productId
FROM CTE
WHERE RN <> 1)
AND unitsSold IN
(SELECT unitsSold
FROM CTE
WHERE RN <> 1) 
AND storeCost IN
(SELECT storeCost
FROM CTE
WHERE RN <> 1) 
AND storePrice IN
(SELECT storePrice
FROM CTE
WHERE RN <> 1);
go

-- populate

begin
	set nocount on;

	insert into star.orderItem(orderOLTPId, productName, unitsSold, storeCost, storePrice)
		(select distinct orderId, productName, unitsSold, storeCost, storePrice
		from	oltp.orderItem oit
				left join oltp.product prd
				on (oit.productId = prd.productId));

	insert into star.client(clientOLTPId, carCount, childCount, childrenAtResidence
		, occupationName, membershipLevelName, educationLevelName, yearlyIncomeDescription
		, gender, maritialStatus, isHomeOwner, dateOfBirth
		, firstName, lastName, postCode, memberShipDate)
		(select distinct clientId, carCount, childCount, childAtHomeCount
		, occupationName, membershipLevelName, levelName, incomeDescription
		, gender, maritialStatus, isHomeOwner, dateOfBirth
		, firstName, lastName, postCode, accountDate
		from	oltp.client cli
				join oltp.occupation occ
				on (cli.occupationId = occ.occupationId)
				join oltp.membershipLevel mem
				on (cli.membershipLevelId = mem.membershipLevelId)
				join oltp.educationLevel edu
				on (cli.levelId = edu.levelId)
				join oltp.yearlyIncome yli
				on (cli.incomeId = yli.incomeId));

	insert into star.[time](orderDate, [year], [month], [day])
				(select distinct	orderDate, datepart(year, orderDate), datepart(month, orderDate), datepart(day, orderDate)
				from	oltp.[order]);
end;
go
