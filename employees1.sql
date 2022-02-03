
/****Database name: [Northwind]****/


--SQL BASICS--

/***** This part is created to understand the basic SQL commands of SELECT, INSERT, UPDATE, DELETE, DROP TABLE and ALTER TABLE.

SELECT <identify the column of interest that you want to grab>
FROM <identify the table you want to connect to> *****/

SELECT [EmployeeID]
      ,[LastName]
      ,[FirstName]
  FROM [Northwind].[dbo].[Employees];

/*****WHERE - where statement is used to filter data.*****/

SELECT [EmployeeID]
      ,[LastName]
      ,[FirstName]
  FROM [Northwind].[dbo].[Employees] WHERE [FirstName] = 'Janet';

/*****INSERT - insert statement is used to store data.

INSERT <identify the table we want to insert values into, also specify the column names>
VALUES <provide values> *****/

INSERT [Northwind].[dbo].[Employees] ([LastName], [FirstName])
VALUES ('Thompson', 'Sarah');

/*****UPDATE - updates records in rows.

UPDATE <identify the table you want to update>
SET <add the column you want to set a new value for>
WHERE <select what to filter on> ****/

UPDATE [Northwind].[dbo].[Employees]
SET [LastName] = 'Tomkins'
WHERE [FirstName] = 'Sarah';

/*****DELETE - deletes data  in the table.

DELETE <identify the table you want to delete records from>
WHERE <select what to filter on> ****/

DELETE [Northwind].[dbo].[Employees]
WHERE [FirstName] = 'Sarah';

/*****DROP - deletes the table.
DROP <identify the table you want to delete> ****/

/*****ALTER TABLE - to add a new column to the table.

ALTER TABLE <identify the table you want to add a column to>
ADD <column name and its datatype> ****/




--SIMPLE SQL QUERRYING--

/****View Employees Table****/

SELECT [EmployeeID]
	, [LastName]
	, [FirstName]
	, [Address]
	, [City]
	, [Region]
	, [PostalCode]
	, [Country]
 FROM [Northwind].[dbo].[Employees];



--'AND' and 'OR' operator-- 
--Employees Table--

/****Find the employees that reside in country 'USA' or city 'London'?****/

SELECT [EmployeeID], [LastName], [FirstName], [Address], [City], [Region], [PostalCode], [Country]
FROM [Northwind].[dbo].[Employees]
WHERE Country = 'USA' OR LastName = 'Buchanan';

SELECT [EmployeeID], [LastName], [FirstName], [Address], [City], [Region], [PostalCode], [Country]
FROM [Northwind].[dbo].[Employees]
WHERE Country = 'UK' AND LastName = 'Buchanan';



--NULL and NOT NULL---
--Orders Table--

SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [Northwind].[dbo].[Orders]
  WHERE ShipRegion IS NULL;



