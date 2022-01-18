----------------------------------------------Section-13 SEQUENCES-----------------------------------------------

1) CREATE A SQUENCES :-
   - SYNTAX 
		CREATE SEQUENCE IF NOT EXISTS name
   
2) SERIAL DATATYPE
   CREATE TABLE fruits
   (
		id SERIAL PRIMARY KEY,
		name VARCHAR NOT NULL
   );
   INSERT INTO fruits(name) 
   VALUES('Orange');