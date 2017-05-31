use iict6011a02;
go

/*1.get all orders whilst including the:
	store;
	store type;
	location;
	client age, gender, marital status, city, nationality, car count, child count, children at residence, is home owner;
	yearly income;
	education level;
	membership level;
	occupation;
*/
select	typeName
		, storeName
		, cityName
		, regionName
		, countryName
		, orderDate
		, firstName
		, lastName
		, gender
		, maritialStatus
		, carCount
		, childCount
		, childAtHomeCount
		, isHomeOwner
		, membershipLevelName
		, incomeDescription
		, levelName
		, membershipLevelName
		, occupationName
from	oltp.storeType typ
		right join oltp.store sto
		on (sto.storeTypeId = typ.typeId)
		left join oltp.city cty
		on (sto.cityId = cty.cityId)
		join oltp.region reg
		on (cty.regionId = reg.regionId)
		join oltp.country ctr
		on (reg.countryId = ctr.countryId)
		left join oltp.[order] ord
		on (ord.storeId = sto.storeId)
		left join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.yearlyIncome yli
		on (cli.incomeId = yli.incomeId)
		join oltp.educationLevel edl
		on (cli.levelId = edl.levelId)
		join oltp.membershipLevel mem
		on (cli.membershipLevelId = mem.membershipLevelId)
		join oltp.occupation occ
		on (cli.occupationId = occ.occupationId);
go

/*2.rollup the spent amount by:
	a) occupation
	b) membership level
	c) education level
	d) yearly income
*/

-- orders, identification, yearly income, membership level, occupation
select	unitsSold, storePrice
		, firstName
		, lastName
		, gender
		, incomeDescription
		, membershipLevelName
		, occupationName
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.yearlyIncome yli
		on (cli.incomeId = yli.incomeId)
		join oltp.educationLevel edl
		on (cli.levelId = edl.levelId)
		join oltp.membershipLevel mem
		on (cli.membershipLevelId = mem.membershipLevelId)
		join oltp.occupation occ
		on (cli.occupationId = occ.occupationId);
go

-- yearly income totals
select	sum(unitsSold*storePrice) as total
		, incomeDescription
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.yearlyIncome yli
		on (cli.incomeId = yli.incomeId)
group by incomeDescription
order by total asc;
go

-- education level totals
select	sum(unitsSold * storePrice) as total
		, levelName
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.educationLevel edl
		on (cli.levelId = edl.levelId)
group by	levelName
order by	total asc;
go

-- membership level totals
select	sum(unitsSold * storePrice) as total
		, membershipLevelName
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.membershipLevel mem
		on (cli.membershipLevelId = mem.membershipLevelId)
group by	membershipLevelName
order by	total;
go

-- occupation totals
select	sum(unitsSold * storePrice) as total
		, occupationName
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.occupation occ
		on (cli.occupationId = occ.occupationId)
group by occupationName
order by total;
go

-- with averages
-- yearly income
select	sum(unitsSold*storePrice) as total
		, incomeDescription
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.yearlyIncome yli
		on (cli.incomeId = yli.incomeId)
group by	incomeDescription
order by	averageSpenditure desc;
go

-- education level
select	sum(unitsSold * storePrice) as total
		, levelName
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.educationLevel edl
		on (cli.levelId = edl.levelId)
group by	levelName
order by	averageSpenditure desc;
go

-- membership level
select	sum(unitsSold * storePrice) as total
		, membershipLevelName
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.membershipLevel mem
		on (cli.membershipLevelId = mem.membershipLevelId)
group by	membershipLevelName
order by	total;
go

-- occupation
select	sum(unitsSold * storePrice) as total
		, occupationName
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
		join oltp.occupation occ
		on (cli.occupationId = occ.occupationId)
group by	occupationName
order by	averageSpenditure desc;
go

-- get spenditure by gender, maritial status, carCount, childCount, childAtHomeCount, isHomeOwner
-- gender
select	sum(unitsSold * storePrice) as total
		, gender
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
group by	gender
order by	averageSpenditure desc;
go

-- maritial status
select	sum(unitsSold * storePrice) as total
		, maritialStatus
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
group by	maritialStatus
order by	averageSpenditure desc;
go

-- car count
select	sum(unitsSold * storePrice) as total
		, carCount
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
group by	carCount
order by	averageSpenditure desc;
go

-- child count
select	sum(unitsSold * storePrice) as total
		, childCount
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
group by	childCount
order by	averageSpenditure desc;
go
select	sum(unitsSold * storePrice) as total
		, childAtHomeCount
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
group by	childAtHomeCount
order by	averageSpenditure desc;
go

-- home owner
select	sum(unitsSold * storePrice) as total
		, isHomeOwner
		, count(distinct cli.clientId) as clients
		, (sum(unitsSold*storePrice)/count(distinct cli.clientId)) as averageSpenditure
from	oltp.orderItem ori
		join oltp.[order] ord
		on (ori.orderId = ord.orderId)
		join oltp.client cli
		on (ord.clientId = cli.clientId)
group by	isHomeOwner
order by	averageSpenditure desc;
go