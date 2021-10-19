--5. Add account to profile
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp   
@profile_name = 'default',   
@account_name = 'SQLEmails',   
@sequence_number = 1;  