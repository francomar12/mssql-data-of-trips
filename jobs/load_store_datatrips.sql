/****** Object:  Job [load_store_datatrips]    Script Date: 17/10/2021 12:36:43 a. m. ******/
USE [msdb]
GO

BEGIN TRANSACTION
	DECLARE @ReturnCode INT
	SELECT @ReturnCode = 0
	/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 17/10/2021 12:36:43 a. m. ******/
	IF NOT EXISTS (SELECT	name 
				   FROM		msdb.dbo.syscategories 
				   WHERE	name=N'[Uncategorized (Local)]' AND category_class=1)
	BEGIN
		EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
		IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
	END

	DECLARE @jobId BINARY(16)
	EXEC	@ReturnCode =  msdb.dbo.sp_add_job @job_name=N'load_store_datatrips', 
			@enabled=1, 
			@notify_level_eventlog=0, 
			@notify_level_email=0, 
			@notify_level_netsend=0, 
			@notify_level_page=0, 
			@delete_level=0, 
			@description=N'Job for loading, storing data information about trips and moving processed files', 
			@category_name=N'[Uncategorized (Local)]', 
			@owner_login_name=N'sa', 
			@job_id = @jobId OUTPUT
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

	/****** Object:  Step [Load Data]    Script Date: 17/10/2021 12:36:43 a. m. ******/
	EXEC	@ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Data', 
			@step_id=1, 
			@cmdexec_success_code=0, 
			@on_success_action=4, 
			@on_success_step_id=2, 
			@on_fail_action=4, 
			@on_fail_step_id=5, 
			@retry_attempts=0, 
			@retry_interval=0, 
			@os_run_priority=0, @subsystem=N'TSQL', 
			@command=N'BULK INSERT data_trips.stg.datatrips
					   FROM ''C:\\PanchoPro\\Challenge\\mssql-data-of-trips\\mssql\not_processed_files\\trips.csv''
					   WITH (FORMAT = ''CSV''
							 , FIRSTROW=2
							 , FIELDQUOTE = ''\''
							 , FIELDTERMINATOR = '',''
							 , ROWTERMINATOR = ''0x0a'')
					   GO', 
			@database_name=N'data_trips', 
			@flags=0
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

	/****** Object:  Step [Move Files]    Script Date: 17/10/2021 12:36:43 a. m. ******/
	EXEC	@ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Move Files', 
			@step_id=2, 
			@cmdexec_success_code=0, 
			@on_success_action=4, 
			@on_success_step_id=3, 
			@on_fail_action=4, 
			@on_fail_step_id=5, 
			@retry_attempts=0, 
			@retry_interval=0, 
			@os_run_priority=0, @subsystem=N'CmdExec', 
			@command=N'move C:\PanchoPro\Challenge\mssql-data-of-trips\mssql\not_processed_files\trips.csv C:\PanchoPro\Challenge\mssql-data-of-trips\mssql\processed_files\', 
			@flags=0
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

	/****** Object:  Step [Transfer Data from Staging to Production]    Script Date: 17/10/2021 12:36:43 a. m. ******/
	EXEC	@ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Transfer Data from Staging to Production', 
			@step_id=3, 
			@cmdexec_success_code=0, 
			@on_success_action=4, 
			@on_success_step_id=4, 
			@on_fail_action=4, 
			@on_fail_step_id=5, 
			@retry_attempts=0, 
			@retry_interval=0, 
			@os_run_priority=0, @subsystem=N'TSQL', 
			@command=N'INSERT INTO 	data_trips.dbo.datatrips
					   SELECT 		*
					   FROM			data_trips.stg.datatrips;
					   DELETE
					   FROM		data_trips.stg.datatrips;', 
			@database_name=N'data_trips', 
			@flags=0
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

	/****** Object:  Step [Sending Ok Status by Email]    Script Date: 17/10/2021 12:36:43 a. m. ******/
	EXEC	@ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Sending Ok Status by Email', 
			@step_id=4, 
			@cmdexec_success_code=0, 
			@on_success_action=1, 
			@on_success_step_id=0, 
			@on_fail_action=2, 
			@on_fail_step_id=0, 
			@retry_attempts=0, 
			@retry_interval=0, 
			@os_run_priority=0, @subsystem=N'TSQL', 
			@command=N'SET NOCOUNT ON
					   DECLARE @RowCount AS int 
					   DECLARE @EmailBody AS varchar(1000)

					   SELECT	@RowCount = COUNT(*) 
					   FROM		data_trips.dbo.datatrips

					   SET @EmailBody = ''Successfully Production '' + cast(@RowCount as varchar(50)) + '' Records Loaded''

					  IF @@rowcount > 0
					  BEGIN
						exec msdb.dbo.sp_send_dbmail
						@profile_name = ''default'', 
						@recipients   = ''francomar12@hotmail.com'', 
						@subject      = ''The procedure for loading data and moving the files processed finished successfully.'', 
						@body         = @EmailBody,
						@body_format  = ''text''
					  END', 
			@database_name=N'tempdb', 
			@flags=0
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

	/****** Object:  Step [Sending Error Status by Email]    Script Date: 17/10/2021 12:36:43 a. m. ******/
	EXEC	@ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Sending Error Status by Email', 
			@step_id=5, 
			@cmdexec_success_code=0, 
			@on_success_action=1, 
			@on_success_step_id=0, 
			@on_fail_action=2, 
			@on_fail_step_id=0, 
			@retry_attempts=0, 
			@retry_interval=0, 
			@os_run_priority=0, @subsystem=N'TSQL', 
			@command=N'EXEC msdb.dbo.sp_send_dbmail  
					   @profile_name = ''default'',  
					   @recipients   = ''francomar12@hotmail.com'',  
					   @body         = ''The procedure for loading data or moving the files finished with errors.'',  
					   @subject      = ''Automated Message'' ;', 
			@database_name=N'master', 
			@flags=0
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

	EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

	EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
	IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


