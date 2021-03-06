SELECT TOP 1000 [incomeId]
      ,[incomeDescription]
  FROM [iict6011a02].[oltp].[yearlyIncome];
go

SELECT TOP 1000 [typeId]
	,[typeName]
FROM [iict6011a02].[oltp].[storeType];
go

SELECT TOP 1000 [storeId]
    ,[storeName]
    ,[storeTypeId]
    ,[postCode]
    ,[cityId]
FROM [iict6011a02].[oltp].[store]

SELECT TOP 1000 [regionId]
    ,[regionName]
    ,[countryId]
FROM [iict6011a02].[oltp].[region];
go

SELECT TOP 1000 [subcategoryId]
    ,[subcategoryName]
    ,[categoryId]
FROM [iict6011a02].[oltp].[productSubcategory];
go

SELECT TOP 1000 [familyId]
    ,[familyName]
FROM [iict6011a02].[oltp].[productFamily];
go

SELECT TOP 1000 [departmentId]
    ,[departmentName]
    ,[familyId]
FROM [iict6011a02].[oltp].[productDepartment];
go

SELECT TOP 1000 [categoryId]
    ,[categoryName]
    ,[departmentId]
FROM [iict6011a02].[oltp].[productCategory];
go

SELECT [productId]
    ,[productName]
    ,[brandId]
    ,[subcategoryId]
    ,[sku]
    ,[srp]
FROM [iict6011a02].[oltp].[product];
go

SELECT [orderId]
    ,[productId]
    ,[unitsSold]
    ,[storeCost]
    ,[storePrice]
FROM [iict6011a02].[oltp].[orderItem];
go

SELECT [orderId]
    ,[orderDate]
    ,[storeId]
    ,[clientId]
FROM [iict6011a02].[oltp].[order];
go

SELECT TOP 1000 [occupationId]
    ,[occupationName]
FROM [iict6011a02].[oltp].[occupation];
go

SELECT TOP 1000 [membershipLevelId]
    ,[membershipLevelName]
FROM [iict6011a02].[oltp].[membershipLevel];
go

SELECT TOP 1000 [levelId]
      ,[levelName]
  FROM [iict6011a02].[oltp].[educationLevel];
  go

SELECT TOP 1000 [countryId]
    ,[countryName]
FROM [iict6011a02].[oltp].[country];
go

SELECT [clientId]
    ,[firstName]
    ,[lastName]
    ,[gender]
    ,[dateOfBirth]
    ,[maritialStatus]
    ,[postCode]
    ,[cityId]
    ,[occupationId]
    ,[levelId]
    ,[incomeId]
    ,[carCount]
    ,[childCount]
    ,[childAtHomeCount]
    ,[isHomeOwner]
    ,[accountDate]
    ,[membershipLevelId]
FROM [iict6011a02].[oltp].[client];
go

SELECT TOP 1000 [cityId]
    ,[cityName]
    ,[regionId]
FROM [iict6011a02].[oltp].[city];
go

SELECT TOP 1000 [brandId]
    ,[brandName]
FROM [iict6011a02].[oltp].[brand];
go
