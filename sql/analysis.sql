-- average spenditure by yearly income
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

-- average spenditure by education level
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

-- average spenditure by membership level
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

-- average spenditure by occupation
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

-- average spenditure by gender
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

-- average spenditure by maritial status
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

-- average spenditure by car count
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

-- average spenditure by child count
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
-- at home
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

-- average spenditure by home owner
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