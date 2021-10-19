/************************************************************************************************ 
Object:			Table [dbo].[loaded_files]                                             
Script Date:		18/10/2021 09:19 p. m.											
Created/Updated:	francomar12																
Description:		Script of creation of the table on the correspondent dbo schema, this should
					be store data of files processed
************************************************************************************************/
USE [data_trips]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[loaded_files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [varchar](100) NOT NULL,
	[proc_records] [int] NULL,
	[load_dt_ini] [datetime] NULL,
	[load_dt_end] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
