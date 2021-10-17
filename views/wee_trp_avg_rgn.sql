/****** Object:  View [dbo].[avg_rgn_trp_wee]    Script Date: 17/10/2021 12:54:45 a. m. ******/
USE [data_trips]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[wee_trp_avg_rgn]
AS
	SELECT	 region, AVG(trips) AS avg
	FROM     (SELECT	region, week, CAST(COUNT(1) AS DECIMAL(10, 2)) AS trips
			  FROM		(SELECT	region, origin_coord, destin_coord, datetime, data_source, DATEPART(WEEK, datetime) AS week
						 FROM	dbo.datatrips AS trip) AS b
              GROUP BY region, week) AS c
	GROUP BY region
GO