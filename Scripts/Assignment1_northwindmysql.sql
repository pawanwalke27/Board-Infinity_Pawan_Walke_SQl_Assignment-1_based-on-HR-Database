/*
1) Write a query to get Product name and quantity/unit
*/
select *
from northwind.products;
select ProductName, QuantityPerunit
	from northwind.products;
    
/*
2)Write a query to get current Product list (Product ID and name)
*/
select ProductName, ProductID
	from northwind.products
    where Discontinued = "False"
    order by ProductName;
    
/*
3) Write a query to get discontinued Product list (Product ID and name)
*/
select ProductID, ProductName
	from northwind.products
    where Discontinued = 1
    order by ProductName;
    
/*
4) Write a query to get most expense and least expensive Product list (name and unit price)
*/
select ProductName, UnitPrice
from northwind.products
order by UnitPrice desc;

/*
5) Write a query to get Product list (id, name, unit price) where current products cost less than $20
*/
select ProductID, ProductName, UnitPrice
		from northwind.products
        where(((UnitPrice)<20) and ((Discontinued)=false))
        order by UnitPrice desc;
        
/*
6) Write a query to get Product list (id, name, unit price) where products cost between $15 and $25
*/
select ProductName, UnitPrice
from northwind.products
where (((UnitPrice)>=15 and (UnitPrice)<=25)
and ((Products.Discontinued)=false))
order by Products.UnitPrice desc;

/*
7)Write a query to get Product list (name, unit price) of above average price
*/
select distinct ProductName, UnitPrice
	from northwind.products
    where UnitPrice > ( select avg(UnitPrice) from northwind.products)
    order by UnitPrice;
    
/*
8) Write a query to get Product list (name, unit price) of ten most expensive products
*/
select distinct ProductName as Ten_Most_Expensive_Products, UnitPrice
	from northwind.products as a 
    where 10 >= (select count(distinct UnitPrice)
		from northwind.products as b
        where b.UnitPrice >= a.UnitPrice)
	order by UnitPrice desc;
    
/*
9) Write a query to count current and discontinued products
*/
select count(ProductName)
	from northwind.products
    group by Discontinued;
    
/*
10) Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order
*/
select ProductName, UnitsOnOrder, UnitsInStock
	from northwind.products
    where (((Discontinued)=false) and ((UnitsInStock)<UnitsOnOrder));
    