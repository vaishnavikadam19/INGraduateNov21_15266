----------------------------------------------Section-13 TABLE CONSTRAINTS-----------------------------------------------

1)NOT NULL CONSTRAINT 
	CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (
	  subid numeric ,
	  first_name varchar(50) NOT NULL,
	  last_name varchar(50)NOT NULL
	 )
	 
  I)ALTER TABLE ADD :-
   - ALTER TABLE SUBSCRIBERS ALTER subid SET NOT NULL;
   
  
2)UNIQUE CONSTRAINT
    CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (
	  subid numeric ,
	  first_name varchar(50) NOT NULL,
	  last_name varchar(50)UNIQUE NOT NULL
	 )
	 
  I) MODIFY TABLE TO ADD UNIQUE CONSTRAINT.
  
	- ALTER TABLE TABLE_NAME ADD CONSTRAINT CONSTRAINT_NAME UNIQUE(COLUMN_NAME);
  
    - ALTER TABLE SUBSCRIBERS ADD CONSTRAINT uk_firstname UNIQUE(firstname);
	
  
3) PRIMARY KEY CONSTRAINT
    CREATE TABLE IF NOT EXISTS SUBSCRIBERS
    (
	  subid numeric CONSTRAINT pk_sub PRIMARY KEY ,
	  first_name varchar(50) NOT NULL,
	  last_name varchar(50)UNIQUE NOT NULL
	 )
	 
	I) MODIFY TABLE TO ADD PRIMARY KEY CONSTRAINT. 
	
	- ALTER TABLE SUBSCRIBERS ADD CONSTRAINT Pk_subid PRIMARY KEY(subid);
	
	
4) FOREIGN KEY CONSTRAINT
	 CREATE TABLE IF NOT EXISTS EMPLOYEE
    (
	  empid numeric CONSTRAINT pk_empid PRIMARY KEY ,
	  empname varchar(50) NOT NULL,
	  salary numeric(15,2) NOT NULL,
	  deptno numeric(5),
	  FOREIGN KEY (deptno) REFERENCES DEPARTMENT(deptno)
	 )
	
	 CREATE TABLE IF NOT EXISTS DEPARTMENT
    (
	  deptid numeric CONSTRAINT pk_deptid PRIMARY KEY ,
	  deptnamename varchar(50) NOT NULL
	 )
	 
	 
    I) ALTERING THROUGH ADD THE FOREIGN KEY.
		- ALTER TABLE EMPLOYEE ADD CONSTRAINT fk_deptno_dept FOREIGN KEY (deptno) REFERENCES DEPAREMENT(deptno);
	 
	 
5)CKECK CONSTRAINT :-
		- CHECK CONSTRAINT IS USED TO LIMIT RANGE OF VALUES THAT CAN BE ENTERED FOR A COLUMN.

       CREATE TABLE IF NOT EXISTS EMPLOYEE
		(
			empid numeric CONSTRAINT pk_empid PRIMARY KEY ,
			empname varchar(50) NOT NULL,
			salary numeric(15,2) NOT NULL,
			Age numeric,
			deptno numeric(5),
			FOREIGN KEY (deptno) REFERENCES DEPARTMENT(deptno),
			CHECK(Age > 18)
		)	 
   
   I) ALTERING THROUGH ADD THE CHECK KEY.
		- ALTER TABLE EMPLOYEE ADD CONSTRAINT ck_Age_emp CHECK(Age > 18);
   
   
6)DEFAULT CONSTRAINT 
    CREATE TABLE Persons (
    ID int CONSTRAINT pk_id PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'MUMBAI'
    );
 
   I) ALTERING THROUGH ADD THE DEFAULT KEY. 
		-ALTER TABLE Persons ALTER COLUMN City SET DEFAULT 'MUMBAI';
	