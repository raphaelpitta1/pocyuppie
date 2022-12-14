USE [master]
GO
/****** Object:  Database [ConnectHome]    Script Date: 28/09/2022 09:45:29 ******/
CREATE DATABASE [ConnectHome]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConnectHome', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ConnectHome.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConnectHome_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ConnectHome_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [ConnectHome] SET QUERY_STORE = OFF
GO
USE [ConnectHome]
GO
/****** Object:  Table [dbo].[CH_Acess]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Acess](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[CPF] [varchar](20) NULL,
	[Company] [varchar](100) NULL,
	[Unity] [varchar](50) NULL,
	[GroupName] [varchar](150) NULL,
	[UserName] [varchar](50) NULL,
	[Passw] [nvarchar](100) NULL,
	[Type] [varchar](50) NULL,
	[LockID] [bit] NULL,
	[IDGroup] [int] NULL,
	[Blocked] [bit] NULL,
	[Deleted] [bit] NULL,
	[ChangePassw] [bit] NULL,
	[LastChangePassw] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Admin]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](200) NOT NULL,
	[Usuario] [varchar](30) NOT NULL,
	[Senha] [varchar](30) NOT NULL,
	[Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Anotacoes]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Anotacoes](
	[UserId] [int] NOT NULL,
	[FonteSize] [int] NOT NULL,
	[Texto] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_DesktopApps]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_DesktopApps](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_DesktopAppsElements]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_DesktopAppsElements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](30) NULL,
	[Parent] [varchar](100) NULL,
	[AppElement] [varchar](100) NULL,
	[IDDesktopApp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_DesktopAppsTitles]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_DesktopAppsTitles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[IDDesktopApp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Evidences]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Evidences](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Print] [varbinary](max) NULL,
	[HostName] [varchar](30) NULL,
	[UserNameMachine] [varchar](50) NULL,
	[DatetimeInsert] [datetime] NULL,
	[IDAcess] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Groups]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[DateInsert] [datetime] NULL,
	[LastModification] [datetime] NULL,
	[IDAcessResponsible] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_GroupsxDesktopApps]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_GroupsxDesktopApps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDDesktopApp] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[DateInsert] [datetime] NOT NULL,
	[IDAcessResponsible] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_GroupsxMaterials]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_GroupsxMaterials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDMaterial] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[DateInsert] [datetime] NOT NULL,
	[IDAcessResponsible] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_GroupsxSystems]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_GroupsxSystems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSystem] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[DateInsert] [datetime] NOT NULL,
	[IDAcessResponsible] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_GroupsxWebSites]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_GroupsxWebSites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWebSite] [int] NOT NULL,
	[IDGroup] [int] NOT NULL,
	[DateInsert] [datetime] NOT NULL,
	[IDAcessResponsible] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_LoginLogout]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_LoginLogout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DatetimeInsert] [datetime] NULL,
	[Event] [varchar](10) NULL,
	[Hostname] [varchar](30) NULL,
	[IDAcess] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Materiais]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Materiais](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Icon] [varchar](50) NULL,
	[IconColor] [varchar](50) NULL,
	[Browser] [varchar](20) NULL,
	[URL] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_RequestsParams]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_RequestsParams](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_RequestsResults]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_RequestsResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDAcess] [int] NULL,
	[HostName] [varchar](30) NOT NULL,
	[IDRequestParams] [int] NOT NULL,
	[Result] [varchar](200) NOT NULL,
	[DateInsert] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Systems]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Systems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[URL] [varchar](300) NULL,
	[Icon] [varchar](50) NULL,
	[IconColor] [varchar](50) NULL,
	[Browser] [varchar](20) NULL,
	[SystemGroup] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_UserSystems]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_UserSystems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User] [varchar](100) NULL,
	[Passw] [varchar](100) NULL,
	[IDSystem] [int] NULL,
	[IDAcess] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_WebSites]    Script Date: 28/09/2022 09:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_WebSites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Icon] [varchar](50) NULL,
	[IconColor] [varchar](50) NULL,
	[Browser] [varchar](20) NULL,
	[URL] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CH_Acess] ON 

INSERT [dbo].[CH_Acess] ([ID], [Name], [CPF], [Company], [Unity], [GroupName], [UserName], [Passw], [Type], [LockID], [IDGroup], [Blocked], [Deleted], [ChangePassw], [LastChangePassw]) VALUES (2, N'Mateus Dazzi Branquinho', N'44614387837', N'Yuppie', N'1', N'Desenvolvimento Corporativo', N'mateus.dazzi', N'3e+JmJdlf2ENV5JnhBOksv5ZDSk912Z8JepL8OCgnVA=', N'', 0, 2, 0, 0, 0, CAST(N'2022-09-28T08:59:13.540' AS DateTime))
SET IDENTITY_INSERT [dbo].[CH_Acess] OFF
GO
INSERT [dbo].[CH_Anotacoes] ([UserId], [FonteSize], [Texto]) VALUES (2, 14, N'1
2
3
')
GO
SET IDENTITY_INSERT [dbo].[CH_DesktopApps] ON 

INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (1, N'Gerenciador de tarefas', N'C:\WINDOWS\system32\Taskmgr.exe', N'Taskmgr', N'DesktopMacDashboard', N'Black', N'@elevacao')
INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (2, N'Paint', N'xaml', N'', N'Palette', N'Black', N'')
INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (3, N'Calculadora', N'xaml', N'', N'Calculator', N'Black', N'')
INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (4, N'Anotações', N'xaml', N'', N'ClipboardTextOutline', N'Black', N'')
INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (5, N'Paint Windows', N'mspaint.exe', N'mspaint', N'Palette', N'Black', N'')
INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (6, N'Excel', N'C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE', N'EXCEL', N'MicrosoftExcel', N'Black', N'')
INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (7, N'Word', N'C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE', N'WINWORD', N'MicrosoftWord', N'Black', N'')
INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (8, N'PowerPoint', N'C:\Program Files\Microsoft Office\root\Office16\POWERPNT.EXE', N'POWERPNT', N'MicrosoftPowerpoint', N'Black', N'')
INSERT [dbo].[CH_DesktopApps] ([ID], [Name], [Path], [ProcessName], [Icon], [IconColor], [Command]) VALUES (9, N'Teams', N'C:\Users\%User%\AppData\Local\Microsoft\Teams\Update.exe', N'Teams', N'MicrosoftTeams', N'Black', N'--processStart "Teams.exe"')
SET IDENTITY_INSERT [dbo].[CH_DesktopApps] OFF
GO
SET IDENTITY_INSERT [dbo].[CH_Groups] ON 

INSERT [dbo].[CH_Groups] ([ID], [Name], [DateInsert], [LastModification], [IDAcessResponsible]) VALUES (2, N'Agibank N2', CAST(N'2022-09-13T16:21:00.000' AS DateTime), CAST(N'2022-09-13T16:21:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CH_Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[CH_GroupsxDesktopApps] ON 

INSERT [dbo].[CH_GroupsxDesktopApps] ([ID], [IDDesktopApp], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (1, 1, 2, CAST(N'2022-09-13T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxDesktopApps] ([ID], [IDDesktopApp], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (2, 3, 2, CAST(N'2022-09-13T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxDesktopApps] ([ID], [IDDesktopApp], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (3, 4, 2, CAST(N'2022-09-13T17:12:00.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxDesktopApps] ([ID], [IDDesktopApp], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (4, 5, 2, CAST(N'2022-09-13T17:12:00.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxDesktopApps] ([ID], [IDDesktopApp], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (5, 6, 2, CAST(N'2022-09-13T17:12:00.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxDesktopApps] ([ID], [IDDesktopApp], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (6, 7, 2, CAST(N'2022-09-13T17:12:00.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxDesktopApps] ([ID], [IDDesktopApp], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (10, 8, 2, CAST(N'2022-09-13T17:12:00.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxDesktopApps] ([ID], [IDDesktopApp], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (11, 9, 2, CAST(N'2022-09-13T17:12:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CH_GroupsxDesktopApps] OFF
GO
SET IDENTITY_INSERT [dbo].[CH_GroupsxSystems] ON 

INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (1, 1, 2, CAST(N'2022-09-13T16:27:46.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (2, 2, 2, CAST(N'2022-09-13T16:27:46.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (3, 3, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (4, 4, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (5, 5, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (6, 6, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (7, 7, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (8, 8, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (9, 9, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (10, 10, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (11, 11, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (12, 12, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (13, 13, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (14, 14, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (15, 15, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (16, 16, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (17, 17, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
INSERT [dbo].[CH_GroupsxSystems] ([ID], [IDSystem], [IDGroup], [DateInsert], [IDAcessResponsible]) VALUES (18, 18, 2, CAST(N'2022-09-13T16:27:47.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CH_GroupsxSystems] OFF
GO
SET IDENTITY_INSERT [dbo].[CH_LoginLogout] ON 

INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (1, CAST(N'2022-09-26T15:07:00.000' AS DateTime), N'Login', N'DESKTOP-T1EUCV8
', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (2, CAST(N'2022-09-26T15:27:00.000' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (3, CAST(N'2022-09-26T15:37:00.000' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (4, CAST(N'2022-09-26T17:49:00.000' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (5, CAST(N'2022-09-27T08:36:16.000' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (6, CAST(N'2022-09-27T08:41:30.103' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (7, CAST(N'2022-09-27T08:49:39.507' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (8, CAST(N'2022-09-27T08:56:52.837' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (9, CAST(N'2022-09-27T09:32:01.013' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (10, CAST(N'2022-09-27T09:33:05.590' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (11, CAST(N'2022-09-27T09:41:54.570' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (12, CAST(N'2022-09-27T09:50:21.293' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (13, CAST(N'2022-09-27T09:50:27.207' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (14, CAST(N'2022-09-27T09:51:11.140' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (15, CAST(N'2022-09-27T09:51:20.430' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (16, CAST(N'2022-09-27T09:53:23.560' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (17, CAST(N'2022-09-27T09:53:37.270' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (18, CAST(N'2022-09-27T09:58:57.570' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (19, CAST(N'2022-09-27T10:04:24.640' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (20, CAST(N'2022-09-27T10:11:49.620' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (21, CAST(N'2022-09-27T10:51:49.620' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 1)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (22, CAST(N'2022-09-27T17:05:54.480' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (23, CAST(N'2022-09-27T17:09:08.643' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (24, CAST(N'2022-09-27T17:12:18.400' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (25, CAST(N'2022-09-27T17:32:10.277' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (26, CAST(N'2022-09-27T17:38:11.053' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (27, CAST(N'2022-09-27T17:40:10.947' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (28, CAST(N'2022-09-27T17:47:03.247' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (29, CAST(N'2022-09-27T17:53:35.233' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (30, CAST(N'2022-09-27T18:13:55.053' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (31, CAST(N'2022-09-27T18:15:01.793' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (32, CAST(N'2022-09-27T18:16:00.257' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (33, CAST(N'2022-09-27T18:20:55.297' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (34, CAST(N'2022-09-27T18:22:42.067' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (35, CAST(N'2022-09-28T08:47:54.530' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (36, CAST(N'2022-09-28T08:48:00.493' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (37, CAST(N'2022-09-28T08:48:49.420' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (38, CAST(N'2022-09-28T08:51:14.637' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (39, CAST(N'2022-09-28T08:52:41.607' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (40, CAST(N'2022-09-28T08:54:44.690' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (41, CAST(N'2022-09-28T08:56:28.713' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (42, CAST(N'2022-09-28T08:58:53.507' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (43, CAST(N'2022-09-28T08:59:31.540' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (44, CAST(N'2022-09-28T09:00:05.313' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (45, CAST(N'2022-09-28T09:01:45.890' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (46, CAST(N'2022-09-28T09:08:01.657' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (47, CAST(N'2022-09-28T09:08:52.617' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (48, CAST(N'2022-09-28T09:15:37.630' AS DateTime), N'Login', N'DESKTOP-T1EUCV8', 2)
INSERT [dbo].[CH_LoginLogout] ([ID], [DatetimeInsert], [Event], [Hostname], [IDAcess]) VALUES (49, CAST(N'2022-09-28T09:20:06.060' AS DateTime), N'Logout', N'DESKTOP-T1EUCV8', 2)
SET IDENTITY_INSERT [dbo].[CH_LoginLogout] OFF
GO
SET IDENTITY_INSERT [dbo].[CH_RequestsParams] ON 

INSERT [dbo].[CH_RequestsParams] ([ID], [IDSystem], [Method], [ContainsInUrl], [Param], [IsJson], [Split], [SplitIndex], [PathJson]) VALUES (1, 1, N'POST', N'ui-interaction-runtime-components-controllers.FlowRuntime.executeAction=1', N'message', 1, NULL, NULL, N'actions.[0].params.fields.[0].value')
SET IDENTITY_INSERT [dbo].[CH_RequestsParams] OFF
GO
SET IDENTITY_INSERT [dbo].[CH_RequestsResults] ON 

INSERT [dbo].[CH_RequestsResults] ([ID], [IDAcess], [HostName], [IDRequestParams], [Result], [DateInsert]) VALUES (1, 2, N'DESKTOP-T1EUCV8', 1, N'983.826.087-87', CAST(N'2022-09-28T09:17:33.773' AS DateTime))
INSERT [dbo].[CH_RequestsResults] ([ID], [IDAcess], [HostName], [IDRequestParams], [Result], [DateInsert]) VALUES (2, 2, N'DESKTOP-T1EUCV8', 1, N'98382608787', CAST(N'2022-09-28T09:17:41.267' AS DateTime))
SET IDENTITY_INSERT [dbo].[CH_RequestsResults] OFF
GO
SET IDENTITY_INSERT [dbo].[CH_Systems] ON 

INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (1, N'Sales Force1', N'https://agibank.force.com', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (2, N'Agi Performance', N'https://performance.agi.com.br/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (3, N'Alteração de benefícios', N'https://agibank.tbs.aon.com/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (4, N'Ponto Eletrônico', N'https://agibank.nexusweb.com.br/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (5, N'Sem Climão (pulses)', N'https://www.pulses.com.br/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (6, N'SinergyRH', N'https://www.folhasinergyrh.com.br/Login', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (7, N'Universidade Agi', N'https://www.universidade.agi.com.br/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (8, N'Conecta CNA', N'https://login.conectacna.com.br/login', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (9, N'Desko Reservas', N'https://agibank.deskbee.app/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (10, N'Genesis (AgiplanNet)', N'http://genesis.agiplan.com.br/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (11, N'Horacius', N'https://iam.agibank.com.br/portal', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (12, N'Portal de Sistemas (Matriz)', N'http://credito.agiplan.com.br/portal', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (13, N'Portal de Sistemas (REDE)', N'https://portal.agiplan.com.br/portal', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (14, N'Qualitor', N'https://qualitor.agiplan.com.br/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (15, N'Recupera', N'https://recupera.agiplan.com.br/recupera/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (16, N'Reset da Senha de Rede', N'https://passwordreset.microsoftonline.com/?whr=agibank.com.br', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (17, N'Salesforce', N'https://api.agibank.com.br/authenticationendpoint/login', N'GoogleChrome', N'Black', N'Google Chrome', N'')
INSERT [dbo].[CH_Systems] ([ID], [Name], [URL], [Icon], [IconColor], [Browser], [SystemGroup]) VALUES (18, N'Webmail - Outlook', N'https://outlook.office365.com/mail/', N'GoogleChrome', N'Black', N'Google Chrome', N'')
SET IDENTITY_INSERT [dbo].[CH_Systems] OFF
GO
ALTER TABLE [dbo].[CH_Acess] ADD  DEFAULT ('False') FOR [Blocked]
GO
ALTER TABLE [dbo].[CH_Acess] ADD  DEFAULT ('False') FOR [Deleted]
GO
ALTER TABLE [dbo].[CH_Acess] ADD  DEFAULT ('False') FOR [ChangePassw]
GO
ALTER TABLE [dbo].[CH_Evidences] ADD  DEFAULT (getdate()) FOR [DatetimeInsert]
GO
ALTER TABLE [dbo].[CH_Groups] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[CH_Groups] ADD  DEFAULT (getdate()) FOR [LastModification]
GO
ALTER TABLE [dbo].[CH_GroupsxDesktopApps] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[CH_GroupsxMaterials] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[CH_GroupsxSystems] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[CH_GroupsxWebSites] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
ALTER TABLE [dbo].[CH_LoginLogout] ADD  DEFAULT (getdate()) FOR [DatetimeInsert]
GO
ALTER TABLE [dbo].[CH_RequestsResults] ADD  DEFAULT (getdate()) FOR [DateInsert]
GO
/****** Object:  StoredProcedure [dbo].[SP_CH_LoggedTime]    Script Date: 28/09/2022 09:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CH_LoggedTime](@IDAcess int)
AS

select SUM(LoggedTime) as LoggedTime from(
select case when b.Logout is null then DATEDIFF(second,b.DatetimeInsert, getdate())
else DATEDIFF(second,b.DatetimeInsert, Logout) end as LoggedTime
from (
select *, (select top 1 DatetimeInsert from CH_LoginLogout 
where IDAcess = ll.IDAcess 
and DatetimeInsert > ll.DatetimeInsert and [Event] = 'Logout'
order by DatetimeInsert) as Logout
from CH_LoginLogout ll
where [Event] = 'Login' and convert(date,DatetimeInsert) = convert(date,getdate())
and ll.IDAcess = @IDAcess
) b
)c
GO
/****** Object:  StoredProcedure [dbo].[SP_UserLockIdToConnectHome]    Script Date: 28/09/2022 09:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SP_SSO_LoggedTime 'mateus.dazzi','Yuppie','1'




CREATE PROCEDURE [dbo].[SP_UserLockIdToConnectHome](@name nvarchar(250), @cpf nvarchar(20), @usuario nvarchar(100), @password nvarchar(100))
as
declare @exist int;
set @exist = (select top 1 ID from CH_Acess where UserName = @usuario);
if (@exist is null) 
begin
 insert into CH_Acess(Name, CPF, UserName, Passw) values(@name,@cpf,@usuario,@password);
end

GO
USE [master]
GO
ALTER DATABASE [ConnectHome] SET  READ_WRITE 
GO
