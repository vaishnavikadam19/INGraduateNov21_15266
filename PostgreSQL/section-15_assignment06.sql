----------------------------------------------Section-15 CREATING AND MODUFYING TABLES-----------------------------------------------

1) CREATING TABLES :-

   - A table consists of rows and columns. 
   - Tables allow you to store structured data.
   
   SYNTAX:-
   
   CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_contraint,
   column2 datatype(length) column_contraint,
   column3 datatype(length) column_contraint,
   table_constraints
   );
   
   
   
   CREATE TABLE IF NOT EXISTS SUBSCRIBERS
   (
	subid numeric CONSTRAINT pk_sub PRIMARY KEY ,
	first_name varchar(50) NOT NULL,
	last_name varchar(50)NOT NULL,
	email varchar(100) NOT NULL,
	signupdate timestamp not null,
	frequency numeric not null,
	iscustomer boolean
   )
   
   
2)ALTER TABLES - I :-

     I)MODIFY THE TABLE NAME .
			ALTER TABLE subscribers RENAME TO subscriber;

     II) MODIFY THE TABLES column NAME .
			ALTER TABLE subscribers RENAME first_name to firstname;
	 
	  
3)ALTER TABLES - II:-   	 

      I) ADD COLUMN IN TO subscribers TABLES.
			ALTER TABLE subscribers ADD COLUMN last_visit_date TIMESTAMP;

     II) REMOVE COLUMN FROM THE subscribers TABLE.
			ALTER TABLE subscribers DROP COLUMN last_visit_date;
	  
4)ALTER TABLES - III:-

      I) CHANGE DATA TYPE OF COLUMN NAME.
			ALTER TABLE subscribers ALTER COLUMN email SET DATA TYPE varchar(200);

      II) DROP TABLES
			DROP TABLE subscribers; 
	  
	  