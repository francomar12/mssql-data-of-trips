--2. Create a new account
-- A valid @email_addres, @replyto_address should be given
-- A valid @mailserver_name should be given
-- A valid @username and @password should be given
EXECUTE msdb.dbo.sysmail_add_account_sp 
@account_name = 'SQLEmails', 
@description = 'Account for Automated DBA Notifications', 
@email_address = 'test@gmail.com', 
@replyto_address = 'test@gmail.com', 
@display_name = 'SQL Email', 
@mailserver_name = 'smtp.gmail.com', 
@port = 587, 
@enable_ssl = 1, 
@username = 'test@gmail.com', 
@password = 'password' 
GO