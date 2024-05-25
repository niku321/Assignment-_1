USE AdventureWorksLT2022;  -- Ensure you are using the correct database
--list of all the customers
SELECT 
    CustomerID,
    FirstName,
    LastName,
    CompanyName,
    EmailAddress,
    Phone
FROM 
    SalesLT.Customer;

USE AdventureWorksLT2022;  
--list of all customers where company name ending in n
SELECT 
    CustomerID,
    FirstName,
    LastName,
    CompanyName,
    EmailAddress,
    Phone
FROM 
    SalesLT.Customer
WHERE 
    CompanyName LIKE '%n';  

	USE AdventureWorksLT2022;  -- Ensure you are using the correct database
--list of customers who live in berin or london
SELECT 
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.CompanyName,
    C.EmailAddress,
    C.Phone,
    A.City
FROM 
    SalesLT.Customer AS C
    INNER JOIN SalesLT.CustomerAddress AS CA ON C.CustomerID = CA.CustomerID
    INNER JOIN SalesLT.Address AS A ON CA.AddressID = A.AddressID
WHERE 
    A.City IN ('Berlin', 'London');  

USE AdventureWorksLT2022;  -- Ensure you are using the correct database
--list of customer who live in uk or usa
SELECT 
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.CompanyName,
    C.EmailAddress,
    C.Phone,
    A.City,
    A.CountryRegion
FROM 
    SalesLT.Customer AS C
    INNER JOIN SalesLT.CustomerAddress AS CA ON C.CustomerID = CA.CustomerID
    INNER JOIN SalesLT.Address AS A ON CA.AddressID = A.AddressID
WHERE 
    A.CountryRegion IN ('United Kingdom', 'United States');  

	USE AdventureWorksLT2022;  -- Ensure you are using the correct database
	
SELECT DISTINCT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.CompanyName,
    C.EmailAddress,
    C.Phone
FROM 
    SalesLT.Customer AS C
    INNER JOIN SalesLT.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
ORDER BY 
    C.CustomerID;  

	USE AdventureWorksLT2022;  -- Ensure you are using the correct database
--list of customer who ever placed the order
SELECT 
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.CompanyName,
    C.EmailAddress,
    C.Phone
FROM 
    SalesLT.Customer AS C
LEFT JOIN 
    SalesLT.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
WHERE 
    SOH.CustomerID IS NULL
ORDER BY 
    C.CustomerID; 

	USE AdventureWorksLT2022;  -- Ensure you are using the correct database
	--list of customer who never placed order
SELECT 
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.CompanyName,
    C.EmailAddress,
    C.Phone,
    CONCAT(C.FirstName, ' ', C.LastName) AS ContactName,
    COUNT(SOH.SalesOrderID) AS NumberOfOrders
FROM 
    SalesLT.Customer AS C
LEFT JOIN 
    SalesLT.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
GROUP BY 
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.CompanyName,
    C.EmailAddress,
    C.Phone
ORDER BY 
    C.CustomerID;  
