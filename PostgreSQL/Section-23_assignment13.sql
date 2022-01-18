------------------------------------------Section-23 COMPOSITE TYPE---------------------------------------------------

1) COMPOSITE TYPE 
1. CREATE COMPOSITE FOR NAME CALLED FULLNAME THAT INCLUDES FIRST_NAME ,LAST_NAME. and create address composite type and usef on friends.
		CREATE TYPE full_name AS
		(
			first_name varchar(50),
			last_name varchar(50)
		)
		CREATE TYPE address AS
        (
             street_address varchar(50),
	         street_address2 varchar(50),
	         city varchar(50),
	         state_region varchar(50),
	         country varchar(50),
	         postalcode varchar(50)
        )	
		CREATE TABLE friends
        ( 
			name full_name,
			address address
        )
    	
2. drop both types and table friends :-
		DROP TYPE address CASCADE;
        DROP TYPE full_name CASCADE;
        DROP TABLE friends;

3. Create Type and Friend Table
		CREATE TYPE full_name AS
		(
			first_name varchar(50),
			middle_name varchar(50),
			last_name varchar(50)
		);
		CREATE TYPE address AS
        (
            street_address varchar(50),
	        street_address2 varchar(50),
	        city varchar(50),
	        state_region varchar(50),
	        country varchar(50),
	        postalcode varchar(50)
        );
			 
		CREATE TYPE date_to_remember AS 
		(
			birthdate date,
			age integer,
			anniversary date
		);
			 
		CREATE TABLE friends
		(
			name full_name,
			address address,
			specialdates date_to_remember	
		);	   
	

4. Construct Composite
		INSERT INTO friends (name,address,specialdates) VALUES(ROW('ajay','R','Tri'),ROW('77777','','BOIS','Idaho','USA','999999'),
			ROW('1998-07-01',49,'2021-01-7'));
													  
		SELECT * FROM freiends;

		1) return City and birthdate  from friends.
			SELECT (address).city , (specialdates).birthdate FROM friends

		2) used in where clause.
			SELECT (name).first_name , (specialdates).birthdate FROM friends WHERE (name).last_name = 'Tri';
