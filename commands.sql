create
or replace table django_db.public.trip (
    trip_id integer autoincrement start 1 increment 1,
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
    gender integer
);
create
or replace file format csv type = 'csv' compression = 'auto' field_delimiter = ',' record_delimiter = '\n' skip_header = 0 field_optionally_enclosed_by = '\042' trim_space = false error_on_column_count_mismatch = false escape = 'none' escape_unenclosed_field = '\134' date_format = 'auto' timestamp_format = 'auto' null_if = ('') comment = 'file format for ingesting data into snowflake';


copy into django_db.public.trip (
    tripduration, 
    starttime, 
    stoptime, 
    start_station_id, 
    start_station_name, 
    start_station_latitude, 
    start_station_longitude, 
    end_station_id, 
    end_station_name, 
    end_station_latitude, 
    end_station_longitude, 
    bikeid, 
    membership_type, 
    usertype, 
    birth_year, 
    gender) 
    from @citibike_trips file_format=csv PATTERN = '.*csv.*';