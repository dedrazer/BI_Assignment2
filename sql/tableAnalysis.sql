-- yearly average spending by yearly income

select sev.yearlyIncomeDescription, averagespending1997, averageSpending1998
from
(
select	--sum(unitsSold*storePrice) as total
		yearlyIncomeDescription
		--, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	[year] = 1997
group by	yearlyIncomeDescription, [year]) sev
full outer join(
select	--sum(unitsSold*storePrice) as total
		yearlyIncomeDescription
		--, count(distinct clientOLTPId) as clients
		, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
from	star.client cli
		join star.saleFact sfc
		on (sfc.clientKey = cli.clientKey)
		join star.orderItem oit
		on (sfc.orderKey = oit.orderKey)
		join star.[time] tim
		on (sfc.timeKey = tim.timeKey)
where	[year] = 1998
group by	yearlyIncomeDescription, [year]) eit
on eit.yearlyIncomeDescription = sev.yearlyIncomeDescription
order by yearlyIncomeDescription;
go


-- yearly average spending by education level

select sev.educationLevelName, averagespending1997, averageSpending1998
from (
	select	sum(unitsSold * storePrice) as total
			, educationLevelName
			, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	educationLevelName) sev
full outer join
	(select	sum(unitsSold * storePrice) as total
			, educationLevelName
			, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1998
	group by	educationLevelName) eit
on sev.educationLevelName = eit.educationLevelName
order by educationLevelName;
go

-- yearly average spending by membership level
select sev.membershipLevelName, averageSpending1997, averageSpending1998
from (
	select	sum(unitsSold * storePrice) as total
			, membershipLevelName
			, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	membershipLevelName) sev
full outer join (
	select	sum(unitsSold * storePrice) as total
			, membershipLevelName
			, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
where	tim.[year] = 1998
group by	membershipLevelName) eit
on sev.membershipLevelName = eit.membershipLevelName
order by membershipLevelName;
go


-- yearly average spending by occupation

select sev.occupationName, averageSpending1997, averageSpending1998
from (
	select	--sum(unitsSold * storePrice) as total,
			occupationName
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	occupationName) sev
full outer join
	(select	sum(unitsSold * storePrice) as total
			, occupationName
			, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1998
	group by	occupationName) eit
on sev.occupationName = eit.occupationName
order by occupationName;
go

-- yearly average spending by gender
select sev.gender, averageSpending1997, averageSpending1998
from (
	select	sum(unitsSold * storePrice) as total
			, gender
			, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	gender) sev
full outer join
	(select	--sum(unitsSold * storePrice) as total,
			gender
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1998
	group by	gender) eit
on sev.gender = eit.gender;
go


-- yearly average spending by maritial status

select sev.maritialStatus, averageSpending1997, averageSpending1998
from
	(select	--sum(unitsSold * storePrice) as total,
			maritialStatus
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	maritialStatus) sev
full outer join
	(select	--sum(unitsSold * storePrice) as total,
			maritialStatus
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1998
	group by	maritialStatus) eit
on sev.maritialStatus = eit.maritialStatus
order by maritialStatus;
go

-- yearly average spending by car count

select sev.carCount, averageSpending1997, averageSpending1998
from (
	select	--sum(unitsSold * storePrice) as total,
			carCount
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	carCount) sev
full outer join
(
	select	--sum(unitsSold * storePrice) as total,
			carCount
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1998
	group by	carCount) eit
on (sev.carCount = eit.carCount)
order by carCount;
go


-- yearly average spending by child at home count

select sev.childCount, averageSpending1997, averageSpending1998
from
	(select	--sum(unitsSold * storePrice) as total,
			childCount
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	childCount) sev
full outer join
	(select	--sum(unitsSold * storePrice) as total,
			childCount
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1998
	group by	childCount) eit
on sev.childCount = eit.childCount
order by childCount;
go

-- yearly average spending by child at home count

select sev.childrenAtResidence, averageSpending1997, averageSpending1998
from (
	select	--sum(unitsSold * storePrice) as total,
			childrenAtResidence
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	childrenAtResidence) sev
full outer join (
	select	sum(unitsSold * storePrice) as total
			, childrenAtResidence
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1998
	group by	childrenAtResidence) eit
on sev.childrenAtResidence = eit.childrenAtResidence
order by childrenAtResidence;
go

-- yearly average spending by home owner

select sev.isHomeOwner, averageSpending1997, averageSpending1998
from (
	select	--sum(unitsSold * storePrice) as total,
			isHomeOwner
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1997
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1997
	group by	isHomeOwner) sev
full outer join (
	select	--sum(unitsSold * storePrice) as total,
			isHomeOwner
			--, count(distinct clientOLTPId) as clients
			, (sum(unitsSold*storePrice)/count(distinct clientOLTPId)) as averageSpending1998
	from	star.client cli
			join star.saleFact sfc
			on (sfc.clientKey = cli.clientKey)
			join star.orderItem oit
			on (sfc.orderKey = oit.orderKey)
			join star.[time] tim
			on (sfc.timeKey = tim.timeKey)
	where	tim.[year] = 1998
	group by	isHomeOwner) eit
on sev.isHomeOwner = eit.isHomeOwner
order by isHomeOwner;
go