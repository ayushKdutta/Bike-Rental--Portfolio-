-- Active: 1705558080201@@127.0.0.1@3306@bikerentals

/*Average trip duration*/
CREATE OR REPLACE VIEW avg_trip_duration AS
SELECT user_id, AVG(trip_duration) AS avg_trip_duration
FROM trip
GROUP BY user_id
ORDER BY avg_trip_duration DESC;

SELECT * FROM avg_trip_duration;


/*Trips made per bike id*/
CREATE OR REPLACE VIEW trips_made_per_bike AS
SELECT bike_id, COUNT(*) AS trip_count
FROM trip
GROUP BY bike_id
ORDER BY trip_count DESC;

SELECT * FROM trips_made_per_bike;


/*Trips per station */
CREATE OR REPLACE VIEW trips_per_station_view AS 
SELECT 
    start_station_id, station_name, 
    COUNT(*) as trip_count 
FROM trip 
INNER JOIN station
ON trip.start_station_id = station.station_id
GROUP BY start_station_id
UNION ALL
SELECT 
    end_station_id, station_name,  
    COUNT(*) as trip_count 
FROM trip 
INNER JOIN station
ON trip.end_station_id = station.station_id
GROUP BY end_station_id;


/*View giving us the station name having maximum number of trips*/
CREATE OR REPLACE VIEW max_trip_station_view AS
SELECT station_name FROM trips_per_station_view
WHERE trip_count = (SELECT MAX(trip_count) FROM trips_per_station_view);

/*View giving the info on peak hours*/
CREATE OR REPLACE VIEW peak_hours_view AS
SELECT 
    HOUR(start_time) as start_hour,
    COUNT(*) as trip_count
FROM trip
GROUP BY start_hour
ORDER BY trip_count DESC;

SELECT * FROM peak_hours_view;