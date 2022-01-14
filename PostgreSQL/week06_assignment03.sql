---------------------------------------------------Section 9 ------------------------------------------------------

1)Group By

  1) Do we have in each Country
	SELECT country , COUNT(*) 
	FROM customers 
	GROUP BY country 
	ORDER BY country;

  2)what is the number of product in each category.
	SELECT categoryname 
	FROM  categories 
	NATURAL JOIN products 
	GROUP BY categoryname 
	ORDER BY categoryname;

  3) what is the average number of items ordered of products ordered by the average amount.
	SELECT productname ,AVG(quantity) 
	FROM products 
	JOIN order_details USING(productid)
     	GROUP BY productname 
     	ORDER BY AVG(quantity) DESC;

  4) How many suppliers in each country.
	SELECT country , COUNT(*) 
	FROM suppliers 
	GROUP BY country 
	ORDER  BY COUNT(*) DESC;

   5) total value of each product sold for year of 1997.
	SELECT productname,SUM(order_details.unitprice * quantity) 
	FROM products 
      	JOIN order_details ON products.productid = order_details.productid 
      	JOIN orders ON orders.orderid = order_details.orderid
      	WHERE orderdate between '1997-01-01' AND '1997-12-31'
      	GROUP BY productname 
	ORDER  BY SUM(order_details.unitprice * quantity) DESC;

2)Using Having 

  1. Fing The product that sold less then $2000.
	SELECT productname, SUM(order_details.unitprice * quantity) as AmountBought
     	FROM products JOIN order_details USING (productid)
     	GROUP BY productname 
     	HAVING SUM(order_details.unitprice * quantity) < 2000
     	ORDER BY productname DESC ;

  2. Customer that have bought more then $5000 of products.
	SELECT companyname, SUM(order_details.unitprice * quantity) as AmountBought
      	FROM customers 
      	NATURAL JOIN orders
      	NATURAL JOIN order_details
      	GROUP BY companyname 
      	HAVING SUM(order_details.unitprice * quantity) > 5000
      	ORDER BY companyname DESC;

  3. Customer that brought more then $5000 of products with orderdate in first six months of the year of 1997.
 	SELECT companyname, SUM(order_details.unitprice * quantity) as AmountBought
      	FROM customers 
      	NATURAL JOIN orders
      	NATURAL JOIN order_details
      	WHERE orderdate BETWEEN '1997-01-01' AND '1997-06-30'
      	GROUP BY companyname 
      	HAVING SUM(order_details.unitprice * quantity) > 5000
      	ORDER BY companyname DESC;


3)GROUPPING SETs :-

	SELECT categoryname,productname, SUM(od.unitprice * quantity) as AmountBought
    	FROM categories 
     	NATURAL JOIN products 
     	NATURAL JOIN order_details AS od 
    	GROUP BY GROUPING SETS ((categoryname),(categoryname,productname)) 
   	HAVING SUM(od.unitprice * quantity) > 5000
    	ORDER BY categoryname ,productname;

4)Rollup 

   1. ROLL up category , products,customer
     	SELECT C.companyname,categoryname,productname, SUM(od.unitprice * quantity) as AmountBought
        FROM customers AS C 
        NATURAL JOIN orders 
        NATURAL JOIN order_details AS od 
        JOIN products USING(productid)
        JOIN categories Using(categoryid)
        GROUP BY ROLLUP (companyname,categoryname,productname) 
        ORDER BY companyname,categoryname ,productname;


5)CUBE

   1. CUBE category , products,customer
    	SELECT C.companyname,categoryname,productname, SUM(od.unitprice * quantity) as AmountBought
       	FROM customers AS C 
       	NATURAL JOIN orders 
       	NATURAL JOIN order_details AS od 
       	JOIN products USING(productid)
       	JOIN categories Using(categoryid)
       	GROUP BY CUBE (companyname,categoryname,productname) 
       	ORDER BY companyname,categoryname ,productname;



---------------------------------------------------Section 10 ------------------------------------------------------


1)UNION
  1. Find all the companyname of all customers and suppliers , with one records for each companies name 
  	SELECT companyname 
	FROM customers  
	UNION 
	SELECT companyname 
	FROM suppliers;

2)UNIONALL 

  1. Find all the cities of all customers and suppliers , with one records for each companies city.
  	SELECT city 
	FROM customers 
	UNION ALL 
	SELECT city 
	FROM suppliers;

  2. Distinct Countries of all our customers and suppliers in alphabetical order.
	SELECT country 
	FROM customers 
	UNION 
	SELECT country 
	FROM suppliers 
	ORDER BY country ASC;

  3. All list of countries of our suppliers and customers with a record for each one.
  	SELECT country 
	FROM customers 
	UNION 
	SELECT country 
	FROM suppliers 
	ORDER BY country DESC;


