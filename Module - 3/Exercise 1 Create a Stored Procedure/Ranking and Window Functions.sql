create database CTC;
use CTC;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Laptop A', 'Electronics', 80000),
(2, 'Laptop B', 'Electronics', 75000),
(3, 'Laptop C', 'Electronics', 75000),
(4, 'Phone A', 'Electronics', 50000),
(5, 'Shirt A', 'Fashion', 2000),
(6, 'Shirt B', 'Fashion', 1800),
(7, 'Shirt C', 'Fashion', 1800),
(8, 'Shirt D', 'Fashion', 1500);

SELECT *from Products;

SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RowNum
FROM Products;

SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    RANK() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RankNo
FROM Products;

SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    DENSE_RANK() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS DenseRankNo
FROM Products;

SELECT *
FROM (
    SELECT
        ProductID,
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS rn
    FROM Products
) AS RankedProducts
WHERE rn <= 3;