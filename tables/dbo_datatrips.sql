/****** Object:  Table [stg].[datatrips]    Script Date: 16/10/2021 11:42:22 p. m. ******/
/****** Comments: Using the correspondent database and schema the table is created ******/
USE [data_trips]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[datatrips](
	[region] [varchar](50) NULL,
	[origin_coord] [varchar](100) NULL,
	[destin_coord] [nvarchar](100) NULL,
	[datetime] [datetime] NULL,
	[data_source] [nvarchar](50) NULL
) ON [PRIMARY]
GO


