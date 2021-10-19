/************************************************************************************************ 
Object:			View [dbo].[group_datatrips]                                              
Script Date:		17/10/2021 04:36 p. m.											
Created/Updated:	francomar12																
Description:		Script of creationg of the view that groups similar trips                                                  
************************************************************************************************/

USE [data_trips]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[group_datatrips]
AS
SELECT	region, origin_coord, destin_coord, datetime, COUNT(1) AS trips
FROM	dbo.datatrips
GROUP BY region, origin_coord, destin_coord, datetime
GO