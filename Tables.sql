IF DB_ID('DataBootcamp') IS NULL
BEGIN
    CREATE DATABASE DataBootcamp;
END;
GO

USE DataBootcamp;
GO

-- Customers
CREATE TABLE dbo.Customers (
    CustomerID   INT IDENTITY(1,1) PRIMARY KEY,
    FullName     NVARCHAR(100) NOT NULL,
    Country      NVARCHAR(50)  NOT NULL,
    SignupDate   DATE          NOT NULL DEFAULT (GETDATE())
);

-- Products
CREATE TABLE dbo.Products (
    ProductID    INT IDENTITY(1,1) PRIMARY KEY,
    ProductName  NVARCHAR(100) NOT NULL,
    Category     NVARCHAR(50)  NOT NULL,
    UnitPrice    DECIMAL(10,2) NOT NULL
);

-- Orders (cabecera)
CREATE TABLE dbo.Orders (
    OrderID      INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID   INT NOT NULL,
    OrderDate    DATE NOT NULL DEFAULT (GETDATE()),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID)
);

-- OrderItems (detalle)
CREATE TABLE dbo.OrderItems (
    OrderItemID  INT IDENTITY(1,1) PRIMARY KEY,
    OrderID      INT NOT NULL,
    ProductID    INT NOT NULL,
    Quantity     INT NOT NULL,
    UnitPrice    DECIMAL(10,2) NOT NULL, -- copia precio al momento de compra
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderID)
        REFERENCES dbo.Orders(OrderID),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (ProductID)
        REFERENCES dbo.Products(ProductID)
);
GO

-- Customers
INSERT INTO dbo.Customers (FullName, Country, SignupDate) VALUES
(N'Julio Obando',        N'Costa Rica', '2025-01-05'),
(N'Karol Calderón',      N'Costa Rica', '2025-02-10'),
(N'Angie Lara',          N'México',     '2025-03-15'),
(N'Anibal Salguero',     N'USA',        '2025-04-01'),
(N'Dayana Sandoval',     N'Costa Rica', '2025-04-12');

-- Products
INSERT INTO dbo.Products (ProductName, Category, UnitPrice) VALUES
(N'Laptop Pro 14"',        N'Electrónica', 1200.00),
(N'Ratón Inalámbrico',     N'Accesorios',    25.50),
(N'Teclado Mecánico',      N'Accesorios',    89.99),
(N'Monitor 27" 4K',        N'Electrónica', 399.00),
(N'Auriculares Studio',    N'Audio',       149.95);

-- Orders
INSERT INTO dbo.Orders (CustomerID, OrderDate) VALUES
(1, '2025-04-20'),
(2, '2025-04-21'),
(1, '2025-05-01'),
(3, '2025-05-03');

-- OrderItems
INSERT INTO dbo.OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1200.00),  -- Julio compra 1 Laptop
(1, 2, 2,   25.50),  -- Julio compra 2 Ratones
(2, 3, 1,   89.99),  -- Karol compra Teclado
(2, 5, 1,  149.95),  -- Karol compra Audífonos
(3, 4, 2,  399.00),  -- Julio compra 2 Monitores
(4, 2, 1,   25.50);  -- Angie compra 1 Ratón
GO


SELECT * FROM dbo.Customers;