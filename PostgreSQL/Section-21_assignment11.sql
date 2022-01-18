------------------------------------------Section-21 DATE/TIME IN POSTGRESQL---------------------------------------------------

I) TIMESTAMP :-
	SUPPORT WHICH TYPE OF STYLE TO DISPLAY DATE .
	    SHOW DATESTYLE;
		ISO,MDY OUTPUT;

    SET THE DATE STYLE 
		SET DATESTYLE -'ISO,DMY'	;
	   
	   
	create table

     CREATE TABLE test_time 
      (
	    startdate DATE,
	    starttamp TIMESTAMP,
	    starttime TIME
      )
	 
	 
	VIEW AVAILABLE TIMEZONES NAME;
		SELECT * FROM pg_timezone_names;