-- CUBE

-- average spending by yearly income

select	sum(unitsSold*storePrice) as total
		, yearlyIncomeDescription
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	yearlyIncomeDescription
order by	averageSpending desc;
go

-- average spending by yearly income (1997)

select	sum(unitsSold*storePrice) as total
		, yearlyIncomeDescription
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	[year] = 1997
group by	yearlyIncomeDescription, [year]
order by	averageSpending desc;
go

-- average spending by yearly income (1998)

select	sum(unitsSold*storePrice) as total
		, yearlyIncomeDescription
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	[year] = 1998
group by	yearlyIncomeDescription, [year]
order by	averageSpending desc;
go

-- average spending by education level

select	sum(unitsSold * storePrice) as total
		, educationLevelName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	educationLevelName
order by	averageSpending desc;
go

-- average spending by education level (1997)

select	sum(unitsSold * storePrice) as total
		, educationLevelName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	educationLevelName
order by	averageSpending desc;
go

-- average spending by education level (1998)

select	sum(unitsSold * storePrice) as total
		, educationLevelName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	educationLevelName
order by	averageSpending desc;
go

-- average spending by membership level
select	sum(unitsSold * storePrice) as total
		, membershipLevelName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	membershipLevelName
order by	total;
go

-- average spending by membership level (1997)

select	sum(unitsSold * storePrice) as total
		, membershipLevelName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	membershipLevelName
order by	total;
go

-- average spending by membership level (1998)
select	sum(unitsSold * storePrice) as total
		, membershipLevelName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	membershipLevelName
order by	total;
go

-- average spending by occupation (1997)

select	sum(unitsSold * storePrice) as total
		, occupationName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	occupationName
order by	averageSpending desc;
go

-- average spending by occupation (1998)

select	sum(unitsSold * storePrice) as total
		, occupationName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	occupationName
order by	averageSpending desc;
go

-- average spending by occupation (1997)

select	sum(unitsSold * storePrice) as total
		, occupationName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	occupationName
order by	averageSpending desc;
go

-- average spending by occupation (1998)

select	sum(unitsSold * storePrice) as total
		, occupationName
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	occupationName
order by	averageSpending desc;
go

-- average spending by gender

select	sum(unitsSold * storePrice) as total
		, gender
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	gender
order by	averageSpending desc;
go

-- average spending by gender (1997)

select	sum(unitsSold * storePrice) as total
		, gender
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	gender
order by	averageSpending desc;
go

-- average spending by gender (1998)

select	sum(unitsSold * storePrice) as total
		, gender
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	gender
order by	averageSpending desc;
go

-- average spending by maritial status

select	sum(unitsSold * storePrice) as total
		, maritialStatus
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	maritialStatus
order by	averageSpending desc;
go

-- average spending by maritial status (1997)

select	sum(unitsSold * storePrice) as total
		, maritialStatus
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	maritialStatus
order by	averageSpending desc;
go

-- average spending by maritial status (1998)

select	sum(unitsSold * storePrice) as total
		, maritialStatus
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	maritialStatus
order by	averageSpending desc;
go

-- average spending by car count

select	sum(unitsSold * storePrice) as total
		, carCount
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	carCount
order by	averageSpending desc;
go

-- average spending by car count (1997)

select	sum(unitsSold * storePrice) as total
		, carCount
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	carCount
order by	averageSpending desc;
go

-- average spending by car count (1998)

select	sum(unitsSold * storePrice) as total
		, carCount
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	carCount
order by	averageSpending desc;
go

-- average spending by child count

select	sum(unitsSold * storePrice) as total
		, childCount
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	childCount
order by	averageSpending desc;
go
-- at home
select	sum(unitsSold * storePrice) as total
		, childrenAtResidence
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	childrenAtResidence
order by	averageSpending desc;
go

-- average spending by child count (1997)

select	sum(unitsSold * storePrice) as total
		, childCount
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	childCount
order by	averageSpending desc;
go
-- at home
select	sum(unitsSold * storePrice) as total
		, childrenAtResidence
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	childrenAtResidence
order by	averageSpending desc;
go

-- average spending by child count (1998)

select	sum(unitsSold * storePrice) as total
		, childCount
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	childCount
order by	averageSpending desc;
go
-- at home
select	sum(unitsSold * storePrice) as total
		, childrenAtResidence
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	childrenAtResidence
order by	averageSpending desc;
go

-- average spending by home owner

select	sum(unitsSold * storePrice) as total
		, isHomeOwner
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
group by	isHomeOwner
order by	averageSpending desc;
go

-- average spending by home owner (1997)

select	sum(unitsSold * storePrice) as total
		, isHomeOwner
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1997
group by	isHomeOwner
order by	averageSpending desc;
go

-- average spending by home owner (1998)

select	sum(unitsSold * storePrice) as total
		, isHomeOwner
		, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	isHomeOwner
order by	averageSpending desc;
go