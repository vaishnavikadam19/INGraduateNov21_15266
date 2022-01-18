----------------------------------------------Section-13 INDEXES-----------------------------------------------

1) CREATE INDEXS:-
		- CREATE INDEX idx_employee_empid ON Employee(empid);
	
		-CREATE INDEX idx_orders_customerid_orderid ON 
		 orders (customerid,orderid)
	 
	 
3) DROP INDEXES :-
		- DROP INDEX idx_orders_customerid_orderid;
	
4)HOW TO KILL RUNWAY QUERIES :-
	CREATE TABLE performance_test
	(
		id serial,
		location text
	)
INSERT INTO performance_test(location)
SELECT 'katmandu,nepal' FROM generate_series(1,500000000);

SELECT * FROM pg_stat_activity WHERE state='active';


5) USING SEE THE QUERY PLAN :-

  DROP TABLE IF EXISTS performance_test
  CREATE TABLE performance_test
  (
	 id serial,
	 location text
  )
  
  INSERT INTO performance_test(location)
  SELECT md5(random():: text) FROM generate_series(1,100000000)
  
  
	SELECT COUNT(*) FROM performance_test
	SELECT * FROM performance_test WHERE id=2000000;
	EXPLAIN SELECT COUNT(*) FROM performance_test
	EXPLAIN SELECT * FROM performance_test WHERE id=2000000;
   
   
 6) USE ANALYSIS TO UPDATE DATA :-

    DROP TABLE IF EXISTS performance_test
    CREATE TABLE performance_test
    (
	 id serial,
	 location text
    )
	 INSERT INTO performance_test(location)
     SELECT md5(random():: text) FROM generate_series(1,100000000)
	
	 EXPLAIN ANALYZE SELECT * FROM performance_test WHERE id=2000000;
 
     ANALYZE performance_test
	 
	 
