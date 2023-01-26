-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  flight_num INT NOT NULL,
  seat TEXT NOT NULL
);

INSERT INTO passengers
  (first_name, last_name, flight_num ,seat)
VALUES
  ('Jennifer', 'Finch',412,'33B'),
  ('Thadeus', 'Gathercoal',345, '8A'),
  ('Sonja', 'Pauley',534,'12F'),
  ('Jennifer', 'Finch',745,'20A'),
  ('Waneta', 'Skeleton',634,'23D'),
  ('Thadeus', 'Gathercoal',432,'18C'),
  ('Berkie', 'Wycliff',345,'9E'),
  ('Alvin', 'Leathes',123,'1A'),
  ('Berkie', 'Wycliff',432,'32B'),
  ('Cory', 'Squibbes',563,'10D');



  CREATE TABLE airlines 
  (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL UNIQUE,
  headquarters TEXT NOT NULL UNIQUE,
  founded_in INT NOT NULL 
  );

  INSERT INTO airlines
  (airline_name, headquarters, founded_in)
  VALUES
  ('American', 'Dallas,Tx', 1953),
  ('United', 'Washington Dc', 1961),
  ('British Air', 'London', 1951),
  ('Delta', 'Atlanta, Ga',1972),
  ('TUI Fly','Brussells', 1987),
  ('Air China','Bejing', 1965),
  ('Avianca Brasil','Rio', 1981);


  CREATE TABLE departure_info
  (
  id SERIAL PRIMARY KEY,
  pass_id INT NOT NULL,
  airline_id INT NOT NULL,
  departure TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  FOREIGN KEY (pass_id) REFERENCES passengers(id)
  );

  INSERT INTO departure_info
  (pass_id, airline_id, departure, from_city, from_country)
  (1,2,'2018-04-08 09:00:00','Washington DC', 'United States')
  (2,3,'2018-12-19 12:45:00',  'Tokyo', 'Japan')
  (3,4,'2018-01-02 07:00:00', 'Los Angeles', 'United States')
  (4,4,'2018-04-15 16:50:00', 'Seattle', 'United States')
  (5,5,'2018-08-01 18:30:00',  'Paris', 'France')
  (6,6,'2018-10-31 01:15:00', 'Dubai', 'UAE')
  (7,2,'2019-02-06 06:00:00', 'New York', 'United States')
  (8,1,'2018-12-22 14:42:00', 'Cedar Rapids', 'United States')
  (9,1,'2019-02-06 16:28:00','Charlotte', 'United States' )
  (10,7,'2019-01-20 19:30:00', 'Sao Paolo', 'Brazil');


  CREATE TABLE arrivals
  ( 
  id SERIAL PRIMARY KEY,
  pass_id INT NOT NULL,
  airline_id INT NOT NULL,
  arrival TIMESTAMP NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  FOREIGN KEY (pass_id) REFERENCES passengers(id),
  FOREIGN KEY (airline_id) REFERENCES airlines(id)
);   

  INSERT INTO arrivals
  (pass_id, airline_id, arrival, to_city, to_country)

 (1,2,'2018-04-08 12:00:00','Seattle', 'United States')
 (2,3,'2018-12-19 16:15:00','London', 'United Kingdom')
 (3,4,'2018-01-02 08:03:00','Las Vegas', 'United States')
 (4,4,'2018-04-15 21:00:00','Mexico City','Mexico')
 (5,5,'2018-08-01 21:50:00','Casablanca','Morocco')
 (6,6,'2018-10-31 12:55:00','Beijing','China')
 (7,2,'2019-02-06 07:47:00','Charlotte','United States')
 (8,1,'2018-12-22 15:56:00','Chicago', 'United States')
 (9,1,'2019-02-06 19:18:00','New Orleans','United States')
 (10,7,'2019-01-20 22:45:00','Santiago','Chile');