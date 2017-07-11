DROP TABLE IF EXISTS bounty_database;

CREATE TABLE bounty_hunter(

id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
species VARCHAR(255),
bounty_value INT2,
homeworld VARCHAR(255)
);