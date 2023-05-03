---Create Sales Tables 
Create Table sales(Customer_id varchar(50),
				  order_date date,
				  product_id varchar(50));
				  
---Insert Values into Sales Tables				  			  
Insert into Sales(Customer_id,order_date, product_id)
values('A1','2021-01-01',1),
		('A1','2021-01-01',2),
		('A1','2021-01-07',2),
		('A1','2021-01-10',3),
		('A1','2021-01-11',3),
		('A1','2021-01-11',3),
		('B1','2021-01-01',2),
		('B1','2021-01-02',2),
		('B1','2021-01-04',1),
		('B1','2021-01-11',1),
		('B1','2021-01-16',3),
		('B1','2021-02-01',3),
		('C1','2021-01-01',3),
		('C1','2021-01-01',3),
		('C1','2021-01-07',3);
		
---Create Menu Tables 
Create Table Menu(Product_id varchar(50),
				  Product_Name Text,
				  Price Real);
				  
---Insert Values into Menu Tables	
Insert into Menu(Product_id,Product_Name,Price)
values (1,'salad',10 ),
	   (2,'coke',15 ),
	   (3,'rice',12 );
	   
---Create Members Tables 
Create Table Members(customer_id varchar(50) primary key not null ,
					 Join_date date);
				
---Insert Values into Members Tables	
Insert into Members(customer_id,Join_date)
values('A1','2021-01-07'),
('B1','2021-01-09');


----2.What is the total amount each customer spent at the restaurant?

select s.customer_id as customer,sum(m.price) as Total_price
From sales as s,Menu as M
Group by customer_id
order by customer_id


---3.How many days has each customer visited the restaurant?

select  customer_id as customer ,count(distinct order_date) as Days_visted
from sales  
Group by customer_id;


-----4.	What is the most purchased item on the menu and how many times was it purchased by all customers?

select product_name,count(product_name) as Times_purchased
from sales as sl
Join Menu as Mn on sl.product_id =Mn.product_id
Group by product_name
order by count(product_name) Desc
limit 1;

----5.	What is the total items and amount spent for each member before they became a member?


SELECT (select sum(price)from Menu) as Amount_Spent,
count(product_id)as Total_Item,customer_id as customer
FROM sales sl 
WHERE customer_id in (select customer_id from members MN)
GROUP BY customer_id

/* 6.	what's the difference between truncate and Delete
Delete is a Data maninuplation Language that Delete only the Records of A table while Truncate is an SQL syntax that delete all Records including the field names.

*/README
introduction
problem statement
skills demonstrtated
data sourcing
data transforming
modelling
Analysis& visualization
conclusion and recomendation

"& #"public sales" &"

