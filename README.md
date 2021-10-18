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
    
    Database folder
    - data_trips.sql (script for creating data_trips database or create the database manually with this name by your self)

    Schema folder
    - data_trips_stg_schema.sql (script for creating the stg schema

    Tables folder
    - stg_datatrips.sql (script for creating datatrips table on the stg schema)

Loading data into the database

After the structure of the database created, it can proceed with the creation of the process for ingestion data. In this case, the
functionality of SQL Server Jobs is used. So, in the context of create the process one job is needed. This job load the data from files
located in one directory (not_processed_files), move the processed files to another directory (processed_files), count records processed,
sent a mail with this information to an email account.

  - Looking for complete this, execute the script for created the job

    Jobs folder
    - load_store_datatrips.sql

NOTE: notice that the processed will get executed correctly if the topic about Status Notification is completed.

In the context of this solution, an Application should be developed to test the ingestion of data, the notifications and the function to
get the weekly average. For time issues, only considerations were made. One faster solution is run a cmd command or execute a bat file
to run the job of the database server.

    Bat folder
    - call_proc.bat

NOTE: be sure of change the value of the server name and the path for the output file.

Working with the data

To get information about the weekly average number of trips for an area, it is possible to work on many ways.

First at all, a view is created, the view gets the region values with his weekly average of trips.
  - In order to create the view exec the correspondent script
    
    Views folder
    - wee_trp_avg_rgn.sql

  - Using several tools the user can call a SELECT clause over that view and filter the wished region to look up the value of the average.

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
