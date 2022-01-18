------------------------------------------Section-22 WINDOW FUNCTION---------------------------------------------------

1. the following query returns the product name, the price, product group name, along with the average prices of each product group.
		SELECT
		product_name,group_name,price,ROW_NUMBER () OVER (
			PARTITION BY group_name
			ORDER BY price
		)
		FROM products
		INNER JOIN product_groups USING (group_id);
	
2. The ROW_NUMBER() function assigns a sequential number to each row in each partition.
		SELECT product_name, group_name,price,RANK () OVER (
			PARTITION BY group_name
			ORDER BY price
		)
		FROM products
		INNER JOIN product_groups USING (group_id);
	
DENSE_RANK : 	
		SELECT product_name, group_name, price, DENSE_RANK () OVER (
			PARTITION BY group_name
			ORDER BY price
		)
		FROM products
		INNER JOIN product_groups USING (group_id);	
	
FIRST_VALUE
		SELECT product_name, group_name, price,FIRST_VALUE (price) OVER (
			PARTITION BY group_name
			ORDER BY price
		) AS lowest_price_per_group
		FROM products
		INNER JOIN product_groups USING (group_id);
	
LAST_VALUE
		SELECT product_name,group_name,price,LAST_VALUE (price) OVER (
			PARTITION BY group_name
			ORDER BY price 
			RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		) AS highest_price_per_group
		FROM products
		INNER JOIN product_groups USING (group_id);
	