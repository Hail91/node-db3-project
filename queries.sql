-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select product.ProductName, category.CategoryName
from product 
join category ON product.categoryId = category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.id, s.companyName from [order] as o
join Shipper as s
ON o.shipvia = s.id
where orderdate < "2012-08-09";


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName, od.Quantity from [orderDetail] as od
join Product as p
ON od.ProductId = p.Id
where od.OrderId = 10251
order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id, c.companyName, e.lastName
from [order] as o
join customer as c
ON o.customerId = c.Id
Join employee as e
ON o.EmployeeId = e.Id
