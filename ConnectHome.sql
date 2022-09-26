USE [master]
GO
/****** Object:  Database [ConnectHome]    Script Date: 26/09/2022 15:41:06 ******/
CREATE DATABASE [ConnectHome]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConnectHome', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ConnectHome.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConnectHome_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ConnectHome_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ConnectHome] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConnectHome].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConnectHome] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConnectHome] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConnectHome] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConnectHome] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConnectHome] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConnectHome] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConnectHome] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConnectHome] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConnectHome] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConnectHome] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConnectHome] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConnectHome] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConnectHome] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConnectHome] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConnectHome] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConnectHome] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConnectHome] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConnectHome] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConnectHome] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConnectHome] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConnectHome] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConnectHome] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConnectHome] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ConnectHome] SET  MULTI_USER 
GO
ALTER DATABASE [ConnectHome] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConnectHome] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConnectHome] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConnectHome] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConnectHome] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ConnectHome] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ConnectHome] SET QUERY_STORE = OFF
GO
USE [ConnectHome]
GO
/****** Object:  Table [dbo].[SSO_Acess]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_Acess](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[CPF] [varchar](20) NULL,
	[Company] [varchar](100) NULL,
	[Unity] [varchar](50) NULL,
	[GroupName] [varchar](150) NULL,
	[UserName] [varchar](50) NULL,
	[Passw] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[LockID] [bit] NULL,
	[IDGroup] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_Admin]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](200) NOT NULL,
	[Usuario] [varchar](30) NOT NULL,
	[Senha] [varchar](30) NOT NULL,
	[Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_Anotacoes]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_Anotacoes](
	[UserId] [int] NOT NULL,
	[FonteSize] [int] NOT NULL,
	[Texto] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_DesktopApps]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_DesktopApps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Path] [varchar](100) NULL,
	[ProcessName] [varchar](100) NULL,
	[Icon] [varchar](50) NULL,
	[IconColor] [varchar](50) NULL,
	[Command] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_Evidences]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_Evidences](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Print] [varbinary](max) NULL,
	[HostName] [varchar](30) NULL,
	[UserNameMachine] [varchar](50) NULL,
	[CPF] [varchar](20) NULL,
	[DatetimeInsert] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_Groups]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Responsible] [int] NOT NULL,
	[DateInsert] [datetime] NULL,
	[LastModification] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_GroupsxDesktopApps]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_GroupsxDesktopApps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDDesktopApp] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[Responsible] [int] NOT NULL,
	[DateInsert] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_GroupsxMaterials]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_GroupsxMaterials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDMaterial] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[Responsible] [int] NOT NULL,
	[DateInsert] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_GroupsxSystems]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_GroupsxSystems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSystem] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[Responsible] [int] NOT NULL,
	[DateInsert] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_GroupsxWebSites]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_GroupsxWebSites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWebSite] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[Responsible] [int] NOT NULL,
	[DateInsert] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_LoginLogout]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_LoginLogout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](100) NULL,
	[Company] [varchar](100) NULL,
	[Unity] [varchar](50) NULL,
	[DatetimeInsert] [datetime] NULL,
	[Event] [varchar](10) NULL,
	[Hostname] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_Materiais]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_Materiais](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Icon] [varchar](50) NULL,
	[IconColor] [varchar](50) NULL,
	[Browser] [varchar](20) NULL,
	[URL] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_PermissionUsers]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_PermissionUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](20) NULL,
	[Company] [varchar](100) NULL,
	[Unity] [varchar](50) NULL,
	[Permission] [varchar](50) NULL,
	[DatetimeInsert] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_Prints]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_Prints](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Image] [varbinary](max) NULL,
	[InsertDate] [datetime] NULL,
	[MachineName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_RequestsParams]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_RequestsParams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSystem] [int] NOT NULL,
	[Method] [varchar](10) NOT NULL,
	[ContainsInUrl] [varchar](200) NOT NULL,
	[Param] [varchar](50) NOT NULL,
	[IsJson] [bit] NOT NULL,
	[Split] [varchar](10) NULL,
	[SplitIndex] [int] NULL,
	[PathJson] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_RequestsResults]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_RequestsResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDAcess] [int] NULL,
	[HostName] [varchar](30) NOT NULL,
	[IDRequestParams] [int] NOT NULL,
	[Result] [varchar](200) NOT NULL,
	[DateInsert] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_Systems]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_Systems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[URL] [varchar](300) NULL,
	[Icon] [varchar](50) NULL,
	[IconColor] [varchar](50) NULL,
	[Browser] [varchar](20) NULL,
	[SystemGroup] [varchar](100) NULL,
	[ErrorURL] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_UserSystems]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_UserSystems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](20) NULL,
	[User] [varchar](100) NULL,
	[Passw] [varchar](100) NULL,
	[IDSystem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_WebSites]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_WebSites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CPF] [varchar](20) NULL,
	[Name] [varchar](100) NULL,
	[Icon] [varchar](50) NULL,
	[IconColor] [varchar](50) NULL,
	[Browser] [varchar](20) NULL,
	[URL] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_WindowsProgramsElements]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_WindowsProgramsElements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWindowsPrograms] [int] NULL,
	[Type] [varchar](30) NULL,
	[Parent] [varchar](100) NULL,
	[AppElement] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSO_WindowsProgramsTitles]    Script Date: 26/09/2022 15:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSO_WindowsProgramsTitles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWindowsPrograms] [int] NULL,
	[Title] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SSO_Evidences] ADD  DEFAULT (getdate()) FOR [DatetimeInsert]
GO
ALTER TABLE [dbo].[SSO_Groups] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[SSO_Groups] ADD  DEFAULT (getdate()) FOR [LastModification]
GO
ALTER TABLE [dbo].[SSO_GroupsxDesktopApps] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[SSO_GroupsxMaterials] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[SSO_GroupsxSystems] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[SSO_GroupsxWebSites] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[SSO_LoginLogout] ADD  DEFAULT (getdate()) FOR [DatetimeInsert]
GO
ALTER TABLE [dbo].[SSO_PermissionUsers] ADD  DEFAULT (getdate()) FOR [DatetimeInsert]
GO
ALTER TABLE [dbo].[SSO_Prints] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[SSO_RequestsResults] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
USE [master]
GO
ALTER DATABASE [ConnectHome] SET  READ_WRITE 
GO
