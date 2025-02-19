/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[CostYTD]
      ,[CostLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2016].[Sales].[SalesTerritory]

  select * from Sales.SalesOrderDetail

  select SalesOrderID , sum(LineTotal) as Total from Sales.SalesOrderDetail group by SalesOrderId order by sum(LineTotal) desc

  select * from Sales.SalesOrderDetail where DAY(ModifiedDate)=25 and MONTH(ModifiedDate)=12

SELECT DueDate, ShipDateFROM Sales.SalesOrderHeaderWHERE Sales.SalesOrderHeader.OrderDate =  (SELECT MAX(OrderDate)FROM Sales.SalesOrderHeader)select * from[Person].[Person]select * from [HumanResources].[Employee] where JobTitle='Research and Development Manager'SELECT FirstName, LastName FROM Person.PersonWHERE Person.Person.BusinessEntityID IN (SELECT BusinessEntityIDFROM HumanResources.Employee WHERE JobTitle ='Research and Development Manager');SELECT FirstName, LastName FROM Person.Person AS AWHERE EXISTS (SELECT *FROM HumanResources.Employee As B WHERE JobTitle ='Research and Development Manager' AND A.BusinessEntityID=B.BusinessEntityID);select * from Person.Personselect * from Sales.SalesPersonselect * from Sales.SalesTerritorySELECT LastName, FirstNameFROM Person.PersonWHERE BusinessEntityID IN  (SELECT BusinessEntityID  FROM Sales.SalesPerson  WHERE TerritoryID IN  (SELECT TerritoryIDFROM Sales.SalesTerritory  WHERE Name='Canada'))SELECT e.BusinessEntityIDFROM Person.BusinessEntityContact e  WHERE e.ContactTypeID IN(SELECT c.ContactTypeIDFROM Person.ContactType cWHERE YEAR(e.ModifiedDate) >=2012)SELECT *FROM Person.ContactType WHERE YEAR(ModifiedDate) >=2012SELECT *FROM Person.BusinessEntityContact where YEAR(ModifiedDate) >=2012WITH CTE_OrderYearAS   (SELECT YEAR(OrderDate) AS OrderYear, CustomerID  FROM Sales.SalesOrderHeader)SELECT OrderYear, COUNT(DISTINCT CustomerID) AS CustomerCount  FROM CTE_OrderYearGROUP BY OrderYear;SELECT Product.ProductId FROM Production.ProductUNIONSELECT ProductId FROM Sales.SalesOrderDetailSELECT Product.ProductId FROM Production.ProductUNION ALLSELECT ProductId FROM Sales.SalesOrderDetail  SELECT Product.ProductId FROM Production.ProductINTERSECTSELECT ProductId FROM Sales.SalesOrderDetailSELECT Product.ProductId FROM Production.ProductEXCEPTSELECT ProductId FROM Sales.SalesOrderDetailSELECT TOP 5 SUM(SalesYTD) AS TotalSalesYTD, NameFROM Sales.SalesTerritory  GROUP BY Name-- Pivot table with one row and six columns  SELECT TOP 5 'TotalSalesYTD'AS GrandTotal,[Northwest], [Northeast], [Central], [Southwest],[Southeast]  FROM(SELECT TOP 5 Name, SalesYTDFROM Sales.SalesTerritory) AS SourceTable  PIVOT(SUM(SalesYTD)FOR Name IN ([Northwest], [Northeast], [Central], [Southwest],  [Southeast])) AS PivotTable;CREATE VIEW vwPersonDetails  ASSELECTCOALESCE(p.Title, ' ') AS Title,p.[FirstName],COALESCE(p.MiddleName, ' ') AS MiddleName,p.[LastName],e.[JobTitle]FROM [HumanResources].[Employee] e  INNER JOIN [Person].[Person] pON p.[BusinessEntityID] = e.[BusinessEntityID]select * from vwPersonDetailsCREATE VIEW vwProductInfo ASSELECT ProductID, ProductNumber,Name,SafetyStockLevel,  ReOrderPointFROM Production.Product  WHERE SafetyStockLevel <=1000  WITH CHECK OPTION;select * from vwProductInfoexec sp_tables