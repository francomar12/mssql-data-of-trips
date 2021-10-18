echo execute job
sqlcmd -S "SERVER_NAME" -Q "execute msdb.dbo.sp_start_job @job_name='load_store_datatrips'" -o C:\mssql-data-of-trips\output.txt

if errorlevel 1 exit/b

echo job execution completed