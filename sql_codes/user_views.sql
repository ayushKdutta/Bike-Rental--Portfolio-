-- Active: 1705558080201@@127.0.0.1@3306@bikerentals

/*Creating a view for number of users vs gender*/
CREATE OR REPLACE VIEW user_gender AS
SELECT gender, COUNT(user_id) AS number_of_users
FROM user 
GROUP BY gender
ORDER BY number_of_users DESC;

SELECT * FROM user_gender;


/* View of type of users and the gender of the users */
CREATE OR REPLACE VIEW usertype_gender AS
SELECT gender, 
    COUNT(CASE WHEN user_type = 'Subscriber' THEN 1 END) as subscribe_count,
    COUNT(CASE WHEN user_type = 'Customer' THEN 1 END) as customer_count
FROM user
GROUP BY gender;
SELECT * FROM usertype_gender;


/*View of the average age of subscribers and customers:*/
CREATE OR REPLACE VIEW avg_age_view AS 
SELECT 
    user_type, 
    AVG(YEAR(CURDATE()) - CAST(birth_year AS UNSIGNED)) AS avg_age 
FROM user
GROUP BY user_type;

SELECT * FROM avg_age_view;


/*View of the count of subscribers and customers by birth year:*/
CREATE VIEW count_by_birthyear_view AS 
SELECT 
    birth_year, 
    user_type, 
    COUNT(*) as count 
FROM user 
GROUP BY birth_year, user_type;

SELECT * FROM count_by_birthyear_view;


/*View of the age distribution of subscribers and customers:*/
CREATE OR REPLACE VIEW age_distribution_view AS 
SELECT 
    user_type, 
    (YEAR(CURDATE()) - CAST(birth_year AS UNSIGNED)) AS age, 
    COUNT(*) as count 
FROM user 
GROUP BY age, user_type
ORDER BY count DESC;

SELECT * FROM age_distribution_view;

