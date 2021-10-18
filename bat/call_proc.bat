echo execute job
sqlcmd -S "LAPTOP-EMG9UU6F" -Q "execute msdb.dbo.sp_start_job @job_name='load_store_datatrips'" -o C:\PanchoPro\Challenge\mssql-data-of-trips\mssql\output.txt

if errorlevel 1 exit/b

echo job execution completed