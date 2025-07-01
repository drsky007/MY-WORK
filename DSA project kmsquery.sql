CREATE DATABASE KMS_DBS

select * from [dbo].[KMS Sql Case Study]
------product with the highest sales

------- Q1
SELECT top 1
  row_id, product_category, sales 
  from [dbo].[KMS Sql Case Study]
order by Sales desc



-----------------Q2B
-------Top bottom 3 sales by category


select top 3
     ROW_ID, PROVINCE,Sales, Product_category, region
from [dbo].[KMS Sql Case Study]
order by Sales asc

-----------Q2A
-------Top  3 sales by category
-------
select top 3 * from (
       select Row_ID, Province, Sales, Product_Category, Region
	          from [dbo].[KMS Sql Case Study]) AS KMS
order by sales desc


----------------------------Q3----------------------
---------Total sales of appliance in ontario  ------------What were the total sales of appliances in Ontario?

	select province, product_category, sum(sales) as [Total sales]
	from  [dbo].[KMS Sql Case Study]
	where [Province] = 'ontario' and   [product_category] = 'technology'
	GROUP by Province, Product_Category


select province,  sum(sales) as [Total sales]
	from  [dbo].[KMS Sql Case Study]
	where [Province] = 'ontario'
	group by Province


---------------------Q4----------------
----Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
------

--KMS Management should focus on trying new product category other than technology.

-------top bottom 10 customer with the least revenue

select top 10
     ROW_ID, Customer_Name, Profit, Sales, Province, Ship_Mode, Shipping_Cost, Product_Category, Discount,Unit_Price, Product_Sub_Category
from [dbo].[KMS Sql Case Study]
order by Profit asc


-------top bottom 10 customer with the least revenue

select top 10
     ROW_ID, Customer_Name, Profit, Sales, Province, Ship_Mode, Shipping_Cost
from [dbo].[KMS Sql Case Study]
order by Profit desc

-------------------Q5----------------------
---------the mostshiping cost using which shiping method ?----


	select top 10 row_id, customer_name, ship_mode, sum(Shipping_Cost) as shiping_cost
   from [dbo].[KMS Sql Case Study]
   group by Row_ID, Customer_Name, Ship_Mode
   order by shiping_cost desc


	
----------------------Q6A----------------------
	-------------- who are the most valuable customer------------
   select top 5 row_id, customer_name, sum(sales) as Totalspent
   from [dbo].[KMS Sql Case Study]
   group by Row_ID, Customer_Name
   order by Totalspent desc

   ----------------Q6B---------------------

   select top 5 [Customer_Name],[Product_Name],
   sum(sales) as Total_sales
   from [dbo].[KMS Sql Case Study]
	group by [Customer_Name], [product_name]
	order by Total_sales desc


-----------Q7-----------

	select top 1
	Customer_Name, Customer_Segment, Sales
FROM [dbo].[KMS Sql Case Study]
where [Customer_Segment] = 'small business'
order by Sales desc

---------------Q8---------

SELECT top 54
Customer_Name, Customer_Segment, Order_Quantity, Order_Date
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment]= 'corporate' 
order by Order_Quantity desc

select top 1
Customer_Name, Customer_Segment,  Order_Quantity
	from  [dbo].[KMS Sql Case Study]
	where [Order_Date] = '10-13-2010'
	order by Order_Quantity desc

	--------------Q9
	--------- Which consumer customer was the most profitable one?

	select top 1
	Customer_Name, Customer_Segment, Profit
FROM [dbo].[KMS Sql Case Study]
where [Customer_Segment] = 'consumer'
order by Profit desc

-------------Q10A-------------

 select top 10 row_id, customer_name, sum(Profit) as Item_returned
   from [dbo].[KMS Sql Case Study]
   group by Row_ID, Customer_Name
   order by Item_returned asc

   --------------Q10B------------

    select top 10 row_id, customer_name, customer_segment, sum(Profit) as Item_returned
   from [dbo].[KMS Sql Case Study]
   group by Row_ID, Customer_Name,  customer_segment
   order by Item_returned asc

-------------------Q11------------------------
------THE Company doesn'nt spend appropiately base on the order priority, Because if you take a good look at the query below you will observe that in Dlivery Truck it spend more on high priority,while in Regular Air it spend more on low priority.
------Based on the information provided, it seems that the company may not have appropriately spent shipping costs based on the Order Priority.

-----Analysis
------If the company prioritizes orders, it's likely that high-priority orders require faster shipping, while low-priority orders can be shipped more slowly. Given that Express Air is the fastest but most expensive option, it would make sense to reserve this method for high-priority orders.

--------On the other hand, the delivery truck is the most economical but slowest option, making it more suitable for low-priority orders.

-------Conclusion
------If the company is spending shipping costs appropriately based on Order Priority, we would expect to see:

- -----High-priority orders shipped via Express Air
--------- Low-priority orders shipped via delivery truck

----------If this is not the case, the company may be overspending on shipping costs for low-priority orders or underspending on high-priority orders, potentially impacting customer satisfaction and loyalty.
---------

On the other hand, the delivery truck is the most economica

select top 10 order_priority, ship_mode, sum(shipping_cost) as review
from [dbo].[KMS Sql Case Study]
group by ship_mode, order_priority
order by review desc
