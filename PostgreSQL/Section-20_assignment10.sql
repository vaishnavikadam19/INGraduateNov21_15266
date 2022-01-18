------------------------------------------Section-20 CONDITIONAL EXPRESSION---------------------------------------------------

1. WE WANT TO RETURN COMPANY NAME,COUNTRY,AND CONTINENT,OUR CUSTOMER ARE FORM .
		SELECT companyname,country,
        CASE WHEN country IN ('Austria','Germany','Poland','France','Sweden','Italy','Spain',
        'UK','Ireland','Belgium','Finland','Norway','Portugal','Switzerland') THEN 'Europe'
        WHEN country IN ('Canada','Mexico','USA') THEN 'North America'
        WHEN country IN ('Argentina','Brazil','Venezuela') THEN 'South America'
        ELSE country
        END AS continent
        FROM customers;
		 
2. A List of Product names,unit price,and label corresponding to inexpensive if unit price is below $10,mid-range if price $10 upto $50 and if over $50.
		SELECT productname,unitprice,
        CASE WHEN unitprice<10 THEN 'inexpensive'
        WHEN unitprice>=10 AND unitprice<=50 THEN 'mid-range'
	    WHEN unitprice > 50 THEN 'premium'
        END AS quality
        FROM products;
		  
		  
2) COALESCE 
1. Return 'N/A' [not applicable] for region fro orders when field is null.
		SELECT customerid,COALESCE(shipregion,'N/A') FROM orders;

2. Return list of suppliers company name and homepage . if homepage is missing put "call to find " for field.
		SELECT companyname,COALESCE(homepage,'Call to find') from suppliers;

3) NULLIF
1. RETURN HOMEPAGE OF SUPPLIERS OR 'NEED TO CALL' IF THE HOMEPAGE IS MISSING.
		SELECT companyname,phone,COALESCE(NULLIF(homepage,''),'Need to call')FROM suppliers;	

2. return fax number if available or phone as secondry option.
		SELECT companyname, COALESCE(NULLIF(fax,''),phone) AS confirmation FROM customers;	 
		