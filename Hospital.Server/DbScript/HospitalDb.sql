USE [master]
GO
/****** Object:  Database [HospitalDb]    Script Date: 04.09.2024 10:37:13 ******/
CREATE DATABASE [HospitalDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLHOME\MSSQL\DATA\HospitalDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLHOME\MSSQL\DATA\HospitalDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HospitalDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalDb] SET RECOVERY FULL 
GO
ALTER DATABASE [HospitalDb] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HospitalDb', N'ON'
GO
ALTER DATABASE [HospitalDb] SET QUERY_STORE = OFF
GO
USE [HospitalDb]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 04.09.2024 10:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 04.09.2024 10:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[LastName] [text] NOT NULL,
	[FirstName] [text] NOT NULL,
	[MiddleName] [text] NULL,
	[OfficeId] [int] NOT NULL,
	[SpecializationId] [int] NOT NULL,
	[AreaId] [int] NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 04.09.2024 10:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Name] [text] NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 04.09.2024 10:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Offices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 04.09.2024 10:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[LastName] [text] NOT NULL,
	[FirstName] [text] NOT NULL,
	[MiddleName] [text] NULL,
	[Address] [text] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[GenderId] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializations]    Script Date: 04.09.2024 10:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Name] [text] NOT NULL,
 CONSTRAINT [PK_Specializations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Areas] ON 

INSERT [dbo].[Areas] ([Id], [Number]) VALUES (0, 15)
INSERT [dbo].[Areas] ([Id], [Number]) VALUES (1, 24)
INSERT [dbo].[Areas] ([Id], [Number]) VALUES (2, 30)
SET IDENTITY_INSERT [dbo].[Areas] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([Id], [LastName], [FirstName], [MiddleName], [OfficeId], [SpecializationId], [AreaId]) VALUES (0, N'Морозов', N'Евгений', NULL, 0, 0, NULL)
INSERT [dbo].[Doctors] ([Id], [LastName], [FirstName], [MiddleName], [OfficeId], [SpecializationId], [AreaId]) VALUES (1, N'Лебедева', N'Виктория', N'Кирилловна', 1, 1, 0)
INSERT [dbo].[Doctors] ([Id], [LastName], [FirstName], [MiddleName], [OfficeId], [SpecializationId], [AreaId]) VALUES (3, N'Михайлова', N'Нина', NULL, 2, 0, 1)
INSERT [dbo].[Doctors] ([Id], [LastName], [FirstName], [MiddleName], [OfficeId], [SpecializationId], [AreaId]) VALUES (4, N'Волкова', N'Мария', N'Ярославовна', 3, 3, 0)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([Id], [Name]) VALUES (0, N'Мужской')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (1, N'Женский')
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[Offices] ON 

INSERT [dbo].[Offices] ([Id], [Number]) VALUES (0, 1)
INSERT [dbo].[Offices] ([Id], [Number]) VALUES (1, 5)
INSERT [dbo].[Offices] ([Id], [Number]) VALUES (2, 9)
INSERT [dbo].[Offices] ([Id], [Number]) VALUES (3, 11)
SET IDENTITY_INSERT [dbo].[Offices] OFF
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([Id], [LastName], [FirstName], [MiddleName], [Address], [DateOfBirth], [GenderId], [AreaId]) VALUES (0, N'Лукьянов', N'Данил', N'Даниилович', N'Новгородская область, город Домодедово, въезд Чехова, 93', CAST(N'2000-08-07' AS Date), 0, 0)
INSERT [dbo].[Patients] ([Id], [LastName], [FirstName], [MiddleName], [Address], [DateOfBirth], [GenderId], [AreaId]) VALUES (1, N'Мартынова', N'Алиса', NULL, N'Новосибирская область, город Талдом, пл. Будапештсткая, 39', CAST(N'1995-10-25' AS Date), 1, 0)
INSERT [dbo].[Patients] ([Id], [LastName], [FirstName], [MiddleName], [Address], [DateOfBirth], [GenderId], [AreaId]) VALUES (2, N'Сергеев', N'Дмитрий', N'Романович', N'Псковская область, город Волоколамск, проезд Домодедовская, 33', CAST(N'1999-03-01' AS Date), 0, 1)
INSERT [dbo].[Patients] ([Id], [LastName], [FirstName], [MiddleName], [Address], [DateOfBirth], [GenderId], [AreaId]) VALUES (3, N'Богданова', N'Полина', N'Тимуровна', N'Архангельская область, город Подольск, пл. Бухарестская, 92', CAST(N'2001-09-17' AS Date), 1, 2)
INSERT [dbo].[Patients] ([Id], [LastName], [FirstName], [MiddleName], [Address], [DateOfBirth], [GenderId], [AreaId]) VALUES (4, N'Прохоров', N'Максим', NULL, N'Сахалинская область, город Балашиха, наб. Гагарина, 25', CAST(N'1992-01-29' AS Date), 0, 1)
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
SET IDENTITY_INSERT [dbo].[Specializations] ON 

INSERT [dbo].[Specializations] ([Id], [Name]) VALUES (0, N'Терапевт')
INSERT [dbo].[Specializations] ([Id], [Name]) VALUES (1, N'Педиатр')
INSERT [dbo].[Specializations] ([Id], [Name]) VALUES (2, N'Хирург')
INSERT [dbo].[Specializations] ([Id], [Name]) VALUES (3, N'Стоматолог')
SET IDENTITY_INSERT [dbo].[Specializations] OFF
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Areas] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Areas] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Areas]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Offices] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Offices] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Offices]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Specializations]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Areas1] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Areas] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Areas1]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Genders] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Genders]
GO
USE [master]
GO
ALTER DATABASE [HospitalDb] SET  READ_WRITE 
GO
