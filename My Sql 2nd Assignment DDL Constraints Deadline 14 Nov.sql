# Creating Database Sales

CREATE DATABASE Sales;
USE Sales;

# Create Table Orders
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

#Add new column Order_quantity
ALTER TABLE Orders
ADD order_quantity INT;

Desc Orders; 
# Rename orders to sales_orders
ALTER TABLE Orders
RENAME TO sales_orders;

Desc sales_orders;

# Inserting 10 rows to Sales_orders
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Lulu', 'Electronics', 'Smartphone', '1234567890', 150),
(2, 'HomeStore', 'Furniture', 'Chair', '1122334455', 100),
(3, 'SharafDG', 'Electronics', 'Laptop', '2233445566', 70),
(4, 'Max_Fashions', 'Apparel', 'T-Shirt', '3344556677', 150),
(5, 'Shah', 'Appliances', 'Blender', '4455667788', 50),
(6, 'Trends', 'Apparel', 'Jeans', '5566778899', 75),
(7, 'Decor', 'Furniture', 'Table', '1112223334', 100),
(8, 'Nandilath', 'Electronics', 'Tablet', '2223334445', 80),
(9, 'Oxygen', 'Appliances', 'Microwave', '3334445556', 125),
(10, 'Mahalakshmi', 'Apparel', 'Jacket', '4445556667', 140);

select * from sales_orders;

# Retrieve customer_name and ordered_item from Sales_orders 
SELECT Customer_name, Ordered_item FROM sales_orders;

# Use update command to change the name of product of a row
UPDATE sales_orders
SET ordered_item = 'Refrigerator' where order_Id = 9;

select * from Sales_orders;

# Delete Sales_orders from the database
DROP TABLE sales_orders;





