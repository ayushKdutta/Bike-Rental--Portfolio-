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


CREATE TABLE weather (
    station VARCHAR(100),
    name TEXT,
    date DATETIME,
    AWND FLOAT,
    PGTM FLOAT,
    PRCP FLOAT,
    SNOW FLOAT,
    SNWD FLOAT,
    TAVG FLOAT,
    TMAX FLOAT,
    TMIN FLOAT,
    SUN FLOAT,
    WDF2 FLOAT,
    WDF5 FLOAT,
    WSF2 FLOAT,
    WSF5 FLOAT
)


CREATE TABLE station (
    station_id INTEGER,
    station_name TEXT,
    station_latitude DOUBLE,
    station_longitude DOUBLE
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

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/weather.csv"
INTO TABLE weather
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/station.csv"
INTO TABLE station
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;