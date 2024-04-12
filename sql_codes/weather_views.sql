-- Active: 1705558080201@@127.0.0.1@3306@bikerentals
/*Number of trips / temperature range */
CREATE OR REPLACE VIEW trips_per_temperature_range_view AS 
SELECT 
    CASE 
        WHEN TAVG BETWEEN 8 AND 18 THEN '8 to 18'
        WHEN TAVG BETWEEN 19 AND 29 THEN '19 to 29'
        WHEN TAVG BETWEEN 30 AND 40 THEN '30 to 40'
        WHEN TAVG BETWEEN 41 AND 50 THEN '41 to 50'
        WHEN TAVG BETWEEN 51 AND 60 THEN '51 to 60'
        WHEN TAVG BETWEEN 61 AND 70 THEN '61 to 70'
        ELSE '70+'
    END as temperature_range, 
    COUNT(*) as trip_count 
FROM trip 
JOIN weather ON DATE(trip.start_time) = weather.date
GROUP BY temperature_range
ORDER BY trip_count desc;

SELECT * FROM trips_per_temperature_range_view;

/* Average trip duration per temperature_range */
CREATE OR REPLACE VIEW avg_trip_duration_per_temperature_range_view AS 
SELECT 
    CASE 
        WHEN TAVG BETWEEN 8 AND 18 THEN '8 to 18'
        WHEN TAVG BETWEEN 19 AND 29 THEN '19 to 29'
        WHEN TAVG BETWEEN 30 AND 40 THEN '30 to 40'
        WHEN TAVG BETWEEN 41 AND 50 THEN '41 to 50'
        WHEN TAVG BETWEEN 51 AND 60 THEN '51 to 60'
        WHEN TAVG BETWEEN 61 AND 70 THEN '61 to 70'
        ELSE '70+'
    END as temperature_range, 
    AVG(trip_duration) as avg_trip_duration
FROM trip 
JOIN weather ON DATE(trip.start_time) = weather.date
GROUP BY temperature_range
ORDER BY avg_trip_duration desc;

SELECT * FROM avg_trip_duration_per_temperature_range_view;


/* Number of trips per day */
CREATE OR REPLACE VIEW trips_per_day_view AS 
SELECT 
    DATE(trip.start_time) as trip_date, 
    COUNT(*) as trip_count,
    TAVG as avg_temperature 
FROM trip 
JOIN weather ON DATE(trip.start_time) = weather.date
GROUP BY trip_date, TAVG;

SELECT * FROM trips_per_day_view;