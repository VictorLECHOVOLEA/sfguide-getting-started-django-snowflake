-- https://www.snowflake.com/wp-content/uploads/2022/03/Snowflake-The-Definitive-Guide-1.pdf
https://quickstarts.snowflake.com/guide/getting-started-django-snowflake/
SELECT CURRENT_ACCOUNT_NAME();
-- OJ25149

SELECT CURRENT_REGION();
-- OJ25149

USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;
CREATE OR REPLACE DATABASE DJANGO_DB;
USE SCHEMA PUBLIC;

-- Create a stage
create stage citibike_trips
    url = 's3://snowflake-workshop-lab/citibike-trips-csv/';

create or replace table trip
(trip_id integer autoincrement start 1 increment 1,
tripduration timestamp,
starttime timestamp,
stoptime timestamp,
start_station_id integer,
start_station_name string,
start_station_latitude float,
start_station_longitude float,
end_station_id integer,
end_station_name string,
end_station_latitude float,
end_station_longitude float,
bikeid integer,
membership_type string,
usertype string,
birth_year integer,
gender integer);


-- Define the target table and file format for data ingestion
create or replace file format csv type='csv'
  compression = 'auto' field_delimiter = ',' record_delimiter = '\n'
  skip_header = 0 field_optionally_enclosed_by = '\042' trim_space = false
  error_on_column_count_mismatch = false escape = 'none' escape_unenclosed_field = '\134'
  date_format = 'auto' timestamp_format = 'auto' null_if = ('')
  comment = 'file format for ingesting data into snowflake';


-- Copy data into the target table
copy into trip (tripduration, starttime, stoptime, start_station_id, start_station_name, start_station_latitude, start_station_longitude, end_station_id, end_station_name, end_station_latitude, end_station_longitude, bikeid, membership_type, usertype, birth_year, gender) from @citibike_trips file_format=csv PATTERN = '.*csv.*';