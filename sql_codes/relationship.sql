-- Active: 1705558080201@@127.0.0.1@3306@bikerentals

-- setting primary key for user table
ALTER TABLE user ADD CONSTRAINT PRIMARY KEY (user_id);


-- setting primary key for station table
ALTER TABLE station ADD CONSTRAINT PRIMARY KEY (station_id);

-- setting primary key for bike table
ALTER TABLE bike ADD CONSTRAINT PRIMARY KEY (bike_id);


-- setting primary key for trip table
ALTER TABLE trip ADD CONSTRAINT PRIMARY KEY (trip_id);


-- adding foreign key constraints
ALTER TABLE trip ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE trip ADD CONSTRAINT FOREIGN KEY (bike_id) REFERENCES bike(bike_id);
ALTER TABLE trip ADD CONSTRAINT FOREIGN KEY (start_station_id) REFERENCES station(station_id);