--BETWEEN--
--Products Table--
/****To select from range of values****/

  SELECT [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [Northwind].[dbo].[Products]
  WHERE UnitPrice BETWEEN '18.00' AND '22.00';



--IN and NOT IN--
--Products Table--
/****To select multiple values****/
  
SELECT [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [Northwind].[dbo].[Products]
  WHERE SupplierID IN(1,2,5); --Passing a list



--Wildcard Characters--
--Orders Table--
/****When you don't know the exact letters****/
  
SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [Northwind].[dbo].[Orders]
  WHERE CustomerID LIKE '%IN%';



--Alias--
--Customers Table--
/****formatting column headers with column aliase****/

SELECT [CustomerID]
      ,[CompanyName]
      ,[ContactName]
      ,[ContactTitle] AS "Title"
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode] AS "Zip Code"
      ,[Country]
      ,[Phone] AS "Company Phone"
      ,[Fax]
  FROM [Northwind].[dbo].[Customers];



--DATE VALUES FORMATTING--
--Orders Table--
/****format date values in result set****/

SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
	  , FORMAT(OrderDate, 'MM/dd/yyyy') AS "Order Date"
      --,[OrderDate]
      ,[RequiredDate]
	  , FORMAT(ShippedDate, 'MM/dd/yyyy') AS "Shipped Date"
      --,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [Northwind].[dbo].[Orders]




--DATE FUNCTIONS (DATEDIFF, DATEADD) --
--Orders Table--

/****DATEDIFF(Unit of Time, start date, end date) --calculates the difference between 2 dates start and end. Unit of time eg days, months, weeks etc.
DATEADD(Unit of Time, Amount of Time, Date to add to )--unit of time eg days, months, weeks. Amount of time eg is it 2 weeks, 5 or 10.****/
 
--calculate the timespan(no of days) between order date and required date--

SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
	  ,[OrderDate]
      ,[RequiredDate]
	  ,DATEDIFF(dd,[OrderDate],[RequiredDate]) AS diffofdates --dd for days
	  ,DATEADD(ww,4,[OrderDate]) AS futureorderdates --ww for weeks, how many 4, to which date
	  ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [Northwind].[dbo].[Orders]

 --calculate 15 days prior to shipped date.
 --calculate the difference in days between orderdate and shippped date.

SELECT [OrderID]
      ,[CustomerID]
      ,[EmployeeID]
	  ,[OrderDate]
      ,[ShippedDate]
	  ,DATEDIFF(dd,[OrderDate],[ShippedDate]) AS diffofdates --dd for days
	  ,DATEADD(dd,-15,[ShippedDate]) AS priorshippeddates --ww for weeks, how many 4, to which date
	  ,[RequiredDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [Northwind].[dbo].[Orders]




--AGGREGATE FUNCTIONS (AVG, SUM, MIN, MAX, COUNT) --
--Products Table--

/*****when you do aggregted querries, i.e. when you are summerising numerical data you also have to
group by the additional columns that you are asking in your result set*****/

SELECT [ProductID]
    ,[ProductName]
    ,[UnitPrice]
FROM [Northwind].[dbo].[Products]

--COUNT - How many products do I have? gives total rows.
SELECT COUNT([ProductID])
FROM [Northwind].[dbo].[Products];

--AVG- What is the average price of all my products?
SELECT AVG([UnitPrice])
FROM [Northwind].[dbo].[Products];

--SUM - What is the accumulated value of all my unit prices?
SELECT SUM([UnitPrice])
FROM [Northwind].[dbo].[Products];

--MIN - What is the minimum unit price in all mu products?
SELECT MIN([UnitPrice])
FROM [Northwind].[dbo].[Products];

--MAX - What is the maximum unit price in all mu products?*/
SELECT MAX([UnitPrice])
FROM [Northwind].[dbo].[Products];





--STRING FUNCTIONS (CONCAT, SUBSTRING)--
--Employees Table

/****Concat(field, field), SUbstring(field, start, no of charecators)****/

--Put last name and title of employee together to make a formal last name.
--show the first 5 charecters of title field.

SELECT [EmployeeID]
	  ,CONCAT([TitleOfCourtesy],' ', [LastName]) AS formalname
      ,[LastName]
      ,[FirstName]
      ,[Title]
	  ,SUBSTRING([Title],1, 5) AS partialname --takes 1st 5 charecters
      ,[TitleOfCourtesy]
      ,[BirthDate]
      ,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
      ,[Extension]
      ,[Photo]
      ,[Notes]
      ,[ReportsTo]
      ,[PhotoPath]
  FROM [Northwind].[dbo].[Employees]

--join home phone and extention together
 --show phone without the area code for usa.

 SELECT [EmployeeID]
	 ,[LastName]
      ,[FirstName]
      ,[Title]
	  ,[TitleOfCourtesy]
      ,[BirthDate]
      ,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
	   ,CONCAT(HomePhone,'-', Extension) AS withextention
	   ,SUBSTRING(HomePhone,6, 8) AS noareacodeusa --takes 1st 5 charecters
      ,[Extension]
      ,[Photo]
      ,[Notes]
      ,[ReportsTo]
      ,[PhotoPath]
  FROM [Northwind].[dbo].[Employees] WHERE Country = 'USA';

 
 
 
 
 --ORDER BY, GROUP BY--

/****order by using unitprice ****/

SELECT [OrderID]
      ,[ProductID]
      ,[UnitPrice]
      ,[Quantity]
      ,[Discount]
  FROM [Northwind].[dbo].[Order Details] ORDER BY UnitPrice ASC;

/****group by using aggregate functions****/

SELECT [OrderID]
      ,[ProductID]
	  ,[UnitPrice]
      ,SUM([UnitPrice]) AS TotalPrice
      ,[Quantity]
      ,[Discount]
  FROM [Northwind].[dbo].[Order Details] GROUP BY [OrderID]
    
/****** show the unit price of all products by supplier id  ******/
SELECT 
      [SupplierID]
      ,SUM([UnitPrice]) AS TotalPrice
  FROM [Northwind].[dbo].[Products] GROUP BY [SupplierID];





--RANK(), HAVING
  
SELECT [SupplierID]
      ,[CompanyName]
      ,[Country]---using country as rank identifier. i.e rank based on country alphabetically.
	  ,rank() over(Order By country ASC) as rank_order
 FROM [Northwind].[dbo].[Suppliers] Order By country; -- rank column can be futher put into categories, or ordered by rank number etc.

/****having - filters summerised data, aggregated results****/
 
SELECT COUNT([OrderID]) AS Numbers
      ,[ProductID]
      ,SUM([UnitPrice]) AS Total
  FROM [Northwind].[dbo].[Order Details] GROUP BY [ProductID]
  HAVING SUM([UnitPrice]) < 200;






--MATHEMATICAL FUNCTIONS ON DATA---

/****Put a markup of 20% on unitprice and calculate the new sales price for the product based on that markup.
	markup = 20% = .20
	unitprice + markup = salesprice****/

SELECT [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
	  , [UnitPrice]
      ,([UnitPrice] * .20) AS markup
	  , ([UnitPrice] * .20) + [UnitPrice] AS salesprice
 FROM [Northwind].[dbo].[Products]

/****find the total value of unitprice based on units in stock?
[UnitPrice] * [UnitsInStock] = Total Value****/

SELECT [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
	  ,([UnitPrice] * [UnitsInStock]) AS TotalValue
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [Northwind].[dbo].[Products]

/****Find the difference between Unit Price and Units on order?.How much stock is shortage or access?
   --[UnitPrice] - [UnitsOnOrder] = DifferenceValue****/

SELECT [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
	  ,([UnitPrice] * [UnitsInStock]) AS TotalValue
      ,[UnitsOnOrder]
	  ,([UnitPrice] - [UnitsOnOrder]) AS DifferenceValue
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [Northwind].[dbo].[Products]





---PIVOT TABLE----

/****I want to see the total number of products based on the categories (8)
	one way is count
	SELECT COUNT([ProductID]) as Productcounts
    ,[CategoryID]
	FROM [Northwind].[dbo].[Products]
	GROUP BY [CategoryID];

Now pivot-- to see category id values (8) as columns.

step 1: start with the fields you want to pivot on:

SELECT [ProductID] ,[CategoryID]
FROM [Northwind].[dbo].[Products]
  
step 2: what do you want to pivot on (show the total no of products by each category)

PIVOT 
COUNT([ProductID])
FOR [CategoryID] IN ([1],[2],[3],[4],[5],[6],[7],[8])

step3: wrap the select data****/

SELECT * FROM 
  (SELECT [ProductID] ,[CategoryID]
  FROM [Northwind].[dbo].[Products]) AS T
  PIVOT( 
  COUNT([ProductID])
  FOR [CategoryID] IN ([1],[2],[3],[4],[5],[6],[7],[8])
  ) as pivot_result

/****in order details table count no of orderes for products one to 10****/

 SELECT * FROM
(SELECT [OrderID]
      ,[ProductID]
FROM [Northwind].[dbo].[Order Details]) as p
PIVOT (
COUNT([OrderID])
FOR [ProductID] IN ([1],[2],[3],[4],[5],[6],[7],[8], [9], [10])) as pivot_result





--JOINS (INNER, LEFT, RIGHT)

/****inner join --gives all records from both tables based on the unique identifier.
left join--ives all records from tables on the left of the clause based on the unique identifier.
right join--ives all records from tables on the right of the clause based on the unique identifier.****/

--TABLE 1
SELECT [RegionID]
      ,[RegionDescription]
  FROM [Northwind].[dbo].[Region]

---TABLE 2
SELECT [TerritoryID]
      ,[TerritoryDescription]
      ,[RegionID]
  FROM [Northwind].[dbo].[Territories]


--INNER JOIN
SELECT t.[TerritoryID]
      ,t.[TerritoryDescription]
	  ,t.[RegionID]
      ,r.[RegionID]
      ,r.[RegionDescription]
FROM [Northwind].[dbo].[Territories] t 
INNER JOIN [Northwind].[dbo].[Region] r
ON t.[RegionID] = r.[RegionID];


/****show the shipping company name in the orders result set. JOIN orders table and shippers table****/

SELECT 
	o.[OrderID]
	,o.[ShipVia]
	,o.[ShipCountry]
	,s.[CompanyName]
	FROM [Northwind].[dbo].[Orders] o
	LEFT JOIN [Northwind].[dbo].[Shippers] s
 ON o.[ShipVia] = s.[ShipperID];




---UNION, UNION ALL, EXCEPT clause---

/****UNION -- gives combined result set based on unique values (distinct values).
UNION ALL --gives all the values even if there are duplicates.
Except clause- will show results from 1st table except results that are also in 2nd table. it will not take the results that match the 1st table.****/

SELECT [City]
      ,[Country]
  FROM [Northwind].[dbo].[Customers] WHERE Country = 'USA'

UNION 

SELECT [City]
    ,[Country]
 FROM [Northwind].[dbo].[Suppliers] WHERE Country = 'USA';



SELECT [City]
      ,[Country]
  FROM [Northwind].[dbo].[Customers] WHERE Country = 'USA'

UNION ALL

SELECT [City]
    ,[Country]
 FROM [Northwind].[dbo].[Suppliers] WHERE Country = 'USA';





---SUBQUERRIES---

/****find the product names whos price is greater than the average price of all the products?
 --1.find average price of products.
 --2. than compare with all products.****/

SELECT [ProductID]
      ,[ProductName]
      ,[UnitPrice]
 FROM [Northwind].[dbo].[Products] 
  WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM [Northwind].[dbo].[Products] );




--EXPORT DATA RESULTS IN EXCEL--

/****When client wants to see the results, you have to get data out of sql server into a file through MS SQL interface. 
Use right click on result set in sql interface and hit save as to whatever file type you want***/.




---THE END---------------------------------------------------------------------------------------------------------------------------------------



     

 



