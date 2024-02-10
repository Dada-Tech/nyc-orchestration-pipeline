# Homework 3 - Data Warehouse
David Dada

SELECT * FROM `hopeful-machine-405721.trips_data_all.external_green_taxi_2022` LIMIT 10;

SELECT TIMESTAMP_MILLIS(CAST(SUBSTR(CAST(lpep_pickup_datetime AS STRING), 1, 13) AS INT64)) AS datetime_column
FROM `hopeful-machine-405721.trips_data_all.external_green_taxi_2022` LIMIT 10;

-- UPDATE `trips_data_all.green_taxi_2022`
-- SET lpep_pickup_datetime = TIMESTAMP_MILLIS(CAST(SUBSTR(CAST(lpep_pickup_datetime AS STRING), 1, 13) AS INT64))

SELECT COUNT(DISTINCT PULocationID)
FROM `hopeful-machine-405721.trips_data_all.external_green_taxi_2022`;

SELECT COUNT(DISTINCT PULocationID)
FROM `hopeful-machine-405721.trips_data_all.green_taxi_2022`;

SELECT COUNT(*)
FROM `hopeful-machine-405721.trips_data_all.external_green_taxi_2022`
WHERE fare_amount = 0;

-- create external table
CREATE OR REPLACE EXTERNAL TABLE `trips_data_all.external_green_taxi_2022`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://data_tech_main_bucket_hopeful-machine-405721/trips_data_all']
);

-- create table from external table
CREATE OR REPLACE TABLE `trips_data_all.green_taxi_2022` AS
SELECT * FROM `trips_data_all.external_green_taxi_2022`;

-- create partitioned/clustered table from external table
CREATE OR REPLACE TABLE `trips_data_all.green_taxi_2022_partitioned_clustered`
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID
AS
SELECT * FROM `trips_data_all.external_green_taxi_2022`;

SELECT DISTINCT PULocationID, 
FROM `trips_data_all.green_taxi_2022`
WHERE TIMESTAMP_MILLIS(CAST(SUBSTR(CAST(lpep_pickup_datetime AS STRING), 1, 13) AS INT64)) >= TIMESTAMP('2022-06-01')
  AND TIMESTAMP_MILLIS(CAST(SUBSTR(CAST(lpep_pickup_datetime AS STRING), 1, 13) AS INT64)) <= TIMESTAMP('2022-06-30');