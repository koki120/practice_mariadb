# SQLについて

実行環境は`mariadb`を使用している。

使用するテーブルは以下の通りである。

```sql
-- Table: Customers
CREATE TABLE Customers (
    CustomerCode VARCHAR(50) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    RepresentativeCode VARCHAR(50)
);

-- Table: Representatives
CREATE TABLE Representatives (
    RepresentativeCode VARCHAR(50) PRIMARY KEY,
    RepresentativeName VARCHAR(100) NOT NULL
);

-- Table: Products
CREATE TABLE Products (
    ProductCode VARCHAR(50) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

-- Table: Orders
CREATE TABLE Orders (
    OrderNumber VARCHAR(50) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerCode VARCHAR(50),
    FOREIGN KEY (CustomerCode) REFERENCES Customers(CustomerCode)
);

-- Table: Warehouses
CREATE TABLE Warehouses (
    WarehouseCode VARCHAR(50) PRIMARY KEY,
    WarehouseName VARCHAR(100) NOT NULL
);

-- Table: OrderDetails
CREATE TABLE OrderDetails (
    OrderNumber VARCHAR(50),
    LineNumber INT,
    ProductCode VARCHAR(50),
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderNumber, LineNumber),
    FOREIGN KEY (OrderNumber) REFERENCES Orders(OrderNumber),
    FOREIGN KEY (ProductCode) REFERENCES Products(ProductCode)
);

-- Table: Inventory
CREATE TABLE Inventory (
    InventoryCode VARCHAR(50) PRIMARY KEY,
    ProductCode VARCHAR(50),
    Quantity INT NOT NULL,
    FOREIGN KEY (ProductCode) REFERENCES Products(ProductCode)
);

-- Insert data into Customers
INSERT INTO Customers (CustomerCode, CustomerName, Address, PhoneNumber, RepresentativeCode) VALUES
('C001', 'Acme Corporation', '123 Maple Street', '555-1234', 'R001'),
('C002', 'Beta Inc.', '456 Oak Avenue', '555-5678', 'R002'),
('C003', 'Gamma LLC', '789 Pine Road', '555-6789', 'R003'),
('C004', 'Delta Ltd.', '101 Cedar Blvd', '555-2345', 'R001'),
('C005', 'Epsilon Industries', '202 Birch Way', '555-3456', 'R002');

-- Insert data into Representatives
INSERT INTO Representatives (RepresentativeCode, RepresentativeName) VALUES
('R001', 'John Smith'),
('R002', 'Jane Doe'),
('R003', 'Alice Johnson'),
('R004', 'Bob Brown');

-- Insert data into Products
INSERT INTO Products (ProductCode, ProductName, UnitPrice) VALUES
('P001', 'Widget A', 9.99),
('P002', 'Widget B', 19.99),
('P003', 'Gadget C', 29.99),
('P004', 'Device D', 39.99),
('P005', 'Tool E', 49.99);

-- Insert data into Orders
INSERT INTO Orders (OrderNumber, OrderDate, CustomerCode) VALUES
('O001', '2024-08-27', 'C001'),
('O002', '2024-08-28', 'C002'),
('O003', '2024-08-29', 'C003'),
('O004', '2024-08-30', 'C004'),
('O005', '2024-08-31', 'C005');

-- Insert data into Warehouses
INSERT INTO Warehouses (WarehouseCode, WarehouseName) VALUES
('W001', 'Main Warehouse'),
('W002', 'Secondary Warehouse'),
('W003', 'Downtown Warehouse'),
('W004', 'Uptown Warehouse');

-- Insert data into OrderDetails
INSERT INTO OrderDetails (OrderNumber, LineNumber, ProductCode, Quantity) VALUES
('O001', 1, 'P001', 10),
('O001', 2, 'P002', 5),
('O002', 1, 'P003', 15),
('O002', 2, 'P004', 7),
('O003', 1, 'P001', 20),
('O003', 2, 'P005', 3),
('O004', 1, 'P002', 25),
('O004', 2, 'P003', 30),
('O005', 1, 'P004', 12),
('O005', 2, 'P005', 8);

-- Insert data into Inventory
INSERT INTO Inventory (InventoryCode, ProductCode, Quantity) VALUES
('I001', 'P001', 100),
('I002', 'P002', 50),
('I003', 'P003', 75),
('I004', 'P004', 60),
('I005', 'P005', 40);
```