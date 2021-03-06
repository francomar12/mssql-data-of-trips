/************************************************************************************************ 
Object:			Function [dbo].[get_wee_avg_trp_rgn]                                               
Script Date:		17/10/2021 09:46 p.m.										
Created/Updated:	francomar12																
Description:		Scalar-value Function to gets the weekly average number of trips for an area			                                                     
************************************************************************************************/
USE [data_trips]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[get_wee_avg_trp_rgn]
(
	-- Parameters for the function
	@origin text
)
RETURNS float
AS
BEGIN
	-- Return variable
	DECLARE @wee_avg_trp_rgn float;

	-- T-SQL statements to compute the return value
	SET @wee_avg_trp_rgn = (SELECT	AVG(trips) AS avg
	FROM	(
		SELECT	region, week, CAST(SUM(trips) AS DECIMAL(10, 2)) AS trips
		FROM	(
			SELECT	region, origin_coord, destin_coord, datetime, trips, DATEPART(WEEK, datetime) AS week
			FROM	dbo.group_datatrips AS trip
			WHERE	region like @origin) AS b
		GROUP BY region, week) AS c
	GROUP BY region)

	-- Return the result of the function
	RETURN @wee_avg_trp_rgn

END
