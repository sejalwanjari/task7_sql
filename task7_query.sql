select * from sales
select * from customer
select * from product
	
--report of all state sales,quantity,discount,profit with following aggregation--
	
select c.state,c.city ,count(s.sales)as count_sales,sum(s.sales)as sum_sales,
avg(s.sales)as average_sales,sum(s.quantity)as quantity_sales,avg(s.discount)as discount_sales,
max(s.profit)as max_sales_profit, min(s.profit)as min_sales_profit  from sales as s 
inner join customer as c
on s.customer_id = c.customer_id
group by c.state,c.city


	
-- get data of all state and city avg customer age--

select state, city, avg(age) as avg_customer_age from customer as c
group by state, city 


	
--get data of 2017 & 2018 with product name ans sales per quantity

select product_name, min(s.sales) / max (s.quantity) as sales_quantity from product as p
inner join sales as s
on p.product_id = s.product_id
where order_date between '01-01-2017' and  '31-12-2018'
group by product_name
order by product_name,sales_quantity desc

