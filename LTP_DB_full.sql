USE [master]
GO
/****** Object:  Database [LTP_Project]    Script Date: 12/21/2018 12:42:08 AM ******/
CREATE DATABASE [LTP_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LTP_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LTP_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LTP_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LTP_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LTP_Project] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LTP_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LTP_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LTP_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LTP_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LTP_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LTP_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [LTP_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LTP_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LTP_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LTP_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LTP_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LTP_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LTP_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LTP_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LTP_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LTP_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LTP_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LTP_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LTP_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LTP_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LTP_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LTP_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LTP_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LTP_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LTP_Project] SET  MULTI_USER 
GO
ALTER DATABASE [LTP_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LTP_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LTP_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LTP_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LTP_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LTP_Project] SET QUERY_STORE = OFF
GO
USE [LTP_Project]
GO
/****** Object:  User [dbTest]    Script Date: 12/21/2018 12:42:08 AM ******/
CREATE USER [dbTest] FOR LOGIN [dbTest] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbTest]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [dbTest]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [dbTest]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dbTest]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dbTest]
GO
/****** Object:  Table [dbo].[person]    Script Date: 12/21/2018 12:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[person_id] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[state_id] [int] NOT NULL,
	[gender] [char](1) NOT NULL,
	[dob] [datetime] NOT NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[states]    Script Date: 12/21/2018 12:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[states](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_code] [char](2) NOT NULL,
 CONSTRAINT [PK_states] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [FK_person_states] FOREIGN KEY([state_id])
REFERENCES [dbo].[states] ([state_id])
GO
ALTER TABLE [dbo].[person] CHECK CONSTRAINT [FK_person_states]
GO
/****** Object:  StoredProcedure [dbo].[employee_select]    Script Date: 12/21/2018 12:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[employee_select]
as
begin
select person_id,first_name from dbo.person;
end
GO
/****** Object:  StoredProcedure [dbo].[employee_update]    Script Date: 12/21/2018 12:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[employee_update]
	-- Add the parameters for the stored procedure here
	@First_name nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LTP_Project;

END
GO
/****** Object:  StoredProcedure [dbo].[person_update]    Script Date: 12/21/2018 12:42:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[person_update]
@personid int,
@first_name varchar(50),
@last_name varchar(50),
@state int,
@gender char(1),
@dob datetime
as
Begin
update dbo.person set
first_name=@first_name, 
last_name=@last_name,
state_id=@state,
gender=@gender,
dob=@dob
Where person_id = @personid;
End

GO
USE [master]
GO
ALTER DATABASE [LTP_Project] SET  READ_WRITE 
GO
