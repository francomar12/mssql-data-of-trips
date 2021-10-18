/************************************************************************************************ 
Object:			Table [dbo].[datatrips]                                             
Script Date:		17/10/2021 04:45 p. m.											
Created/Updated:	francomar12																
Description:		Script of creation of the table on the correspondent prod schema			                                                     
************************************************************************************************/
USE [data_trips]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[datatrips](
	[region] [varchar](50) NOT NULL,
	[origin_coord] [varchar](100) NULL,
	[destin_coord] [nvarchar](100) NULL,
	[datetime] [datetime] NOT NULL,
	[data_source] [nvarchar](50) NULL
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The region of the trip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'datatrips', @level2type=N'COLUMN',@level2name=N'region'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Point of origin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'datatrips', @level2type=N'COLUMN',@level2name=N'origin_coord'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Point of destination' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'datatrips', @level2type=N'COLUMN',@level2name=N'destin_coord'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date of the trip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'datatrips', @level2type=N'COLUMN',@level2name=N'datetime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of vehicles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'datatrips', @level2type=N'COLUMN',@level2name=N'data_source'
GO


