# Bike Rental Data Management Project

### What's in this project?
In this project, I have tried to clean, modify and prepare the database required for the analysis of the data by Data Analysts. The scenario of this project is that : *A bike rental company has asked you to create a database to help their analysts understand the effects of weather on bike rentals*

### What type of data was available
The data source for this project is citibike ridership (kraggle). The datasets were available in csv format. We had bike rental data csv files and weather data csv files.
- ##### rental data
columns: 
- trip duration
- start time
- end time
- start station id
- start station name
- start station latitude
- start station longitude
- end station id
- end station name
- end station latitude
- end station longitude
- bike id
- user type
- birth year
- gender
- ##### weather data
columns: 
- station id
- station name
- date
- weather details (eg, average temperature, etc)

### Cleaning of the datasets

#### Rental Dataset
- First thing was to identify the percentage of missing data in both of the datasets.
- It was found that percentage of missing data in each dataset is less than 60%. So I eliminated the idea of removing the rows with missing data.
- *birth_year* column's data type was float. So I changed the data type to string.
- On analysis it was found that *birth_year* column has the highest number of missing data in the dataset. So I used **multiple imputation** for filling the missing values (As birth year might be neccessary for analysis that requires the age of the person/user)
- The next column was *user_type* which had missing values. The distinct values in this column were 'Subcriber' and 'Customer'. So it was safe to populate the missing values by the mode of the values present in other rows of user_type columns.
- The next issue was with the *gender* column as the values were in integer format i.e., 0: unknown, 1:male, 2:female. So, it might resulted in some confusion while doing analysis. So I created a new column *gender_info* where I populated each rows with strings of the gender eg., 'male', 'female' and so forth.
- The *start time* and *end time* columns were of string datatype. I converted those columns to datetime format, so that it will be easier for the Analysts to do any analysis based on the dates without having to bother about the conversion from string to date formats.

#### Weather Dataset
- weather dataset had missing values in weather details columns. And entire column had missing values. So, it was better to populate those missing values with 0 as the datatype of the columns were float.

### Normalizing the datasets

The rental detaset has too many columns so I decided to break that into seprate tables.

The columns got divided into these separate tables:

![Image of the complete normalization process](https://github.com/ayushKdutta/Bike-Rental--Portfolio-/blob/main/project_data_mapping.png)

### Creating the schema and database

- After normalization, I used MYSQL workbench and VScode to prepare the schema and database for the above mentioned tables(*SQL commands used are in sql_codes/data_create.sql file*).
- Primary key and Foreign key relationships were added after the data from csv files were imported. (*The codes used for creating the schema is in sql_codes/relationship.sql file*)

### Creating Views for the Analysis

#### User table views:
- **user_gender** view is prepared which gives us the data related to the number of users of each gender. This can be helpful in knowing who are our customers and who can be our potential customers (Male or Female).
- **usertype_gender** view is prepared which gives the information about count each of the user_type for each genders. We can get to know that what gender has what subscription plan.
- **avg_age_view** this is prepared to calculate the average age of users in each of the user types (subscription plans).
- **age_distribution_view** is prepared to get the info on how the age is distributed among the two user types.

#### Trip table views:
- **avg_trip_duration** to see the average time duration of the trips for each of the user.
- **trips_made_per_bike** to see the number of trips made for each bike id.
- **trips_per_station** to know the count of the trips that started and ended at a given station.
- **max_trip_station_name** gives the station name for the station that has maximum number of trips.
- **peak_hours_view** to see which hour of the day the count of trips is maximum/minimum.

#### Weather views:
- **trips_per_temperature** to see the number of trips made per temperature range(using joins).
- **avg_trip_duration_per_temp_range** to see the average of the trip duration made under each of the temperature rages.
- **trips_per_day** to see the number of trips made per day and what was the tempearture during that day.

### Conclusion(What I learned?)
- Cleaning the data and make it more sensible using pandas.
- Normalisation concept applied.
- Using MYSQL workbench.
- Designing of schema and databases.
- Creating Views.
- Using aggregate functions, joins and window functions.

