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

Preparing enviroment for an automated process
  - Once connected to the database server execute the files
    - data_trips.sql (script for creating data_trips database or create the database manually with this name by your self)
    - data_trips_stg_schema.sql (script for creating the stg schema
    - stg_datatrips.sql (script for creating datatrips table on the stg schema)

Status Notification

To avoid the use of a polling solution and have knowledge about how many record were processed with the process, the solution is uses
the functionality of Database Mail incorporated in SQL Server.

	The files to configure the functionality are located on conf/mail

	- 1_enabling_db_mail.sql
	- 2_creating_a_new_account.sql
	- 3_creating_a_new_profile.sql
	- 4_adding_the_dbmail_account_to_the_dbmail_profile.sql
	- 5_adding_the_account_to_the_profile.sql

Scalability

SQL Server has some specifications about capacity. Check this article related to
    - https://docs.microsoft.com/en-us/sql/sql-server/maximum-capacity-specifications-for-sql-server?view=sql-server-ver15
Notice that the rows per table are limited by available storage. The solution is able to handle more than 100 million of entries.

However, if there is doubth about the automated process, the process is not for loading a unique file that contains that amount of records.
The process is going to work processing several files containing records, by region, date, data_source, user (for example), which make
possible handle an incremental count of records on-demand basis.
