-- Active: 1705558080201@@127.0.0.1@3306@bikerentals
USE bikerentals;

DROP TABLE trip;

-- creating tables
CREATE TABLE trip (
    trip_id INTEGER,
    trip_duration INTEGER,
    start_time DATETIME,
    stop_time DATETIME,
    user_id INTEGER,
    bike_id INTEGER,
    start_station_id INTEGER,
    end_station_id INTEGER
);

CREATE TABLE user (
    user_id INTEGER,
    user_type VARCHAR(100),
    birth_year VARCHAR(30),
    gender VARCHAR(30)
);


CREATE TABLE bike (
    bike_id INTEGER
);


-- inserting data 
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bike.csv"
INTO TABLE bike
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/trip.csv"
INTO TABLE trip
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/user.csv"
INTO TABLE user
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


