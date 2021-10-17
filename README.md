# mssql-data-of-trips
Assigment

The task is to build an automatic process to ingest data on an on-demand basis. The data
represents trips taken by different vehicles, and include a city, a point of origin and a destination.
A CSV file gives a small sample of the data the solution will have to handle. It would
be wonderful to have some visual reports of this data, but in order to do that, it is necessary to check the following
features.

1. There must be an automated process to ingest and store the data.
2. Trips with similar origin, destination, and time of day should be grouped together.
3. Develop a way to obtain the weekly average number of trips for an area, defined by a
bounding box (given by coordinates) or by a region.
4. Develop a way to inform the user about the status of the data ingestion without using a
polling solution.
5. The solution should be scalable to 100 million entries. It is encouraged to simplify the
data by a data model. Please add proof that the solution is scalable.
6. Use a SQL database.

In order to run this project

It is necessary install SQL Server 2019 Developer
  - See SQL Server Downloads on https://www.microsoft.com/en-us/sql-server/sql-server-downloads
  - Installed SQL Server 2019 Developer and created an server instance

Install SQL Server Management Studio
  - See the next link https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15
  - Create a new connection to the server instance
  - Once connected and execute the files
    - data_trips.sql (script for creating data_trips database) or create the database manually with this name by self
    - data_trips_stg_schema.sql
    - stg_datatrips.sql (script for creating datatrips table on the stg schema)