3)INTERSECT :-
   
  1. FIND ALL countries that we have both customers and suppliers in.
    	SELECT country 
	FROM customers 
	INTERSECT 
	SELECT country 
	FROM suppliers;

  2. Count all countries that we have both customers and suppliers in.
    	SELECT COUNT(*) 
	FROM
     	(SELECT country FROM customers INTERSECT ALL SELECT country FROM suppliers) AS Togather;

  3. Distinct cities that we have a suppliers and customer located in.
      	SELECT city 
	FROM customers 
	INTERSECT 
	SELECT city 
	FROM suppliers;

  4. the count the numbers of customers and suppliers pairs that are in the same city.
     	SELECT COUNT(*) 
	FROM
      	(SELECT city FROM customers INTERSECT SELECT city FROM suppliers)AS same_city;


 3)Except:-

   1. Find the number of customer that are in country without suppliers.
    	SELECT COUNT(*) FROM
        (SELECT country FROM customers EXCEPT ALL SELECT country FROM suppliers) AS lonly_customer;

   2. cities we have a suppliers with no customers.
	SELECT city FROM suppliers
        EXCEPT 
        SELECT city FROM customers;


---------------------------------------------------Section 11 ------------------------------------------------------


1) SUBQUERY using exists:-

  1. Find the customer with an order in april , 1997.
	SELECT companyname 
	FROM customers
     	WHERE 
     	EXISTS (SELECT customerid FROM orders 
	     	WHERE orders.customerid = customers.customerid AND 
	     	orderdate BETWEEN '1997-04-01' AND '1997-04-30');

  2. FIND ALL THE SUPPLIERS WITH A PRODUCT THATS COSTS MORE THEN $2000.
	SELECT companyname 
	FROM suppliers
      	WHERE 
      	EXISTS (SELECT productid FROM products 
      		WHERE products.supplierid = suppliers.supplierid AND 
      		unitprice > 200);

  3. FIND ALL THE SUPPLIERS THAT DOESNOT HAVE AN ORDERS IN DECEMBER 1996.
  	SELECT companyname 
	FROM suppliers
       	WHERE 
       	NOT EXISTS (SELECT products.productid FROM products
       		    JOIN order_details ON order_details.productid = products.productid	
       		    JOIN orders ON orders.orderid = order_details.orderid
       		    WHERE products.supplierid = suppliers.supplierid AND 
       		    orderdate BETWEEN '1996-10-01' AND '1996-10-31');


2) SUBQUERY using ANY and ALL:-

  1) ANY :-
    1. FIND THE CUSTOMERS WITH AN ORDERS DETAILS WITH MORE THEN 50 ITEMS IN A SINGLE PRODUCTS.
	SELECT companyname 
	FROM Customers 
      	WHERE customerid =
      	ANY (SELECT customerid FROM orders
     	     JOIN order_details ON order_details.orderid = orders.orderid	
      	     WHERE quantity > 50);

   2. FIND ALL THE SUPPLIERS THAT HAVE HAD AN ORDERWITH 1 ITEMS.
	SELECT companyname 
	FROM suppliers 
       	WHERE supplierid =
       	ANY (SELECT products.supplierid FROM order_details
       	     JOIN products ON order_details.productid = products.productid	
       	     WHERE quantity = 1);

 2) ALL :-
     
   1. we had order amounts that were higher then average of all the products.
	SELECT DISTINCT productname
	FROM products 
        JOIN order_details ON products.productid =  order_details.productid
        WHERE order_details.unitprice*quantity > ALL (SELECT AVG(order_details.unitprice*quantity) FROM order_details
	GROUP BY productid);

    2. FIND ALL THE CUSTOMER THAT ORDERED more in one item then the average order amount per item of all customers.
 	SELECT DISTINCT companyname FROM customers 
        JOIN orders ON orders.customerid = customers.customerid
       	JOIN order_details ON orders.orderid =  order_details.orderid
        WHERE order_details.unitprice*quantity >
        ALL (SELECT AVG(order_details.unitprice*quantity) FROM order_details
        JOIN orders ON orders.orderid = order_details.orderid
	GROUP BY orders.customerid);


3)SUBQUERY :-

   1. that are the same countries as the suppliers.
   	SELECT companyname 
	FROM customers 
	WHERE country IN(SELECT country FROM suppliers);

   2. find all suppliers that are the same city as a customers.
	SELECT companyname 
	FROM suppliers 
	WHERE city IN(SELECT city FROM customers);