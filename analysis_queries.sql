--Total Customers
SELECT COUNT(*) AS Total_Customers
FROM Customer;

--Total Deals 
SELECT COUNT(*) AS Total_Deals
FROM Deal;

--Total Revenue 
SELECT SUM(Amount) AS Total_Revenue
FROM Deal;

--Top Customers by Revenue
SELECT 
    c.FullName,
    SUM(d.Amount) AS Total_Revenue
FROM Customer c
JOIN Deal d ON c.CustomerID = d.CustomerID
GROUP BY c.FullName
ORDER BY Total_Revenue DESC;

--Top Products by Revenue
SELECT 
    p.PName,
    SUM(d.Amount) AS Total_Revenue
FROM Product p
JOIN Deal d ON p.ProductID = d.ProductID
GROUP BY p.PName
ORDER BY Total_Revenue DESC;

--Deals per Customer
SELECT 
    c.FullName,
    COUNT(d.DealID) AS Total_Deals
FROM Customer c
JOIN Deal d ON c.CustomerID = d.CustomerID
GROUP BY c.FullName
ORDER BY Total_Deals DESC;

--Monthly Revenue Trend
SELECT 
    DATE_FORMAT(DealDate, '%Y-%m') AS Month,
    SUM(Amount) AS Revenue
FROM Deal
GROUP BY Month
ORDER BY Month;

--Customers with No Deals
SELECT c.*
FROM Customer c
LEFT JOIN Deal d ON c.CustomerID = d.CustomerID
WHERE d.DealID IS NULL;