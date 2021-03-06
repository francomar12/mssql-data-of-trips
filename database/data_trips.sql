/************************************************************************************************ 
Object:			Database [data_trips]                                              
Script Date:		17/10/2021 04:16 p. m.										
Created/Updated:	francomar12																
Description:		Script use to create the database			                                                     
************************************************************************************************/
USE [master]
GO

CREATE DATABASE [data_trips]
	CONTAINMENT = NONE
	ON  PRIMARY 
	( NAME = N'data_trips', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\data_trips.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
	LOG ON 
	( NAME = N'data_trips_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\data_trips_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
	WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
	BEGIN
		EXEC [data_trips].[dbo].[sp_fulltext_database] @action = 'enable'
	END
GO

ALTER DATABASE [data_trips] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [data_trips] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [data_trips] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [data_trips] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [data_trips] SET ARITHABORT OFF 
GO

ALTER DATABASE [data_trips] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [data_trips] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [data_trips] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [data_trips] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [data_trips] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [data_trips] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [data_trips] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [data_trips] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [data_trips] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [data_trips] SET  DISABLE_BROKER 
GO

ALTER DATABASE [data_trips] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [data_trips] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [data_trips] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [data_trips] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [data_trips] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [data_trips] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [data_trips] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [data_trips] SET RECOVERY FULL 
GO

ALTER DATABASE [data_trips] SET  MULTI_USER 
GO

ALTER DATABASE [data_trips] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [data_trips] SET DB_CHAINING OFF 
GO

ALTER DATABASE [data_trips] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [data_trips] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [data_trips] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [data_trips] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [data_trips] SET QUERY_STORE = OFF
GO

ALTER DATABASE [data_trips] SET  READ_WRITE 
GO