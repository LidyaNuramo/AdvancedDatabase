USE [master]
GO
/****** Object:  Database [Hospital Management System]    Script Date: 9/30/2020 3:41:24 AM ******/
CREATE DATABASE [Hospital Management System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital Management System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Hospital Management System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital Management System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Hospital Management System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hospital Management System] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital Management System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital Management System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital Management System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital Management System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital Management System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital Management System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital Management System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital Management System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital Management System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital Management System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital Management System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital Management System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital Management System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital Management System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital Management System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital Management System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital Management System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital Management System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital Management System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital Management System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital Management System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital Management System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital Management System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital Management System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital Management System] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital Management System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital Management System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital Management System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital Management System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital Management System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital Management System] SET QUERY_STORE = OFF
GO
USE [Hospital Management System]
GO
/****** Object:  Table [dbo].[City]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[MiddleName] [varchar](255) NULL,
	[LastName] [varchar](255) NOT NULL,
	[IdentificationNumber] [varchar](max) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [bigint] NULL,
	[Email] [varchar](255) NULL,
	[Nationality] [varchar](255) NOT NULL,
	[CityID] [int] NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[DeptID] [int] NOT NULL,
	[EmployeeTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffType]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StaffType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Employees]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Employees]
AS
SELECT        dbo.Staff.ID, dbo.Staff.LastName + ', ' + dbo.Staff.FirstName + ' ' + dbo.Staff.MiddleName AS Name, dbo.Staff.IdentificationNumber, dbo.Staff.Gender, dbo.Staff.DateOfBirth, dbo.Staff.Phone, dbo.Staff.Email, dbo.Staff.Nationality, 
                         dbo.Staff.CityID, dbo.City.Name AS CityName, dbo.Staff.Address, dbo.Staff.DeptID, dbo.Department.Name AS DeptName, dbo.Staff.EmployeeTypeID, dbo.StaffType.Name AS StaffType
FROM            dbo.Staff INNER JOIN
                         dbo.City ON dbo.Staff.CityID = dbo.City.ID INNER JOIN
                         dbo.Department ON dbo.Staff.DeptID = dbo.Department.ID INNER JOIN
                         dbo.StaffType ON dbo.Staff.EmployeeTypeID = dbo.StaffType.ID
GO
/****** Object:  Table [dbo].[Specialities]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialities](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Specialities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NOT NULL,
	[SpecialityID] [int] NOT NULL,
 CONSTRAINT [PK_Doctor_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Doctors]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Doctors]
AS
SELECT        dbo.Doctor.ID, dbo.Doctor.StaffID, dbo.Employees.Name, dbo.Employees.Phone, dbo.Employees.Email, dbo.Employees.DeptID, dbo.Employees.DeptName, dbo.Employees.EmployeeTypeID, dbo.Employees.StaffType, 
                         dbo.Doctor.SpecialityID, dbo.Specialities.Name AS Speciality
FROM            dbo.Employees INNER JOIN
                         dbo.Doctor ON dbo.Employees.ID = dbo.Doctor.ID INNER JOIN
                         dbo.Specialities ON dbo.Doctor.SpecialityID = dbo.Specialities.ID
GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nurse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NOT NULL,
	[Position] [varchar](max) NOT NULL,
	[Registered] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nurse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Nurses]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Nurses]
AS
SELECT        dbo.Nurse.ID, dbo.Nurse.StaffID, dbo.Employees.Name, dbo.Employees.Phone, dbo.Employees.Email, dbo.Employees.DeptID, dbo.Employees.DeptName, dbo.Employees.EmployeeTypeID, dbo.Employees.StaffType, 
                         dbo.Nurse.Position, dbo.Nurse.Registered
FROM            dbo.Employees INNER JOIN
                         dbo.Nurse ON dbo.Employees.ID = dbo.Nurse.ID
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[MiddleName] [varchar](255) NULL,
	[LastName] [varchar](255) NOT NULL,
	[IdentificationNumber] [varchar](max) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [bigint] NULL,
	[Email] [varchar](255) NULL,
	[Nationality] [varchar](255) NOT NULL,
	[CityID] [int] NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Allergies] [varchar](max) NULL,
	[ExistingConditions] [varchar](max) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Patients]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Patients]
AS
SELECT        dbo.Patient.ID, dbo.Patient.LastName + ', ' + dbo.Patient.FirstName + ' ' + dbo.Patient.MiddleName AS Name, dbo.Patient.IdentificationNumber, dbo.Patient.Gender, dbo.Patient.DateOfBirth, dbo.Patient.Phone, dbo.Patient.Email, 
                         dbo.Patient.Nationality, dbo.Patient.CityID, dbo.City.Name AS CityName, dbo.Patient.Address, dbo.Patient.Allergies, dbo.Patient.ExistingConditions
FROM            dbo.Patient INNER JOIN
                         dbo.City ON dbo.Patient.CityID = dbo.City.ID
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[NurseID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[VisitNote] [varchar](max) NULL,
	[Recommenation] [varchar](max) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[RoomType] [varchar](50) NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[BuildingNumber] [int] NOT NULL,
	[Unavailable] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Appointments]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Appointments]
AS
SELECT        dbo.Appointment.ID, dbo.Appointment.PatientID, dbo.Patients.Name AS PatientName, dbo.Patients.Gender, dbo.Patients.DateOfBirth, dbo.Patients.Phone, dbo.Patients.Email, dbo.Patients.Allergies, 
                         dbo.Patients.ExistingConditions, dbo.Appointment.DoctorID, dbo.Doctors.StaffID AS DoctorStaffID, dbo.Doctors.Name AS DoctorName, dbo.Doctors.Phone AS DoctorPhone, dbo.Doctors.Email AS DoctorEmail, 
                         dbo.Doctors.DeptID, dbo.Doctors.DeptName, dbo.Doctors.SpecialityID, dbo.Doctors.Speciality, dbo.Appointment.NurseID, dbo.Nurses.StaffID AS NurseStaffID, dbo.Nurses.Name AS NurseName, 
                         dbo.Nurses.Phone AS NursePhone, dbo.Nurses.Email AS NurseEmail, dbo.Nurses.DeptID AS NurseDeptID, dbo.Nurses.DeptName AS NurseDeptName, dbo.Nurses.Position, dbo.Appointment.RoomID, dbo.Room.RoomNumber, 
                         dbo.Room.RoomType, dbo.Room.FloorNumber, dbo.Room.BuildingNumber, dbo.Appointment.Date, dbo.Appointment.Time, dbo.Appointment.VisitNote, dbo.Appointment.Recommenation
FROM            dbo.Appointment INNER JOIN
                         dbo.Room ON dbo.Appointment.RoomID = dbo.Room.ID INNER JOIN
                         dbo.Doctors ON dbo.Appointment.DoctorID = dbo.Doctors.ID INNER JOIN
                         dbo.Nurses ON dbo.Appointment.NurseID = dbo.Nurses.ID INNER JOIN
                         dbo.Patients ON dbo.Appointment.PatientID = dbo.Patients.ID
GO
/****** Object:  Table [dbo].[AppointmentShadow]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentShadow](
	[TStamp] [datetime] NULL,
	[OpCode] [char](1) NULL,
	[ID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[NurseID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[VisitNote] [varchar](max) NULL,
	[Recommenation] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bed]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[BedNumber] [int] NOT NULL,
	[Unavailable] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorCharge] [real] NULL,
	[NurseCharge] [real] NULL,
	[LabCharge] [real] NULL,
	[AdmissionCharge] [real] NULL,
	[OperationCharge] [real] NULL,
	[DrugsCharge] [real] NULL,
	[Advance] [real] NULL,
	[InsuranceCoverage] [real] NULL,
	[NetAmount] [real] NOT NULL,
	[Comments] [varchar](max) NULL,
 CONSTRAINT [PK_Billing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorShadow]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorShadow](
	[TStamp] [datetime] NULL,
	[OpCode] [char](1) NULL,
	[ID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[SpecialityID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inpatient]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inpatient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[BedID] [int] NOT NULL,
	[DeptID] [int] NOT NULL,
	[DateOfAdmission] [date] NOT NULL,
	[DateOfDischarge] [date] NOT NULL,
 CONSTRAINT [PK_Inpatient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabOrders]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NOT NULL,
	[OrderDetails] [varchar](max) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ResultDate] [date] NULL,
	[LabResults] [varchar](max) NULL,
 CONSTRAINT [PK_LabOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[SurgeonID] [int] NOT NULL,
	[NurseID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[PostOpNotes] [varchar](max) NULL,
 CONSTRAINT [PK_Operation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientShadow]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientShadow](
	[TStamp] [datetime] NULL,
	[OpCode] [char](1) NULL,
	[ID] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[MiddleName] [varchar](255) NULL,
	[LastName] [varchar](255) NOT NULL,
	[IdentificationNumber] [varchar](max) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [bigint] NULL,
	[Email] [varchar](255) NULL,
	[Nationality] [varchar](255) NOT NULL,
	[CityID] [int] NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Allergies] [varchar](max) NULL,
	[ExistingConditions] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[FilledStatus] [varchar](50) NOT NULL,
	[DrugName] [varchar](max) NOT NULL,
	[Amount] [varchar](max) NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surgeon]    Script Date: 9/30/2020 3:41:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surgeon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
 CONSTRAINT [PK_Surgeon_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (14, 55, 4, 15, 32, CAST(N'2021-03-07' AS Date), CAST(N'02:41:33' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (15, 53, 5, 18, 14, CAST(N'2020-02-06' AS Date), CAST(N'12:34:15' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (16, 55, 16, 18, 27, CAST(N'2021-01-08' AS Date), CAST(N'23:02:05' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (17, 46, 15, 21, 5, CAST(N'2018-11-24' AS Date), CAST(N'03:07:51' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (18, 55, 8, 19, 8, CAST(N'2019-02-08' AS Date), CAST(N'10:20:43' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (19, 50, 16, 18, 5, CAST(N'2018-01-19' AS Date), CAST(N'14:11:06' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (20, 58, 10, 19, 15, CAST(N'2019-04-12' AS Date), CAST(N'07:36:05' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (21, 36, 4, 12, 31, CAST(N'2018-07-23' AS Date), CAST(N'16:30:58' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (22, 56, 1, 17, 4, CAST(N'2020-01-25' AS Date), CAST(N'11:46:46' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (23, 47, 1, 12, 36, CAST(N'2018-06-01' AS Date), CAST(N'22:49:00' AS Time), NULL, NULL)
INSERT [dbo].[Appointment] ([ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (27, 42, 10, 11, 19, CAST(N'2020-09-30' AS Date), CAST(N'23:03:14' AS Time), N'New Appt.', NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
INSERT [dbo].[AppointmentShadow] ([TStamp], [OpCode], [ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (CAST(N'2020-09-30T02:04:57.963' AS DateTime), N'D', 26, 5, 3, 11, 1, CAST(N'2020-09-30' AS Date), CAST(N'23:03:14' AS Time), N'', NULL)
INSERT [dbo].[AppointmentShadow] ([TStamp], [OpCode], [ID], [PatientID], [DoctorID], [NurseID], [RoomID], [Date], [Time], [VisitNote], [Recommenation]) VALUES (CAST(N'2020-09-30T02:05:09.887' AS DateTime), N'D', 25, 5, 3, 11, 1, CAST(N'2020-09-29' AS Date), CAST(N'23:03:14' AS Time), N'Follow-up', NULL)
SET IDENTITY_INSERT [dbo].[Bed] ON 

INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (1, 26, 7, N'natoque')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (2, 14, 7, N'a,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (3, 30, 1, N'placerat,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (4, 20, 9, N'tincidunt')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (5, 12, 5, N'semper,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (6, 18, 10, N'Sed')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (7, 18, 9, N'a')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (8, 31, 10, N'Morbi')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (9, 32, 10, N'id')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (10, 26, 2, N'id,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (11, 11, 4, N'eget,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (12, 26, 6, N'tellus')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (13, 20, 6, N'amet,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (14, 15, 3, N'Donec')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (15, 28, 2, N'nunc')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (16, 11, 2, N'odio,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (17, 36, 8, N'id,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (18, 4, 7, N'Curabitur')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (19, 6, 6, N'lacinia')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (20, 10, 4, N'ultrices,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (21, 36, 6, N'lorem')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (22, 4, 4, N'interdum')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (23, 19, 9, N'Integer')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (24, 19, 2, N'arcu')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (25, 15, 8, N'augue')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (26, 30, 1, N'semper')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (27, 19, 10, N'euismod')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (28, 30, 7, N'nec,')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (29, 25, 5, N'lectus')
INSERT [dbo].[Bed] ([ID], [RoomID], [BedNumber], [Unavailable]) VALUES (30, 6, 8, N'nunc.')
SET IDENTITY_INSERT [dbo].[Bed] OFF
SET IDENTITY_INSERT [dbo].[Billing] ON 

INSERT [dbo].[Billing] ([ID], [PatientID], [DoctorCharge], [NurseCharge], [LabCharge], [AdmissionCharge], [OperationCharge], [DrugsCharge], [Advance], [InsuranceCoverage], [NetAmount], [Comments]) VALUES (5, 35, 300, 100, 50, NULL, NULL, NULL, 50, 300, 100, NULL)
INSERT [dbo].[Billing] ([ID], [PatientID], [DoctorCharge], [NurseCharge], [LabCharge], [AdmissionCharge], [OperationCharge], [DrugsCharge], [Advance], [InsuranceCoverage], [NetAmount], [Comments]) VALUES (8, 5, 1000, 300, 200, 1000, 1000, NULL, 50, 2500, 950, NULL)
SET IDENTITY_INSERT [dbo].[Billing] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [Name]) VALUES (1, N'Paranaíba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (2, N'Hantang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (3, N'Fujioka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (4, N'Bethel Town')
INSERT [dbo].[City] ([ID], [Name]) VALUES (5, N'Datong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (6, N'Lanos')
INSERT [dbo].[City] ([ID], [Name]) VALUES (7, N'Rogowo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (8, N'Bralin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (9, N'Ciasna')
INSERT [dbo].[City] ([ID], [Name]) VALUES (10, N'Vršac')
INSERT [dbo].[City] ([ID], [Name]) VALUES (11, N'Luziânia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (12, N'Meishan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (13, N'Musan-up')
INSERT [dbo].[City] ([ID], [Name]) VALUES (14, N'Wang Hin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (15, N'Dallas')
INSERT [dbo].[City] ([ID], [Name]) VALUES (16, N'Estevan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (17, N'Nossebro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (18, N'Huashixia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (19, N'Pitangueiras')
INSERT [dbo].[City] ([ID], [Name]) VALUES (20, N'Fort Dauphin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (21, N'Chengnan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (22, N'Aparecida de Goiânia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (23, N'Riangkroko')
INSERT [dbo].[City] ([ID], [Name]) VALUES (24, N'Xiayang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (25, N'Xinxing')
INSERT [dbo].[City] ([ID], [Name]) VALUES (26, N'Kembangkerang Satu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (27, N'Churubamba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (28, N'Ol’ginskaya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (29, N'Borovo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (30, N'Jishan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (31, N'Huancapallac')
INSERT [dbo].[City] ([ID], [Name]) VALUES (32, N'Dongshi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (33, N'Walnut Grove')
INSERT [dbo].[City] ([ID], [Name]) VALUES (34, N'Beichengqu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (35, N'Pirgaaj')
INSERT [dbo].[City] ([ID], [Name]) VALUES (36, N'Takab')
INSERT [dbo].[City] ([ID], [Name]) VALUES (37, N'Qiansuo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (38, N'Arujá')
INSERT [dbo].[City] ([ID], [Name]) VALUES (39, N'Tangchijie')
INSERT [dbo].[City] ([ID], [Name]) VALUES (40, N'Iquipi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (41, N'Santa Cruz da Graciosa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (42, N'Thành Ph? H? Long')
INSERT [dbo].[City] ([ID], [Name]) VALUES (43, N'Xincun')
INSERT [dbo].[City] ([ID], [Name]) VALUES (44, N'Lansing')
INSERT [dbo].[City] ([ID], [Name]) VALUES (45, N'New York City')
INSERT [dbo].[City] ([ID], [Name]) VALUES (46, N'Mashan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (47, N'Kaum Kaler')
INSERT [dbo].[City] ([ID], [Name]) VALUES (48, N'Jiangjia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (49, N'Villa Las Rosas')
INSERT [dbo].[City] ([ID], [Name]) VALUES (50, N'Hidalgo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (51, N'Nong Kung Si')
INSERT [dbo].[City] ([ID], [Name]) VALUES (52, N'Stockholm')
INSERT [dbo].[City] ([ID], [Name]) VALUES (53, N'Shirone')
INSERT [dbo].[City] ([ID], [Name]) VALUES (54, N'Pinhal da Marquesa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (55, N'Baklashi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (56, N'Longxi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (57, N'Lemende')
INSERT [dbo].[City] ([ID], [Name]) VALUES (58, N'Gal’bshtadt')
INSERT [dbo].[City] ([ID], [Name]) VALUES (59, N'Woto')
INSERT [dbo].[City] ([ID], [Name]) VALUES (60, N'Fengtang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (61, N'Pasirbitung')
INSERT [dbo].[City] ([ID], [Name]) VALUES (62, N'Taishang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (63, N'Bor')
INSERT [dbo].[City] ([ID], [Name]) VALUES (64, N'Petrolera')
INSERT [dbo].[City] ([ID], [Name]) VALUES (65, N'Batujaran')
INSERT [dbo].[City] ([ID], [Name]) VALUES (66, N'Tsyelyakhany')
INSERT [dbo].[City] ([ID], [Name]) VALUES (67, N'Macroom')
INSERT [dbo].[City] ([ID], [Name]) VALUES (68, N'Abbotsford')
INSERT [dbo].[City] ([ID], [Name]) VALUES (69, N'Zumiao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (70, N'Velykyy Burluk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (71, N'Khánh H?i')
INSERT [dbo].[City] ([ID], [Name]) VALUES (72, N'Peñarrubia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (73, N'San Luis')
INSERT [dbo].[City] ([ID], [Name]) VALUES (74, N'Novosemeykino')
INSERT [dbo].[City] ([ID], [Name]) VALUES (75, N'Nanterre')
INSERT [dbo].[City] ([ID], [Name]) VALUES (76, N'At Taybah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (77, N'Ladysmith')
INSERT [dbo].[City] ([ID], [Name]) VALUES (78, N'Markaz Bilad at Ta‘am')
INSERT [dbo].[City] ([ID], [Name]) VALUES (79, N'Kairouan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (80, N'Chashan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (81, N'Cabiguan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (82, N'Mabusag')
INSERT [dbo].[City] ([ID], [Name]) VALUES (83, N'Kunyang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (84, N'Rogózno')
INSERT [dbo].[City] ([ID], [Name]) VALUES (85, N'Otradnoye')
INSERT [dbo].[City] ([ID], [Name]) VALUES (86, N'Jinka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (87, N'Mayuan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (88, N'Backa Topola')
INSERT [dbo].[City] ([ID], [Name]) VALUES (89, N'Bilicenii Vechi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (90, N'Chu Sê')
INSERT [dbo].[City] ([ID], [Name]) VALUES (91, N'Stare Kurowo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (92, N'Nesterov')
INSERT [dbo].[City] ([ID], [Name]) VALUES (93, N'Dahu Satu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (94, N'Lazaro Cardenas')
INSERT [dbo].[City] ([ID], [Name]) VALUES (95, N'Burayevo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (96, N'Shangdundu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (97, N'Oguta')
INSERT [dbo].[City] ([ID], [Name]) VALUES (98, N'Qianpai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (99, N'Turi')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (100, N'An Châu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (101, N'Fezna')
INSERT [dbo].[City] ([ID], [Name]) VALUES (102, N'Socota')
INSERT [dbo].[City] ([ID], [Name]) VALUES (103, N'Enshi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (104, N'Toki')
INSERT [dbo].[City] ([ID], [Name]) VALUES (105, N'Reims')
INSERT [dbo].[City] ([ID], [Name]) VALUES (106, N'Szamotuly')
INSERT [dbo].[City] ([ID], [Name]) VALUES (107, N'Sintansin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (108, N'Ziketan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (109, N'Ponta do Sol')
INSERT [dbo].[City] ([ID], [Name]) VALUES (110, N'Aral')
INSERT [dbo].[City] ([ID], [Name]) VALUES (111, N'Lanipao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (112, N'Sumbuya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (113, N'Jorowaru Daya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (114, N'???????')
INSERT [dbo].[City] ([ID], [Name]) VALUES (115, N'Cinangsih Satu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (116, N'Côte-Saint-Luc')
INSERT [dbo].[City] ([ID], [Name]) VALUES (117, N'Dimataling')
INSERT [dbo].[City] ([ID], [Name]) VALUES (118, N'Hulu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (119, N'Zhubei')
INSERT [dbo].[City] ([ID], [Name]) VALUES (120, N'Mohoro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (121, N'Rybnik')
INSERT [dbo].[City] ([ID], [Name]) VALUES (122, N'Zachepylivka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (123, N'Cikadondongdesa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (124, N'Wubao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (125, N'Canoinhas')
INSERT [dbo].[City] ([ID], [Name]) VALUES (126, N'Calumpang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (127, N'Casal Novo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (128, N'Matou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (129, N'Kumanis')
INSERT [dbo].[City] ([ID], [Name]) VALUES (130, N'Stenungsund')
INSERT [dbo].[City] ([ID], [Name]) VALUES (131, N'Wufeng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (132, N'Tanumah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (133, N'Timbó')
INSERT [dbo].[City] ([ID], [Name]) VALUES (134, N'Sigavé')
INSERT [dbo].[City] ([ID], [Name]) VALUES (135, N'Arcangel')
INSERT [dbo].[City] ([ID], [Name]) VALUES (136, N'San Gil')
INSERT [dbo].[City] ([ID], [Name]) VALUES (137, N'Huzhuang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (138, N'Tala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (139, N'Kende')
INSERT [dbo].[City] ([ID], [Name]) VALUES (140, N'Sagana')
INSERT [dbo].[City] ([ID], [Name]) VALUES (141, N'???????? ????')
INSERT [dbo].[City] ([ID], [Name]) VALUES (142, N'Bani Khaddash')
INSERT [dbo].[City] ([ID], [Name]) VALUES (143, N'Belusovka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (144, N'As Saffaniyah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (145, N'Xucheng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (146, N'Veracruz')
INSERT [dbo].[City] ([ID], [Name]) VALUES (147, N'Ouricuri')
INSERT [dbo].[City] ([ID], [Name]) VALUES (148, N'Bajo Pichanaqui')
INSERT [dbo].[City] ([ID], [Name]) VALUES (149, N'Peremyshl’')
INSERT [dbo].[City] ([ID], [Name]) VALUES (150, N'Tejakalapa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (151, N'Goght’')
INSERT [dbo].[City] ([ID], [Name]) VALUES (152, N'Staraya Mayna')
INSERT [dbo].[City] ([ID], [Name]) VALUES (153, N'Normandin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (154, N'Qigzhi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (155, N'Shahezi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (156, N'Yuhang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (157, N'Pavlohrad')
INSERT [dbo].[City] ([ID], [Name]) VALUES (158, N'Mangunjaya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (159, N'Seattle')
INSERT [dbo].[City] ([ID], [Name]) VALUES (160, N'Forshaga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (161, N'Qiaozhuang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (162, N'Moncada')
INSERT [dbo].[City] ([ID], [Name]) VALUES (163, N'San Isidro de Lules')
INSERT [dbo].[City] ([ID], [Name]) VALUES (164, N'Saronída')
INSERT [dbo].[City] ([ID], [Name]) VALUES (165, N'Machala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (166, N'Chornukhy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (167, N'Keta')
INSERT [dbo].[City] ([ID], [Name]) VALUES (168, N'Jabon')
INSERT [dbo].[City] ([ID], [Name]) VALUES (169, N'Nipawin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (170, N'Liulin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (171, N'Stockholm')
INSERT [dbo].[City] ([ID], [Name]) VALUES (172, N'Krivaja')
INSERT [dbo].[City] ([ID], [Name]) VALUES (173, N'Isaka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (174, N'Tualangcut')
INSERT [dbo].[City] ([ID], [Name]) VALUES (175, N'Al Fashn')
INSERT [dbo].[City] ([ID], [Name]) VALUES (176, N'Jianghu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (177, N'Tumba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (178, N'Kolwezi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (179, N'Kangle')
INSERT [dbo].[City] ([ID], [Name]) VALUES (180, N'Burqah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (181, N'Villa Santa Rita')
INSERT [dbo].[City] ([ID], [Name]) VALUES (182, N'El Rosario')
INSERT [dbo].[City] ([ID], [Name]) VALUES (183, N'Rogózno')
INSERT [dbo].[City] ([ID], [Name]) VALUES (184, N'Carabayllo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (185, N'Sundbyberg')
INSERT [dbo].[City] ([ID], [Name]) VALUES (186, N'Chuncheon')
INSERT [dbo].[City] ([ID], [Name]) VALUES (187, N'Teluk Pinang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (188, N'Pentre')
INSERT [dbo].[City] ([ID], [Name]) VALUES (189, N'Kyzylorda')
INSERT [dbo].[City] ([ID], [Name]) VALUES (190, N'Tsul-Ulaan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (191, N'Maisí')
INSERT [dbo].[City] ([ID], [Name]) VALUES (192, N'Mendi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (193, N'Krajan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (194, N'Ganyi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (195, N'Palamadu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (196, N'Malanje')
INSERT [dbo].[City] ([ID], [Name]) VALUES (197, N'Shijiazhuang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (198, N'Kisarazu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (199, N'Kawaguchi')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (200, N'Courelas Bravas')
INSERT [dbo].[City] ([ID], [Name]) VALUES (201, N'Nazaré')
INSERT [dbo].[City] ([ID], [Name]) VALUES (202, N'Uspenka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (203, N'La Rochelle')
INSERT [dbo].[City] ([ID], [Name]) VALUES (204, N'Bagnolet')
INSERT [dbo].[City] ([ID], [Name]) VALUES (205, N'Quiling')
INSERT [dbo].[City] ([ID], [Name]) VALUES (206, N'Manolás')
INSERT [dbo].[City] ([ID], [Name]) VALUES (207, N'Itaporanga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (208, N'Zychlin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (209, N'Sulahan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (210, N'Nairobi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (211, N'Santana de Parnaíba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (212, N'Náfplio')
INSERT [dbo].[City] ([ID], [Name]) VALUES (213, N'Yajin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (214, N'Mooka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (215, N'Carregado')
INSERT [dbo].[City] ([ID], [Name]) VALUES (216, N'Salvaleón de Higüey')
INSERT [dbo].[City] ([ID], [Name]) VALUES (217, N'Makilala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (218, N'Sarangmeduro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (219, N'Nizui')
INSERT [dbo].[City] ([ID], [Name]) VALUES (220, N'Volovo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (221, N'Cielmice')
INSERT [dbo].[City] ([ID], [Name]) VALUES (222, N'Toledo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (223, N'Bárrio')
INSERT [dbo].[City] ([ID], [Name]) VALUES (224, N'Forshaga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (225, N'Youcheng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (226, N'Saint-Louis')
INSERT [dbo].[City] ([ID], [Name]) VALUES (227, N'Doudleby nad Orlicí')
INSERT [dbo].[City] ([ID], [Name]) VALUES (228, N'Manquiring')
INSERT [dbo].[City] ([ID], [Name]) VALUES (229, N'Cañas')
INSERT [dbo].[City] ([ID], [Name]) VALUES (230, N'Hyesan-dong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (231, N'Nong Don')
INSERT [dbo].[City] ([ID], [Name]) VALUES (232, N'Lianhe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (233, N'Ignacio Zaragoza')
INSERT [dbo].[City] ([ID], [Name]) VALUES (234, N'Góra')
INSERT [dbo].[City] ([ID], [Name]) VALUES (235, N'Zaoshi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (236, N'Santa Paz')
INSERT [dbo].[City] ([ID], [Name]) VALUES (237, N'Ariz')
INSERT [dbo].[City] ([ID], [Name]) VALUES (238, N'Totok')
INSERT [dbo].[City] ([ID], [Name]) VALUES (239, N'San Jerónimo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (240, N'Yantan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (241, N'Xianbao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (242, N'Oliveirinha')
INSERT [dbo].[City] ([ID], [Name]) VALUES (243, N'Ebak')
INSERT [dbo].[City] ([ID], [Name]) VALUES (244, N'At Ta?alif')
INSERT [dbo].[City] ([ID], [Name]) VALUES (245, N'Zelazków')
INSERT [dbo].[City] ([ID], [Name]) VALUES (246, N'La Hacienda')
INSERT [dbo].[City] ([ID], [Name]) VALUES (247, N'Los Aquijes')
INSERT [dbo].[City] ([ID], [Name]) VALUES (248, N'Yanagawamachi-saiwaicho')
INSERT [dbo].[City] ([ID], [Name]) VALUES (249, N'Ush-Tyube')
INSERT [dbo].[City] ([ID], [Name]) VALUES (250, N'Heshi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (251, N'Drammen')
INSERT [dbo].[City] ([ID], [Name]) VALUES (252, N'Sanli')
INSERT [dbo].[City] ([ID], [Name]) VALUES (253, N'Kozakai-cho')
INSERT [dbo].[City] ([ID], [Name]) VALUES (254, N'Yumendong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (255, N'Khanpur')
INSERT [dbo].[City] ([ID], [Name]) VALUES (256, N'Georgiyevsk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (257, N'Seixezelo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (258, N'San Alberto')
INSERT [dbo].[City] ([ID], [Name]) VALUES (259, N'Madjeouéni')
INSERT [dbo].[City] ([ID], [Name]) VALUES (260, N'Al Buq‘ah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (261, N'Codrington')
INSERT [dbo].[City] ([ID], [Name]) VALUES (262, N'Tabou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (263, N'Arcos de Valdevez')
INSERT [dbo].[City] ([ID], [Name]) VALUES (264, N'Kåge')
INSERT [dbo].[City] ([ID], [Name]) VALUES (265, N'Taozixi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (266, N'Los Cerrillos')
INSERT [dbo].[City] ([ID], [Name]) VALUES (267, N'Itaqui')
INSERT [dbo].[City] ([ID], [Name]) VALUES (268, N'Zarszyn')
INSERT [dbo].[City] ([ID], [Name]) VALUES (269, N'Zórawina')
INSERT [dbo].[City] ([ID], [Name]) VALUES (270, N'Baota')
INSERT [dbo].[City] ([ID], [Name]) VALUES (271, N'Regla')
INSERT [dbo].[City] ([ID], [Name]) VALUES (272, N'Giade')
INSERT [dbo].[City] ([ID], [Name]) VALUES (273, N'Partizansk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (274, N'Shihudang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (275, N'Likino-Dulevo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (276, N'Majia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (277, N'Gweru')
INSERT [dbo].[City] ([ID], [Name]) VALUES (278, N'Kolambugan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (279, N'Odawara')
INSERT [dbo].[City] ([ID], [Name]) VALUES (280, N'Novokhovrino')
INSERT [dbo].[City] ([ID], [Name]) VALUES (281, N'Reston')
INSERT [dbo].[City] ([ID], [Name]) VALUES (282, N'Irving')
INSERT [dbo].[City] ([ID], [Name]) VALUES (283, N'Lyubashivka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (284, N'Tangkanpulit')
INSERT [dbo].[City] ([ID], [Name]) VALUES (285, N'Sibaté')
INSERT [dbo].[City] ([ID], [Name]) VALUES (286, N'Staraya Kupavna')
INSERT [dbo].[City] ([ID], [Name]) VALUES (287, N'Fengtang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (288, N'Houjie')
INSERT [dbo].[City] ([ID], [Name]) VALUES (289, N'Derbur')
INSERT [dbo].[City] ([ID], [Name]) VALUES (290, N'Riachão do Jacuípe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (291, N'Dearborn')
INSERT [dbo].[City] ([ID], [Name]) VALUES (292, N'Wuyang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (293, N'Nogueira da Regedoura')
INSERT [dbo].[City] ([ID], [Name]) VALUES (294, N'Matinha')
INSERT [dbo].[City] ([ID], [Name]) VALUES (295, N'Almada')
INSERT [dbo].[City] ([ID], [Name]) VALUES (296, N'Katsina-Ala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (297, N'Morohongo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (298, N'Pesochnoye')
INSERT [dbo].[City] ([ID], [Name]) VALUES (299, N'Wosai')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (300, N'Brie-Comte-Robert')
INSERT [dbo].[City] ([ID], [Name]) VALUES (301, N'Hats’avan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (302, N'Kakamega')
INSERT [dbo].[City] ([ID], [Name]) VALUES (303, N'Zhoutou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (304, N'Cabucgayan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (305, N'Palca')
INSERT [dbo].[City] ([ID], [Name]) VALUES (306, N'Södertälje')
INSERT [dbo].[City] ([ID], [Name]) VALUES (307, N'Sobreiro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (308, N'Ciulu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (309, N'Septfontaines')
INSERT [dbo].[City] ([ID], [Name]) VALUES (310, N'Muyinga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (311, N'Plaški')
INSERT [dbo].[City] ([ID], [Name]) VALUES (312, N'Moju')
INSERT [dbo].[City] ([ID], [Name]) VALUES (313, N'Le Mans')
INSERT [dbo].[City] ([ID], [Name]) VALUES (314, N'Jicomé')
INSERT [dbo].[City] ([ID], [Name]) VALUES (315, N'El Perico')
INSERT [dbo].[City] ([ID], [Name]) VALUES (316, N'Beaverlodge')
INSERT [dbo].[City] ([ID], [Name]) VALUES (317, N'Rowotengah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (318, N'Jimo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (319, N'San Antonio')
INSERT [dbo].[City] ([ID], [Name]) VALUES (320, N'Opocno')
INSERT [dbo].[City] ([ID], [Name]) VALUES (321, N'Nynäshamn')
INSERT [dbo].[City] ([ID], [Name]) VALUES (322, N'Vilarinho da Castanheira')
INSERT [dbo].[City] ([ID], [Name]) VALUES (323, N'Xiaohekou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (324, N'Sedayu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (325, N'Vaiusu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (326, N'Kavadarci')
INSERT [dbo].[City] ([ID], [Name]) VALUES (327, N'Qingyang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (328, N'Chenchang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (329, N'Boundiali')
INSERT [dbo].[City] ([ID], [Name]) VALUES (330, N'Aitape')
INSERT [dbo].[City] ([ID], [Name]) VALUES (331, N'Västervik')
INSERT [dbo].[City] ([ID], [Name]) VALUES (332, N'Caeté')
INSERT [dbo].[City] ([ID], [Name]) VALUES (333, N'Higuerote')
INSERT [dbo].[City] ([ID], [Name]) VALUES (334, N'Lešná')
INSERT [dbo].[City] ([ID], [Name]) VALUES (335, N'Rodnikovskaya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (336, N'Takeo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (337, N'Kharan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (338, N'Machakos')
INSERT [dbo].[City] ([ID], [Name]) VALUES (339, N'Versailles')
INSERT [dbo].[City] ([ID], [Name]) VALUES (340, N'Qionghai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (341, N'Juntang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (342, N'Savran’')
INSERT [dbo].[City] ([ID], [Name]) VALUES (343, N'Konstancin-Jeziorna')
INSERT [dbo].[City] ([ID], [Name]) VALUES (344, N'Cibunar')
INSERT [dbo].[City] ([ID], [Name]) VALUES (345, N'Ronglong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (346, N'Gaocheng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (347, N'Gadingrejo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (348, N'Yelets')
INSERT [dbo].[City] ([ID], [Name]) VALUES (349, N'Zlotniki Kujawskie')
INSERT [dbo].[City] ([ID], [Name]) VALUES (350, N'San Sebastián de Yalí')
INSERT [dbo].[City] ([ID], [Name]) VALUES (351, N'Xuchang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (352, N'Limbuš')
INSERT [dbo].[City] ([ID], [Name]) VALUES (353, N'Seara')
INSERT [dbo].[City] ([ID], [Name]) VALUES (354, N'San Fernando')
INSERT [dbo].[City] ([ID], [Name]) VALUES (355, N'Aldeia do Bispo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (356, N'Niort')
INSERT [dbo].[City] ([ID], [Name]) VALUES (357, N'Tadif')
INSERT [dbo].[City] ([ID], [Name]) VALUES (358, N'Mayskiy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (359, N'Jinping')
INSERT [dbo].[City] ([ID], [Name]) VALUES (360, N'Bahía Blanca')
INSERT [dbo].[City] ([ID], [Name]) VALUES (361, N'Tucuruí')
INSERT [dbo].[City] ([ID], [Name]) VALUES (362, N'Fika')
INSERT [dbo].[City] ([ID], [Name]) VALUES (363, N'Borås')
INSERT [dbo].[City] ([ID], [Name]) VALUES (364, N'Gómfoi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (365, N'Alurbulu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (366, N'Pantang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (367, N'Dahuangwei')
INSERT [dbo].[City] ([ID], [Name]) VALUES (368, N'Sinuknipan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (369, N'Tamahú')
INSERT [dbo].[City] ([ID], [Name]) VALUES (370, N'Heicheng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (371, N'Bontang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (372, N'Clarin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (373, N'Gunung Timur')
INSERT [dbo].[City] ([ID], [Name]) VALUES (374, N'El Galpón')
INSERT [dbo].[City] ([ID], [Name]) VALUES (375, N'Hetou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (376, N'Timiryazevskiy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (377, N'Paraíso')
INSERT [dbo].[City] ([ID], [Name]) VALUES (378, N'Xiongchi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (379, N'Yara')
INSERT [dbo].[City] ([ID], [Name]) VALUES (380, N'Hostoun')
INSERT [dbo].[City] ([ID], [Name]) VALUES (381, N'Thiers')
INSERT [dbo].[City] ([ID], [Name]) VALUES (382, N'Canillo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (383, N'Åtvidaberg')
INSERT [dbo].[City] ([ID], [Name]) VALUES (384, N'Bonneuil-sur-Marne')
INSERT [dbo].[City] ([ID], [Name]) VALUES (385, N'Melgar')
INSERT [dbo].[City] ([ID], [Name]) VALUES (386, N'Zushi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (387, N'Lyon')
INSERT [dbo].[City] ([ID], [Name]) VALUES (388, N'Onojo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (389, N'Nanguzhuang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (390, N'Boleslawiec')
INSERT [dbo].[City] ([ID], [Name]) VALUES (391, N'Vólos')
INSERT [dbo].[City] ([ID], [Name]) VALUES (392, N'Keren')
INSERT [dbo].[City] ([ID], [Name]) VALUES (393, N'Fastiv')
INSERT [dbo].[City] ([ID], [Name]) VALUES (394, N'Banag')
INSERT [dbo].[City] ([ID], [Name]) VALUES (395, N'Bara Datu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (396, N'Borås')
INSERT [dbo].[City] ([ID], [Name]) VALUES (397, N'Batugede Kulon')
INSERT [dbo].[City] ([ID], [Name]) VALUES (398, N'Anjia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (399, N'Futian')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (400, N'Kailahun')
INSERT [dbo].[City] ([ID], [Name]) VALUES (401, N'Wakkanai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (402, N'Krajan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (403, N'Matanog')
INSERT [dbo].[City] ([ID], [Name]) VALUES (404, N'Sydney')
INSERT [dbo].[City] ([ID], [Name]) VALUES (405, N'Carvalheira')
INSERT [dbo].[City] ([ID], [Name]) VALUES (406, N'Konarak')
INSERT [dbo].[City] ([ID], [Name]) VALUES (407, N'San Nicolás')
INSERT [dbo].[City] ([ID], [Name]) VALUES (408, N'Shisui')
INSERT [dbo].[City] ([ID], [Name]) VALUES (409, N'Kuching')
INSERT [dbo].[City] ([ID], [Name]) VALUES (410, N'Kunduz')
INSERT [dbo].[City] ([ID], [Name]) VALUES (411, N'Poponcol')
INSERT [dbo].[City] ([ID], [Name]) VALUES (412, N'Galugah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (413, N'Xinli')
INSERT [dbo].[City] ([ID], [Name]) VALUES (414, N'Bordeaux')
INSERT [dbo].[City] ([ID], [Name]) VALUES (415, N'Sampaloc')
INSERT [dbo].[City] ([ID], [Name]) VALUES (416, N'Teófilo Otoni')
INSERT [dbo].[City] ([ID], [Name]) VALUES (417, N'Paseka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (418, N'Shizi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (419, N'Tagiura')
INSERT [dbo].[City] ([ID], [Name]) VALUES (420, N'Gaide')
INSERT [dbo].[City] ([ID], [Name]) VALUES (421, N'Houping')
INSERT [dbo].[City] ([ID], [Name]) VALUES (422, N'Bamiantong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (423, N'Anticala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (424, N'Krmelín')
INSERT [dbo].[City] ([ID], [Name]) VALUES (425, N'Sharjah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (426, N'Taoyuan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (427, N'Shangcun')
INSERT [dbo].[City] ([ID], [Name]) VALUES (428, N'Zliv')
INSERT [dbo].[City] ([ID], [Name]) VALUES (429, N'Manuel Cavazos Lerma')
INSERT [dbo].[City] ([ID], [Name]) VALUES (430, N'Laboulaye')
INSERT [dbo].[City] ([ID], [Name]) VALUES (431, N'Karangan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (432, N'Besko')
INSERT [dbo].[City] ([ID], [Name]) VALUES (433, N'Santa Elena')
INSERT [dbo].[City] ([ID], [Name]) VALUES (434, N'Shuangqiaoping')
INSERT [dbo].[City] ([ID], [Name]) VALUES (435, N'Arrën')
INSERT [dbo].[City] ([ID], [Name]) VALUES (436, N'Kedungharjo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (437, N'Bileca')
INSERT [dbo].[City] ([ID], [Name]) VALUES (438, N'Panggungasri')
INSERT [dbo].[City] ([ID], [Name]) VALUES (439, N'Caen')
INSERT [dbo].[City] ([ID], [Name]) VALUES (440, N'Arvayheer')
INSERT [dbo].[City] ([ID], [Name]) VALUES (441, N'Naleczów')
INSERT [dbo].[City] ([ID], [Name]) VALUES (442, N'Mainang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (443, N'Aral')
INSERT [dbo].[City] ([ID], [Name]) VALUES (444, N'Changling')
INSERT [dbo].[City] ([ID], [Name]) VALUES (445, N'Young')
INSERT [dbo].[City] ([ID], [Name]) VALUES (446, N'Paraty')
INSERT [dbo].[City] ([ID], [Name]) VALUES (447, N'Dragash')
INSERT [dbo].[City] ([ID], [Name]) VALUES (448, N'Potosí')
INSERT [dbo].[City] ([ID], [Name]) VALUES (449, N'Bang Pakong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (450, N'Rengo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (451, N'Fojo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (452, N'El Soberbio')
INSERT [dbo].[City] ([ID], [Name]) VALUES (453, N'Terpsithéa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (454, N'Xindu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (455, N'Fiais da Beira')
INSERT [dbo].[City] ([ID], [Name]) VALUES (456, N'Zarów')
INSERT [dbo].[City] ([ID], [Name]) VALUES (457, N'Youzai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (458, N'La Paz de Oriente')
INSERT [dbo].[City] ([ID], [Name]) VALUES (459, N'Xiahong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (460, N'Dadeldhura')
INSERT [dbo].[City] ([ID], [Name]) VALUES (461, N'Dangbigih')
INSERT [dbo].[City] ([ID], [Name]) VALUES (462, N'Glasgow')
INSERT [dbo].[City] ([ID], [Name]) VALUES (463, N'Sambirobyong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (464, N'Podwilk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (465, N'Bantawora')
INSERT [dbo].[City] ([ID], [Name]) VALUES (466, N'Nice')
INSERT [dbo].[City] ([ID], [Name]) VALUES (467, N'Paynjuwayn')
INSERT [dbo].[City] ([ID], [Name]) VALUES (468, N'Balitai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (469, N'Qinjia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (470, N'Kompaniyivka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (471, N'Tidili Mesfioua')
INSERT [dbo].[City] ([ID], [Name]) VALUES (472, N'Viljakkala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (473, N'Le Bourget-du-Lac')
INSERT [dbo].[City] ([ID], [Name]) VALUES (474, N'Ilopango')
INSERT [dbo].[City] ([ID], [Name]) VALUES (475, N'Pomar')
INSERT [dbo].[City] ([ID], [Name]) VALUES (476, N'Ozubulu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (477, N'Zhongying')
INSERT [dbo].[City] ([ID], [Name]) VALUES (478, N'Xilian')
INSERT [dbo].[City] ([ID], [Name]) VALUES (479, N'Oni')
INSERT [dbo].[City] ([ID], [Name]) VALUES (480, N'Zhangping')
INSERT [dbo].[City] ([ID], [Name]) VALUES (481, N'Santol')
INSERT [dbo].[City] ([ID], [Name]) VALUES (482, N'Bazzaryah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (483, N'Yingkeng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (484, N'Cibenda')
INSERT [dbo].[City] ([ID], [Name]) VALUES (485, N'Oslo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (486, N'Santa Fe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (487, N'Yanghong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (488, N'Maastricht')
INSERT [dbo].[City] ([ID], [Name]) VALUES (489, N'Tsetsegnuur')
INSERT [dbo].[City] ([ID], [Name]) VALUES (490, N'Dagui')
INSERT [dbo].[City] ([ID], [Name]) VALUES (491, N'Pantalowice')
INSERT [dbo].[City] ([ID], [Name]) VALUES (492, N'Sihanoukville')
INSERT [dbo].[City] ([ID], [Name]) VALUES (493, N'Yihe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (494, N'Grosuplje')
INSERT [dbo].[City] ([ID], [Name]) VALUES (495, N'San Bernardo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (496, N'Ngepoh Kidul')
INSERT [dbo].[City] ([ID], [Name]) VALUES (497, N'Jimaguayú')
INSERT [dbo].[City] ([ID], [Name]) VALUES (498, N'Vigia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (499, N'Necoclí')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (500, N'Curug')
INSERT [dbo].[City] ([ID], [Name]) VALUES (501, N'Bicesse')
INSERT [dbo].[City] ([ID], [Name]) VALUES (502, N'Baohe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (503, N'Yelyzavethradka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (504, N'Xilian')
INSERT [dbo].[City] ([ID], [Name]) VALUES (505, N'Baleber')
INSERT [dbo].[City] ([ID], [Name]) VALUES (506, N'Bhopalwala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (507, N'Svenljunga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (508, N'Marinha')
INSERT [dbo].[City] ([ID], [Name]) VALUES (509, N'Aligudarz')
INSERT [dbo].[City] ([ID], [Name]) VALUES (510, N'Ciparakan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (511, N'Jielin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (512, N'Spétses')
INSERT [dbo].[City] ([ID], [Name]) VALUES (513, N'Besançon')
INSERT [dbo].[City] ([ID], [Name]) VALUES (514, N'Pavia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (515, N'Inta')
INSERT [dbo].[City] ([ID], [Name]) VALUES (516, N'Pedregal')
INSERT [dbo].[City] ([ID], [Name]) VALUES (517, N'Nogueira')
INSERT [dbo].[City] ([ID], [Name]) VALUES (518, N'Novoye Devyatkino')
INSERT [dbo].[City] ([ID], [Name]) VALUES (519, N'Nalus')
INSERT [dbo].[City] ([ID], [Name]) VALUES (520, N'Wuduhe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (521, N'Orós')
INSERT [dbo].[City] ([ID], [Name]) VALUES (522, N'Kampungbaru')
INSERT [dbo].[City] ([ID], [Name]) VALUES (523, N'Itigi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (524, N'Bogorame')
INSERT [dbo].[City] ([ID], [Name]) VALUES (525, N'Cox’s Bazar')
INSERT [dbo].[City] ([ID], [Name]) VALUES (526, N'Mórrope')
INSERT [dbo].[City] ([ID], [Name]) VALUES (527, N'Dinggou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (528, N'Albania')
INSERT [dbo].[City] ([ID], [Name]) VALUES (529, N'Vallentuna')
INSERT [dbo].[City] ([ID], [Name]) VALUES (530, N'Dzhubga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (531, N'Jima')
INSERT [dbo].[City] ([ID], [Name]) VALUES (532, N'Silver Spring')
INSERT [dbo].[City] ([ID], [Name]) VALUES (533, N'Yanagawa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (534, N'Falun')
INSERT [dbo].[City] ([ID], [Name]) VALUES (535, N'Nanmo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (536, N'Carvalhais')
INSERT [dbo].[City] ([ID], [Name]) VALUES (537, N'Lexington')
INSERT [dbo].[City] ([ID], [Name]) VALUES (538, N'Tekeli')
INSERT [dbo].[City] ([ID], [Name]) VALUES (539, N'Culeng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (540, N'Colca')
INSERT [dbo].[City] ([ID], [Name]) VALUES (541, N'Tambaksari')
INSERT [dbo].[City] ([ID], [Name]) VALUES (542, N'Tempaling')
INSERT [dbo].[City] ([ID], [Name]) VALUES (543, N'Wentang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (544, N'Pampanito')
INSERT [dbo].[City] ([ID], [Name]) VALUES (545, N'Yueyahe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (546, N'Hong’an')
INSERT [dbo].[City] ([ID], [Name]) VALUES (547, N'Palguyod')
INSERT [dbo].[City] ([ID], [Name]) VALUES (548, N'Caringin Lor')
INSERT [dbo].[City] ([ID], [Name]) VALUES (549, N'Portland')
INSERT [dbo].[City] ([ID], [Name]) VALUES (550, N'Svecha')
INSERT [dbo].[City] ([ID], [Name]) VALUES (551, N'Karlovo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (552, N'Zafarwal')
INSERT [dbo].[City] ([ID], [Name]) VALUES (553, N'Numata')
INSERT [dbo].[City] ([ID], [Name]) VALUES (554, N'Minnedosa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (555, N'Putina')
INSERT [dbo].[City] ([ID], [Name]) VALUES (556, N'Sukadana')
INSERT [dbo].[City] ([ID], [Name]) VALUES (557, N'Hinlayagan Ilaud')
INSERT [dbo].[City] ([ID], [Name]) VALUES (558, N'Houba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (559, N'Sjöbo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (560, N'Alexandria')
INSERT [dbo].[City] ([ID], [Name]) VALUES (561, N'Krajan Satu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (562, N'Cochadas')
INSERT [dbo].[City] ([ID], [Name]) VALUES (563, N'Baishan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (564, N'Cikuya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (565, N'Brzeznica')
INSERT [dbo].[City] ([ID], [Name]) VALUES (566, N'Bélel')
INSERT [dbo].[City] ([ID], [Name]) VALUES (567, N'General Arenales')
INSERT [dbo].[City] ([ID], [Name]) VALUES (568, N'Zdenci')
INSERT [dbo].[City] ([ID], [Name]) VALUES (569, N'Jembangan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (570, N'Khafizan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (571, N'Brahin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (572, N'Kozyatyn')
INSERT [dbo].[City] ([ID], [Name]) VALUES (573, N'Zagórze')
INSERT [dbo].[City] ([ID], [Name]) VALUES (574, N'Cabannungan Second')
INSERT [dbo].[City] ([ID], [Name]) VALUES (575, N'Zhangjiafang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (576, N'Hepu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (577, N'Bangolo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (578, N'Örebro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (579, N'Svetlograd')
INSERT [dbo].[City] ([ID], [Name]) VALUES (580, N'Odivelas')
INSERT [dbo].[City] ([ID], [Name]) VALUES (581, N'Morez')
INSERT [dbo].[City] ([ID], [Name]) VALUES (582, N'Tabuc Pontevedra')
INSERT [dbo].[City] ([ID], [Name]) VALUES (583, N'Morteros')
INSERT [dbo].[City] ([ID], [Name]) VALUES (584, N'Citeureup')
INSERT [dbo].[City] ([ID], [Name]) VALUES (585, N'Serowe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (586, N'Chanhe')
INSERT [dbo].[City] ([ID], [Name]) VALUES (587, N'Yan Nawa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (588, N'Shreveport')
INSERT [dbo].[City] ([ID], [Name]) VALUES (589, N'Gaojiabu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (590, N'Zhongzhang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (591, N'Gobernador Ingeniero Valentín Virasoro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (592, N'Merefa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (593, N'Tongda')
INSERT [dbo].[City] ([ID], [Name]) VALUES (594, N'Chenfang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (595, N'Yunyan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (596, N'Maogang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (597, N'Kandy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (598, N'Padurung')
INSERT [dbo].[City] ([ID], [Name]) VALUES (599, N'Passos')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (600, N'Polen')
INSERT [dbo].[City] ([ID], [Name]) VALUES (601, N'Villa Carlos Paz')
INSERT [dbo].[City] ([ID], [Name]) VALUES (602, N'Rotunda')
INSERT [dbo].[City] ([ID], [Name]) VALUES (603, N'Dayangqi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (604, N'Kawahmanuk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (605, N'Ubaitaba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (606, N'Corujeira')
INSERT [dbo].[City] ([ID], [Name]) VALUES (607, N'Radimer')
INSERT [dbo].[City] ([ID], [Name]) VALUES (608, N'Krasnaye')
INSERT [dbo].[City] ([ID], [Name]) VALUES (609, N'Kedungkrajan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (610, N'Caomiao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (611, N'Não Me Toque')
INSERT [dbo].[City] ([ID], [Name]) VALUES (612, N'Battung')
INSERT [dbo].[City] ([ID], [Name]) VALUES (613, N'Ganxi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (614, N'Tinumpuk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (615, N'San Narciso')
INSERT [dbo].[City] ([ID], [Name]) VALUES (616, N'Okiot')
INSERT [dbo].[City] ([ID], [Name]) VALUES (617, N'Cambuga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (618, N'Koilás')
INSERT [dbo].[City] ([ID], [Name]) VALUES (619, N'Hongyanxi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (620, N'Saint-Lô')
INSERT [dbo].[City] ([ID], [Name]) VALUES (621, N'Velká Bystrice')
INSERT [dbo].[City] ([ID], [Name]) VALUES (622, N'Nanmo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (623, N'Fengshuling')
INSERT [dbo].[City] ([ID], [Name]) VALUES (624, N'Labelle')
INSERT [dbo].[City] ([ID], [Name]) VALUES (625, N'Fleury-les-Aubrais')
INSERT [dbo].[City] ([ID], [Name]) VALUES (626, N'Baní')
INSERT [dbo].[City] ([ID], [Name]) VALUES (627, N'Alor Setar')
INSERT [dbo].[City] ([ID], [Name]) VALUES (628, N'Katuli')
INSERT [dbo].[City] ([ID], [Name]) VALUES (629, N'Lingquan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (630, N'Baranovichi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (631, N'Ballitoville')
INSERT [dbo].[City] ([ID], [Name]) VALUES (632, N'Sawin')
INSERT [dbo].[City] ([ID], [Name]) VALUES (633, N'Grodków')
INSERT [dbo].[City] ([ID], [Name]) VALUES (634, N'Aurora')
INSERT [dbo].[City] ([ID], [Name]) VALUES (635, N'Luna')
INSERT [dbo].[City] ([ID], [Name]) VALUES (636, N'Luhanka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (637, N'Dukuh Kaler')
INSERT [dbo].[City] ([ID], [Name]) VALUES (638, N'Banatsko Karadordevo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (639, N'Al Jumum')
INSERT [dbo].[City] ([ID], [Name]) VALUES (640, N'Al ?affah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (641, N'Quipot')
INSERT [dbo].[City] ([ID], [Name]) VALUES (642, N'Lop')
INSERT [dbo].[City] ([ID], [Name]) VALUES (643, N'Luleå')
INSERT [dbo].[City] ([ID], [Name]) VALUES (644, N'Kompaniyivka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (645, N'Torbeyevo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (646, N'Qirmizi Samux')
INSERT [dbo].[City] ([ID], [Name]) VALUES (647, N'Nonsan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (648, N'Fundación')
INSERT [dbo].[City] ([ID], [Name]) VALUES (649, N'Belogorskiy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (650, N'Igarapé Miri')
INSERT [dbo].[City] ([ID], [Name]) VALUES (651, N'Dikirnis')
INSERT [dbo].[City] ([ID], [Name]) VALUES (652, N'Lamatuka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (653, N'Phonphisai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (654, N'Adjumani')
INSERT [dbo].[City] ([ID], [Name]) VALUES (655, N'Trindade')
INSERT [dbo].[City] ([ID], [Name]) VALUES (656, N'Khe Tre')
INSERT [dbo].[City] ([ID], [Name]) VALUES (657, N'Baraba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (658, N'Châtellerault')
INSERT [dbo].[City] ([ID], [Name]) VALUES (659, N'Gugut')
INSERT [dbo].[City] ([ID], [Name]) VALUES (660, N'Had Kourt')
INSERT [dbo].[City] ([ID], [Name]) VALUES (661, N'Vecumnieki')
INSERT [dbo].[City] ([ID], [Name]) VALUES (662, N'Richmond')
INSERT [dbo].[City] ([ID], [Name]) VALUES (663, N'Tipo-Tipo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (664, N'Paobokol')
INSERT [dbo].[City] ([ID], [Name]) VALUES (665, N'Huanchaco')
INSERT [dbo].[City] ([ID], [Name]) VALUES (666, N'Hougang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (667, N'Barabedang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (668, N'Kilafors')
INSERT [dbo].[City] ([ID], [Name]) VALUES (669, N'Sargatskoye')
INSERT [dbo].[City] ([ID], [Name]) VALUES (670, N'Zhangzhu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (671, N'Karangbaru')
INSERT [dbo].[City] ([ID], [Name]) VALUES (672, N'Banqiao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (673, N'Jincheng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (674, N'Demak')
INSERT [dbo].[City] ([ID], [Name]) VALUES (675, N'Gandu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (676, N'Bombu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (677, N'Cusco')
INSERT [dbo].[City] ([ID], [Name]) VALUES (678, N'Providencia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (679, N'Guangfu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (680, N'Huangqiang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (681, N'Tagapul-an')
INSERT [dbo].[City] ([ID], [Name]) VALUES (682, N'Vista Hermosa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (683, N'Neikeng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (684, N'Pailiao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (685, N'Bajingzi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (686, N'Fenghuanglu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (687, N'Saint-Priest-en-Jarez')
INSERT [dbo].[City] ([ID], [Name]) VALUES (688, N'Tangxian')
INSERT [dbo].[City] ([ID], [Name]) VALUES (689, N'Banjar Kawan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (690, N'Yermolayevo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (691, N'Shishang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (692, N'Saginaw')
INSERT [dbo].[City] ([ID], [Name]) VALUES (693, N'Chitungwiza')
INSERT [dbo].[City] ([ID], [Name]) VALUES (694, N'Charlotte')
INSERT [dbo].[City] ([ID], [Name]) VALUES (695, N'Huangqiao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (696, N'Vodstroy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (697, N'Oro Timur')
INSERT [dbo].[City] ([ID], [Name]) VALUES (698, N'Shah Alam')
INSERT [dbo].[City] ([ID], [Name]) VALUES (699, N'Osieczna')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (700, N'Longhua')
INSERT [dbo].[City] ([ID], [Name]) VALUES (701, N'Taradale')
INSERT [dbo].[City] ([ID], [Name]) VALUES (702, N'Maddela')
INSERT [dbo].[City] ([ID], [Name]) VALUES (703, N'Pravda')
INSERT [dbo].[City] ([ID], [Name]) VALUES (704, N'Campelos')
INSERT [dbo].[City] ([ID], [Name]) VALUES (705, N'Xiwang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (706, N'Napak')
INSERT [dbo].[City] ([ID], [Name]) VALUES (707, N'Zagórnik')
INSERT [dbo].[City] ([ID], [Name]) VALUES (708, N'Malaryta')
INSERT [dbo].[City] ([ID], [Name]) VALUES (709, N'Ribeiro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (710, N'Luba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (711, N'Anticala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (712, N'Shidu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (713, N'Sydney')
INSERT [dbo].[City] ([ID], [Name]) VALUES (714, N'Th? Tr?n Pác Mi?u')
INSERT [dbo].[City] ([ID], [Name]) VALUES (715, N'Debrecen')
INSERT [dbo].[City] ([ID], [Name]) VALUES (716, N'Shuangzhong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (717, N'Dashev')
INSERT [dbo].[City] ([ID], [Name]) VALUES (718, N'Marechal Deodoro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (719, N'Guisijan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (720, N'Xia Dawo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (721, N'Barreiro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (722, N'Huaihua')
INSERT [dbo].[City] ([ID], [Name]) VALUES (723, N'Heshui')
INSERT [dbo].[City] ([ID], [Name]) VALUES (724, N'Dasht-e Lati')
INSERT [dbo].[City] ([ID], [Name]) VALUES (725, N'Vysehrad')
INSERT [dbo].[City] ([ID], [Name]) VALUES (726, N'Manjo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (727, N'Th? Tr?n Vi?t Lâm')
INSERT [dbo].[City] ([ID], [Name]) VALUES (728, N'Leiyang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (729, N'Wupu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (730, N'Penanggapan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (731, N'Fengshan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (732, N'Hultsfred')
INSERT [dbo].[City] ([ID], [Name]) VALUES (733, N'Georgetown')
INSERT [dbo].[City] ([ID], [Name]) VALUES (734, N'Madang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (735, N'Beloostrov')
INSERT [dbo].[City] ([ID], [Name]) VALUES (736, N'Goryachevodskiy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (737, N'Socorro')
INSERT [dbo].[City] ([ID], [Name]) VALUES (738, N'Jeponkrajan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (739, N'Kasama')
INSERT [dbo].[City] ([ID], [Name]) VALUES (740, N'Wau')
INSERT [dbo].[City] ([ID], [Name]) VALUES (741, N'Makarov')
INSERT [dbo].[City] ([ID], [Name]) VALUES (742, N'Komorní Lhotka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (743, N'Limín Khersonísou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (744, N'Néa Plágia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (745, N'Masjid')
INSERT [dbo].[City] ([ID], [Name]) VALUES (746, N'Korfovskiy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (747, N'Pescadería')
INSERT [dbo].[City] ([ID], [Name]) VALUES (748, N'Pampas Chico')
INSERT [dbo].[City] ([ID], [Name]) VALUES (749, N'Yinji')
INSERT [dbo].[City] ([ID], [Name]) VALUES (750, N'Jorok Dalam')
INSERT [dbo].[City] ([ID], [Name]) VALUES (751, N'Aranos')
INSERT [dbo].[City] ([ID], [Name]) VALUES (752, N'Watuweri')
INSERT [dbo].[City] ([ID], [Name]) VALUES (753, N'Doruchów')
INSERT [dbo].[City] ([ID], [Name]) VALUES (754, N'Nobinobi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (755, N'Kruševac')
INSERT [dbo].[City] ([ID], [Name]) VALUES (756, N'Tarariras')
INSERT [dbo].[City] ([ID], [Name]) VALUES (757, N'Cabak Satu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (758, N'Th? Tr?n Van Quan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (759, N'Josefina')
INSERT [dbo].[City] ([ID], [Name]) VALUES (760, N'Cikarang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (761, N'Angren')
INSERT [dbo].[City] ([ID], [Name]) VALUES (762, N'Mainit')
INSERT [dbo].[City] ([ID], [Name]) VALUES (763, N'Jucás')
INSERT [dbo].[City] ([ID], [Name]) VALUES (764, N'Rosario de Lerma')
INSERT [dbo].[City] ([ID], [Name]) VALUES (765, N'Voskresensk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (766, N'Sandaowan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (767, N'Arboga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (768, N'Salitral')
INSERT [dbo].[City] ([ID], [Name]) VALUES (769, N'Despotovac')
INSERT [dbo].[City] ([ID], [Name]) VALUES (770, N'Bagjasari')
INSERT [dbo].[City] ([ID], [Name]) VALUES (771, N'Ban Na Muang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (772, N'Purwodadi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (773, N'Rizal')
INSERT [dbo].[City] ([ID], [Name]) VALUES (774, N'Ras al-Khaimah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (775, N'Azogues')
INSERT [dbo].[City] ([ID], [Name]) VALUES (776, N'Ituverava')
INSERT [dbo].[City] ([ID], [Name]) VALUES (777, N'Velika')
INSERT [dbo].[City] ([ID], [Name]) VALUES (778, N'Zhujiaqiao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (779, N'Bridgewater')
INSERT [dbo].[City] ([ID], [Name]) VALUES (780, N'Bratsk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (781, N'Toulouse')
INSERT [dbo].[City] ([ID], [Name]) VALUES (782, N'Akashi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (783, N'Makamba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (784, N'Tabwakea Village')
INSERT [dbo].[City] ([ID], [Name]) VALUES (785, N'Farasan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (786, N'Shuizhai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (787, N'Cimanggu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (788, N'Cândido Mota')
INSERT [dbo].[City] ([ID], [Name]) VALUES (789, N'Wenwuba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (790, N'Herval')
INSERT [dbo].[City] ([ID], [Name]) VALUES (791, N'Ilembula')
INSERT [dbo].[City] ([ID], [Name]) VALUES (792, N'Chino')
INSERT [dbo].[City] ([ID], [Name]) VALUES (793, N'Laiya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (794, N'Gorzów Slaski')
INSERT [dbo].[City] ([ID], [Name]) VALUES (795, N'Oranzherei')
INSERT [dbo].[City] ([ID], [Name]) VALUES (796, N'Palmira')
INSERT [dbo].[City] ([ID], [Name]) VALUES (797, N'København')
INSERT [dbo].[City] ([ID], [Name]) VALUES (798, N'Santa Nino')
INSERT [dbo].[City] ([ID], [Name]) VALUES (799, N'Despotovac')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (800, N'Chesapeake')
INSERT [dbo].[City] ([ID], [Name]) VALUES (801, N'Ivanteyevka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (802, N'New York City')
INSERT [dbo].[City] ([ID], [Name]) VALUES (803, N'São Miguel de Machede')
INSERT [dbo].[City] ([ID], [Name]) VALUES (804, N'Xiangtan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (805, N'Puerto Rico')
INSERT [dbo].[City] ([ID], [Name]) VALUES (806, N'Mbala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (807, N'Trollhättan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (808, N'Koungheul')
INSERT [dbo].[City] ([ID], [Name]) VALUES (809, N'Cabaret')
INSERT [dbo].[City] ([ID], [Name]) VALUES (810, N'Talalora')
INSERT [dbo].[City] ([ID], [Name]) VALUES (811, N'Spirovo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (812, N'Xinxing')
INSERT [dbo].[City] ([ID], [Name]) VALUES (813, N'San Marcos')
INSERT [dbo].[City] ([ID], [Name]) VALUES (814, N'Guanchao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (815, N'Portel')
INSERT [dbo].[City] ([ID], [Name]) VALUES (816, N'Nizhniy Tagil')
INSERT [dbo].[City] ([ID], [Name]) VALUES (817, N'Maying')
INSERT [dbo].[City] ([ID], [Name]) VALUES (818, N'Kenarilang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (819, N'Tigbaw')
INSERT [dbo].[City] ([ID], [Name]) VALUES (820, N'Dongtian')
INSERT [dbo].[City] ([ID], [Name]) VALUES (821, N'Uniejów')
INSERT [dbo].[City] ([ID], [Name]) VALUES (822, N'Freetown')
INSERT [dbo].[City] ([ID], [Name]) VALUES (823, N'Lidoríki')
INSERT [dbo].[City] ([ID], [Name]) VALUES (824, N'Onan Ganjang Satu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (825, N'Horodyshche')
INSERT [dbo].[City] ([ID], [Name]) VALUES (826, N'Mulhouse')
INSERT [dbo].[City] ([ID], [Name]) VALUES (827, N'Qarawat Bani Zayd')
INSERT [dbo].[City] ([ID], [Name]) VALUES (828, N'Guitang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (829, N'Babug')
INSERT [dbo].[City] ([ID], [Name]) VALUES (830, N'Manujan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (831, N'Kanshi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (832, N'Tlogocilik')
INSERT [dbo].[City] ([ID], [Name]) VALUES (833, N'Guojiaba')
INSERT [dbo].[City] ([ID], [Name]) VALUES (834, N'Atambua')
INSERT [dbo].[City] ([ID], [Name]) VALUES (835, N'San Cosme y Damián')
INSERT [dbo].[City] ([ID], [Name]) VALUES (836, N'Svetlyy Yar')
INSERT [dbo].[City] ([ID], [Name]) VALUES (837, N'Menghai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (838, N'Zigong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (839, N'Huainan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (840, N'Neftçala')
INSERT [dbo].[City] ([ID], [Name]) VALUES (841, N'Punolu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (842, N'Tirhanimîne')
INSERT [dbo].[City] ([ID], [Name]) VALUES (843, N'Zhougao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (844, N'Shirvan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (845, N'Huikou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (846, N'Lamphun')
INSERT [dbo].[City] ([ID], [Name]) VALUES (847, N'Domaradz')
INSERT [dbo].[City] ([ID], [Name]) VALUES (848, N'Santa Barbara')
INSERT [dbo].[City] ([ID], [Name]) VALUES (849, N'Candelaria')
INSERT [dbo].[City] ([ID], [Name]) VALUES (850, N'Pitai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (851, N'San Diego')
INSERT [dbo].[City] ([ID], [Name]) VALUES (852, N'Oklahoma City')
INSERT [dbo].[City] ([ID], [Name]) VALUES (853, N'Alhambra')
INSERT [dbo].[City] ([ID], [Name]) VALUES (854, N'Pruszków')
INSERT [dbo].[City] ([ID], [Name]) VALUES (855, N'Cisitu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (856, N'Gourcy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (857, N'Villejuif')
INSERT [dbo].[City] ([ID], [Name]) VALUES (858, N'Lang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (859, N'Haradok')
INSERT [dbo].[City] ([ID], [Name]) VALUES (860, N'Dadamtu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (861, N'Hengshui')
INSERT [dbo].[City] ([ID], [Name]) VALUES (862, N'Hihya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (863, N'Marseille')
INSERT [dbo].[City] ([ID], [Name]) VALUES (864, N'Sollebrunn')
INSERT [dbo].[City] ([ID], [Name]) VALUES (865, N'South River')
INSERT [dbo].[City] ([ID], [Name]) VALUES (866, N'Wonosari')
INSERT [dbo].[City] ([ID], [Name]) VALUES (867, N'Lebedyn')
INSERT [dbo].[City] ([ID], [Name]) VALUES (868, N'Wongka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (869, N'Karanganyar')
INSERT [dbo].[City] ([ID], [Name]) VALUES (870, N'Abbeville')
INSERT [dbo].[City] ([ID], [Name]) VALUES (871, N'Radomir')
INSERT [dbo].[City] ([ID], [Name]) VALUES (872, N'Bagakay')
INSERT [dbo].[City] ([ID], [Name]) VALUES (873, N'Lapachito')
INSERT [dbo].[City] ([ID], [Name]) VALUES (874, N'Fauske')
INSERT [dbo].[City] ([ID], [Name]) VALUES (875, N'Jinping')
INSERT [dbo].[City] ([ID], [Name]) VALUES (876, N'Kalanchak')
INSERT [dbo].[City] ([ID], [Name]) VALUES (877, N'Kedungsinggil')
INSERT [dbo].[City] ([ID], [Name]) VALUES (878, N'Goryachevodskiy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (879, N'Reserva')
INSERT [dbo].[City] ([ID], [Name]) VALUES (880, N'Fushan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (881, N'Dzuunmod')
INSERT [dbo].[City] ([ID], [Name]) VALUES (882, N'Rukungiri')
INSERT [dbo].[City] ([ID], [Name]) VALUES (883, N'Houmt Souk')
INSERT [dbo].[City] ([ID], [Name]) VALUES (884, N'Dana')
INSERT [dbo].[City] ([ID], [Name]) VALUES (885, N'Steinkjer')
INSERT [dbo].[City] ([ID], [Name]) VALUES (886, N'Portela')
INSERT [dbo].[City] ([ID], [Name]) VALUES (887, N'Staraya Toropa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (888, N'Longxing')
INSERT [dbo].[City] ([ID], [Name]) VALUES (889, N'Nisí')
INSERT [dbo].[City] ([ID], [Name]) VALUES (890, N'Xianren')
INSERT [dbo].[City] ([ID], [Name]) VALUES (891, N'Morón')
INSERT [dbo].[City] ([ID], [Name]) VALUES (892, N'Amado Nervo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (893, N'Quiruvilca')
INSERT [dbo].[City] ([ID], [Name]) VALUES (894, N'Viraco')
INSERT [dbo].[City] ([ID], [Name]) VALUES (895, N'Vetluzhskiy')
INSERT [dbo].[City] ([ID], [Name]) VALUES (896, N'Zhangshi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (897, N'Muararupit')
INSERT [dbo].[City] ([ID], [Name]) VALUES (898, N'Sangtian')
INSERT [dbo].[City] ([ID], [Name]) VALUES (899, N'Jiangzhang')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (900, N'Götene')
INSERT [dbo].[City] ([ID], [Name]) VALUES (901, N'Puck')
INSERT [dbo].[City] ([ID], [Name]) VALUES (902, N'Cervená Voda')
INSERT [dbo].[City] ([ID], [Name]) VALUES (903, N'Viekšniai')
INSERT [dbo].[City] ([ID], [Name]) VALUES (904, N'Cirangrang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (905, N'Palmasola')
INSERT [dbo].[City] ([ID], [Name]) VALUES (906, N'Yuandun')
INSERT [dbo].[City] ([ID], [Name]) VALUES (907, N'Greenwood')
INSERT [dbo].[City] ([ID], [Name]) VALUES (908, N'Ten’gushevo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (909, N'George Hill')
INSERT [dbo].[City] ([ID], [Name]) VALUES (910, N'Ngujung')
INSERT [dbo].[City] ([ID], [Name]) VALUES (911, N'Changzhi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (912, N'Milwaukee')
INSERT [dbo].[City] ([ID], [Name]) VALUES (913, N'Priob’ye')
INSERT [dbo].[City] ([ID], [Name]) VALUES (914, N'Suidong')
INSERT [dbo].[City] ([ID], [Name]) VALUES (915, N'Tambangan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (916, N'Nelson')
INSERT [dbo].[City] ([ID], [Name]) VALUES (917, N'Edissiya')
INSERT [dbo].[City] ([ID], [Name]) VALUES (918, N'San Jose')
INSERT [dbo].[City] ([ID], [Name]) VALUES (919, N'London')
INSERT [dbo].[City] ([ID], [Name]) VALUES (920, N'Golovchino')
INSERT [dbo].[City] ([ID], [Name]) VALUES (921, N'Gresik')
INSERT [dbo].[City] ([ID], [Name]) VALUES (922, N'Aurillac')
INSERT [dbo].[City] ([ID], [Name]) VALUES (923, N'Santa Cruz')
INSERT [dbo].[City] ([ID], [Name]) VALUES (924, N'Az Zarbah')
INSERT [dbo].[City] ([ID], [Name]) VALUES (925, N'Th? Tr?n Hùng Qu?c')
INSERT [dbo].[City] ([ID], [Name]) VALUES (926, N'Lowotukan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (927, N'Kalkara')
INSERT [dbo].[City] ([ID], [Name]) VALUES (928, N'Sabana Grande de Palenque')
INSERT [dbo].[City] ([ID], [Name]) VALUES (929, N'Potiskum')
INSERT [dbo].[City] ([ID], [Name]) VALUES (930, N'Paldit')
INSERT [dbo].[City] ([ID], [Name]) VALUES (931, N'Koten')
INSERT [dbo].[City] ([ID], [Name]) VALUES (932, N'Dogarmo')
INSERT [dbo].[City] ([ID], [Name]) VALUES (933, N'Pilzno')
INSERT [dbo].[City] ([ID], [Name]) VALUES (934, N'Suka Makmue')
INSERT [dbo].[City] ([ID], [Name]) VALUES (935, N'Ar Rass')
INSERT [dbo].[City] ([ID], [Name]) VALUES (936, N'Van Nuys')
INSERT [dbo].[City] ([ID], [Name]) VALUES (937, N'Tagapul-an')
INSERT [dbo].[City] ([ID], [Name]) VALUES (938, N'Thabazimbi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (939, N'Zhize')
INSERT [dbo].[City] ([ID], [Name]) VALUES (940, N'Kohat')
INSERT [dbo].[City] ([ID], [Name]) VALUES (941, N'Batagay-Alyta')
INSERT [dbo].[City] ([ID], [Name]) VALUES (942, N'Kuncice pod Ondrejníkem')
INSERT [dbo].[City] ([ID], [Name]) VALUES (943, N'München')
INSERT [dbo].[City] ([ID], [Name]) VALUES (944, N'Luzhany')
INSERT [dbo].[City] ([ID], [Name]) VALUES (945, N'Nogueira')
INSERT [dbo].[City] ([ID], [Name]) VALUES (946, N'Miura')
INSERT [dbo].[City] ([ID], [Name]) VALUES (947, N'Songea')
INSERT [dbo].[City] ([ID], [Name]) VALUES (948, N'Weiqi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (949, N'Mahikeng')
INSERT [dbo].[City] ([ID], [Name]) VALUES (950, N'Baturaden')
INSERT [dbo].[City] ([ID], [Name]) VALUES (951, N'Langres')
INSERT [dbo].[City] ([ID], [Name]) VALUES (952, N'Anávra')
INSERT [dbo].[City] ([ID], [Name]) VALUES (953, N'Rakvere')
INSERT [dbo].[City] ([ID], [Name]) VALUES (954, N'Santa Lucia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (955, N'Gorey')
INSERT [dbo].[City] ([ID], [Name]) VALUES (956, N'Sirnarasa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (957, N'Engenheiro Beltrão')
INSERT [dbo].[City] ([ID], [Name]) VALUES (958, N'Chelles')
INSERT [dbo].[City] ([ID], [Name]) VALUES (959, N'Banjar Beratan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (960, N'Cherëmushki')
INSERT [dbo].[City] ([ID], [Name]) VALUES (961, N'Maguyam')
INSERT [dbo].[City] ([ID], [Name]) VALUES (962, N'Banjar Pedawa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (963, N'Braga')
INSERT [dbo].[City] ([ID], [Name]) VALUES (964, N'Kuhmalahti')
INSERT [dbo].[City] ([ID], [Name]) VALUES (965, N'Donggaocun')
INSERT [dbo].[City] ([ID], [Name]) VALUES (966, N'Oltinko’l')
INSERT [dbo].[City] ([ID], [Name]) VALUES (967, N'Zhapu')
INSERT [dbo].[City] ([ID], [Name]) VALUES (968, N'Juhut')
INSERT [dbo].[City] ([ID], [Name]) VALUES (969, N'São Cristóvão')
INSERT [dbo].[City] ([ID], [Name]) VALUES (970, N'Tuchengzi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (971, N'Sambuluan')
INSERT [dbo].[City] ([ID], [Name]) VALUES (972, N'Eling')
INSERT [dbo].[City] ([ID], [Name]) VALUES (973, N'Ribeira do Pombal')
INSERT [dbo].[City] ([ID], [Name]) VALUES (974, N'Kivertsi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (975, N'Batujaran')
INSERT [dbo].[City] ([ID], [Name]) VALUES (976, N'Gayle')
INSERT [dbo].[City] ([ID], [Name]) VALUES (977, N'Washington')
INSERT [dbo].[City] ([ID], [Name]) VALUES (978, N'Petrodvorets')
INSERT [dbo].[City] ([ID], [Name]) VALUES (979, N'Agriá')
INSERT [dbo].[City] ([ID], [Name]) VALUES (980, N'Luoqiao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (981, N'Seka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (982, N'Xikou')
INSERT [dbo].[City] ([ID], [Name]) VALUES (983, N'Rossosh’')
INSERT [dbo].[City] ([ID], [Name]) VALUES (984, N'Cianorte')
INSERT [dbo].[City] ([ID], [Name]) VALUES (985, N'Kepahiang')
INSERT [dbo].[City] ([ID], [Name]) VALUES (986, N'Beisijiazi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (987, N'Seroa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (988, N'Caparrapí')
INSERT [dbo].[City] ([ID], [Name]) VALUES (989, N'Caucaia')
INSERT [dbo].[City] ([ID], [Name]) VALUES (990, N'Ploso')
INSERT [dbo].[City] ([ID], [Name]) VALUES (991, N'Santa Rita')
INSERT [dbo].[City] ([ID], [Name]) VALUES (992, N'Rudziczka')
INSERT [dbo].[City] ([ID], [Name]) VALUES (993, N'Gnojnica')
INSERT [dbo].[City] ([ID], [Name]) VALUES (994, N'Camilo Aldao')
INSERT [dbo].[City] ([ID], [Name]) VALUES (995, N'Sukaraharja')
INSERT [dbo].[City] ([ID], [Name]) VALUES (996, N'Bunirasa')
INSERT [dbo].[City] ([ID], [Name]) VALUES (997, N'Yingchengzi')
INSERT [dbo].[City] ([ID], [Name]) VALUES (998, N'Koilás')
INSERT [dbo].[City] ([ID], [Name]) VALUES (999, N'Grujugan')
GO
INSERT [dbo].[City] ([ID], [Name]) VALUES (1000, N'Lewodoli')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [Name]) VALUES (3, N'Accident and emergency')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (4, N'Admissions')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (5, N'Anesthetics')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (6, N'Breast Screening')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (7, N'Burn Center (Burn Unit or Burns Unit)')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (8, N'Cardiology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (9, N'Central Sterile Services Department')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (10, N'Coronary Care Unit (CCU)')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (11, N'Diagnostic Imaging')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (12, N'Elderly services')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (13, N'General Services')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (14, N'Gynecology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (15, N'Health & Safety')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (16, N'Infection Control')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (17, N'Maternity')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (18, N'Medical Records')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (19, N'Microbiology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (20, N'Neonatal')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (21, N'Nephrology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (22, N'Neurology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (23, N'Nutrition and Dietetics')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (24, N'Obstetrics/Gynecology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (25, N'Oncology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (26, N'Ophthalmology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (27, N'Orthopaedics')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (28, N'Otolaryngology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (29, N'Ear, Nose, and Throat')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (30, N'Pain Management')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (31, N'Patient Accounts')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (32, N'Patient Services')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (33, N'Pharmacy')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (34, N'Physiotherapy')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (35, N'Purchasing & Supplies')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (36, N'Radiology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (37, N'Radiotherapy')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (38, N'Renal')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (39, N'Rheumatology')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (40, N'Sexual Health')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (41, N'Social Work')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (42, N'Urology')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (1, 24, 1)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (2, 21, 17)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (3, 21, 15)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (4, 17, 29)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (5, 11, 26)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (6, 7, 28)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (7, 3, 9)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (8, 17, 13)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (9, 24, 20)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (10, 25, 26)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (11, 27, 4)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (12, 26, 13)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (13, 12, 21)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (14, 3, 9)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (15, 13, 17)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (16, 12, 23)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (17, 24, 24)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (18, 15, 3)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (19, 17, 13)
INSERT [dbo].[Doctor] ([ID], [StaffID], [SpecialityID]) VALUES (20, 14, 9)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[Inpatient] ON 

INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (1, 48, 12, 33, CAST(N'2018-09-07' AS Date), CAST(N'2021-02-02' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (2, 35, 15, 28, CAST(N'2019-08-17' AS Date), CAST(N'2020-06-25' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (3, 37, 1, 40, CAST(N'2018-06-21' AS Date), CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (4, 44, 25, 8, CAST(N'2018-07-03' AS Date), CAST(N'2021-07-18' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (5, 53, 23, 41, CAST(N'2019-09-15' AS Date), CAST(N'2021-05-12' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (6, 50, 9, 28, CAST(N'2019-06-06' AS Date), CAST(N'2021-01-10' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (7, 55, 1, 38, CAST(N'2019-11-18' AS Date), CAST(N'2021-08-08' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (8, 32, 5, 21, CAST(N'2020-06-14' AS Date), CAST(N'2020-02-05' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (9, 30, 5, 28, CAST(N'2019-01-06' AS Date), CAST(N'2020-04-30' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (10, 31, 11, 16, CAST(N'2019-10-08' AS Date), CAST(N'2020-01-02' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (11, 33, 23, 12, CAST(N'2018-07-19' AS Date), CAST(N'2020-03-18' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (12, 38, 23, 25, CAST(N'2019-12-01' AS Date), CAST(N'2020-05-02' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (13, 59, 14, 27, CAST(N'2019-12-10' AS Date), CAST(N'2020-07-12' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (14, 59, 1, 15, CAST(N'2018-12-10' AS Date), CAST(N'2020-11-11' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (15, 55, 7, 4, CAST(N'2018-10-20' AS Date), CAST(N'2020-06-05' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (16, 38, 30, 16, CAST(N'2019-03-11' AS Date), CAST(N'2020-05-12' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (17, 48, 19, 35, CAST(N'2018-05-09' AS Date), CAST(N'2019-10-16' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (18, 43, 20, 32, CAST(N'2018-03-25' AS Date), CAST(N'2021-04-06' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (19, 33, 7, 31, CAST(N'2019-09-07' AS Date), CAST(N'2020-08-01' AS Date))
INSERT [dbo].[Inpatient] ([ID], [PatientID], [BedID], [DeptID], [DateOfAdmission], [DateOfDischarge]) VALUES (20, 47, 8, 42, CAST(N'2020-01-13' AS Date), CAST(N'2021-03-17' AS Date))
SET IDENTITY_INSERT [dbo].[Inpatient] OFF
SET IDENTITY_INSERT [dbo].[LabOrders] ON 

INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (1, 23, N'pede sagittis augue, eu tempor erat neque non quam. Pellentesque', CAST(N'2018-09-29' AS Date), CAST(N'2021-02-28' AS Date), N'metus. In lorem. Donec elementum,')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (2, 22, N'egestas. Sed pharetra, felis eget', CAST(N'2019-05-31' AS Date), CAST(N'2021-03-26' AS Date), N'cursus luctus, ipsum leo')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (3, 19, N'montes, nascetur', CAST(N'2020-06-16' AS Date), CAST(N'2021-02-07' AS Date), N'ac, feugiat')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (4, 21, N'velit.', CAST(N'2019-11-11' AS Date), CAST(N'2019-10-28' AS Date), N'ante. Vivamus non lorem vitae odio sagittis')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (5, 16, N'enim. Curabitur massa. Vestibulum accumsan', CAST(N'2020-07-10' AS Date), CAST(N'2020-06-25' AS Date), N'In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (6, 21, N'Nulla aliquet. Proin velit.', CAST(N'2018-06-09' AS Date), CAST(N'2020-12-11' AS Date), N'neque tellus, imperdiet non, vestibulum nec,')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (7, 20, N'non nisi. Aenean eget', CAST(N'2018-02-07' AS Date), CAST(N'2021-01-19' AS Date), N'et, commodo at, libero. Morbi accumsan')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (8, 18, N'nec, euismod in, dolor. Fusce feugiat. Lorem', CAST(N'2018-02-05' AS Date), CAST(N'2020-01-05' AS Date), N'Proin velit.')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (9, 20, N'quam a', CAST(N'2020-08-18' AS Date), CAST(N'2020-08-14' AS Date), N'non, luctus sit')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (10, 17, N'ornare', CAST(N'2020-01-13' AS Date), CAST(N'2020-02-04' AS Date), N'vulputate, nisi sem semper erat, in consectetuer ipsum nunc')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (11, 17, N'justo nec ante. Maecenas', CAST(N'2020-07-16' AS Date), CAST(N'2021-08-18' AS Date), N'risus varius orci, in consequat')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (12, 15, N'Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.', CAST(N'2020-03-19' AS Date), CAST(N'2021-04-19' AS Date), N'Nam ac nulla. In tincidunt')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (13, 19, N'pellentesque a, facilisis non, bibendum', CAST(N'2018-06-26' AS Date), CAST(N'2021-05-22' AS Date), N'consequat purus. Maecenas libero est,')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (14, 18, N'eu, ligula.', CAST(N'2020-08-19' AS Date), CAST(N'2019-11-20' AS Date), N'lobortis ultrices. Vivamus rhoncus. Donec est. Nunc')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (15, 15, N'Sed nunc est, mollis non, cursus non,', CAST(N'2018-05-02' AS Date), CAST(N'2019-12-28' AS Date), N'ridiculus mus. Proin vel nisl. Quisque fringilla euismod')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (16, 15, N'sagittis augue, eu', CAST(N'2020-03-01' AS Date), CAST(N'2021-01-03' AS Date), N'Curabitur egestas nunc sed libero. Proin')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (17, 23, N'tincidunt pede ac urna. Ut tincidunt vehicula', CAST(N'2019-08-23' AS Date), CAST(N'2020-09-27' AS Date), N'laoreet posuere, enim nisl')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (18, 22, N'Nam nulla magna, malesuada vel, convallis in, cursus et, eros.', CAST(N'2018-12-14' AS Date), CAST(N'2021-09-22' AS Date), N'dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (19, 18, N'arcu.', CAST(N'2019-04-13' AS Date), CAST(N'2020-06-30' AS Date), N'Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue')
INSERT [dbo].[LabOrders] ([ID], [AppointmentID], [OrderDetails], [OrderDate], [ResultDate], [LabResults]) VALUES (20, 17, N'Aliquam rutrum lorem ac risus. Morbi metus.', CAST(N'2020-03-28' AS Date), CAST(N'2020-05-11' AS Date), N'eget tincidunt')
SET IDENTITY_INSERT [dbo].[LabOrders] OFF
SET IDENTITY_INSERT [dbo].[Nurse] ON 

INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (11, 15, N'Head Nurse', N'Y')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (12, 9, N'Staff Nurse', N'N')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (13, 11, N'Deputy Charge Nurse', N'Y')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (15, 23, N'Staff Nurse', N'Y')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (16, 6, N'Student Nurse', N'N')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (17, 14, N'Staff Nurse', N'Y')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (18, 18, N'Ward sister', N'N')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (19, 22, N'Staff Nurse', N'Y')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (20, 19, N'Student Nurse', N'N')
INSERT [dbo].[Nurse] ([ID], [StaffID], [Position], [Registered]) VALUES (21, 8, N'Staff Nurse', N'Y')
SET IDENTITY_INSERT [dbo].[Nurse] OFF
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (5, N'Brigid', N'Tommi', N'Marlow', N'656-90-5172', N'Female', CAST(N'2001-08-28' AS Date), 1715608921, N'tmarlow4@github.io', N'Portugal', 5, N'64 Carberry Circle', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (18, N'Loren', N'Even', N'MacCartair', N'171-66-9439', N'Male', CAST(N'2009-04-30' AS Date), 1858869927, N'emaccartairh@mashable.com', N'China', 18, N'8111 Mallard Street', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (29, N'Correy', N'Conant', N'Loveguard', N'193-98-4030', N'Male', CAST(N'1935-11-28' AS Date), 1232020466, N'cloveguards@jalbum.net', N'Brazil', 29, N'3923 Ridge Oak Point', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (30, N'Menard', N'Kleon', N'Webley', N'647-46-4189', N'Male', CAST(N'1971-09-07' AS Date), 6135374989, N'kwebley0@icq.com', N'Vietnam', 1, N'17 Gulseth Terrace', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (31, N'Gertie', N'Alta', N'Edmonson', N'886-92-0941', N'Female', CAST(N'1958-09-03' AS Date), 9355800279, N'aedmonson1@google.es', N'Indonesia', 2, N'025 Warner Drive', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (32, N'Robinetta', N'Hanny', N'Boulden', N'448-79-3502', N'Female', CAST(N'1937-08-26' AS Date), 3446516623, N'hboulden2@un.org', N'China', 3, N'86 Westridge Pass', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (33, N'Helaine', N'Paulie', N'Tubby', N'264-07-6512', N'Female', CAST(N'2020-04-30' AS Date), 2148661612, N'ptubby3@bbc.co.uk', N'United States', 4, N'606 Forest Dale Circle', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (34, N'Lissi', N'Joeann', N'Crucitti', N'620-73-6444', N'Female', CAST(N'1958-10-20' AS Date), 9615156913, N'jcrucitti4@joomla.org', N'Croatia', 5, N'705 Hanover Plaza', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (35, N'Karena', N'Pearla', N'Grzeszczyk', N'783-67-2275', N'Female', CAST(N'1968-11-03' AS Date), 8584556891, N'pgrzeszczyk5@plala.or.jp', N'China', 6, N'976 Birchwood Pass', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (36, N'Abbe', N'Olia', N'Pischoff', N'672-50-7601', N'Female', CAST(N'1969-01-10' AS Date), 8398175864, N'opischoff6@about.me', N'Czech Republic', 7, N'65 Twin Pines Trail', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (37, N'Allegra', N'Vikky', N'Postlewhite', N'515-24-7202', N'Female', CAST(N'1984-12-06' AS Date), 8186042220, N'vpostlewhite7@webnode.com', N'China', 8, N'2 Service Way', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (38, N'Audrye', N'Kati', N'Pride', N'792-05-2223', N'Female', CAST(N'1991-07-29' AS Date), 2914762020, N'kpride8@51.la', N'Portugal', 9, N'4 Monterey Way', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (39, N'Gavra', N'Helaine', N'Rowthorn', N'178-71-9438', N'Female', CAST(N'1988-07-08' AS Date), 9551077803, N'hrowthorn9@cam.ac.uk', N'Sweden', 10, N'5215 Rusk Trail', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (40, N'Kelcie', N'Alayne', N'Rought', N'279-43-8153', N'Female', CAST(N'1982-12-18' AS Date), 9598256677, N'aroughta@unblog.fr', N'China', 11, N'04 Kenwood Road', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (41, N'Bernardina', N'Vanya', N'Nerne', N'650-33-2846', N'Female', CAST(N'1988-03-23' AS Date), 8398838884, N'vnerneb@eventbrite.com', N'France', 12, N'81029 Hagan Lane', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (42, N'Keenan', N'Joe', N'Huller', N'467-37-7470', N'Male', CAST(N'1934-05-23' AS Date), 3872448272, N'jhullerc@reverbnation.com', N'Venezuela', 13, N'43196 Heffernan Center', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (43, N'Livia', N'Lauryn', N'Persian', N'389-85-9117', N'Female', CAST(N'1960-08-31' AS Date), 7622947711, N'lpersiand@cnn.com', N'Hungary', 14, N'6805 Old Shore Center', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (44, N'Jena', N'Joice', N'McKinnon', N'867-26-4599', N'Female', CAST(N'1992-12-28' AS Date), 8128775909, N'jmckinnone@soundcloud.com', N'Russia', 15, N'9 Comanche Point', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (45, N'Romy', N'Althea', N'Montacute', N'229-95-9326', N'Female', CAST(N'1964-01-19' AS Date), 9808298804, N'amontacutef@stumbleupon.com', N'Mauritius', 16, N'955 Carioca Drive', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (46, N'Editha', N'Bunny', N'Geistbeck', N'274-93-4862', N'Female', CAST(N'1994-12-14' AS Date), 3167480885, N'bgeistbeckg@redcross.org', N'Indonesia', 17, N'1 Crowley Junction', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (47, N'Yettie', N'Ekaterina', N'Pikhno', N'727-39-1765', N'Female', CAST(N'1997-04-05' AS Date), 2516616815, N'epikhnoh@wunderground.com', N'Czech Republic', 18, N'76545 Russell Hill', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (48, N'Aundrea', N'Marion', N'Guwer', N'833-49-8232', N'Female', CAST(N'1975-02-04' AS Date), 3325790716, N'mguweri@scientificamerican.com', N'Philippines', 19, N'794 Toban Street', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (49, N'Andrej', N'Benedict', N'Orr', N'425-38-0081', N'Male', CAST(N'1952-04-16' AS Date), 2882260146, N'borrj@webmd.com', N'China', 20, N'992 Spenser Circle', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (50, N'Arin', N'Johan', N'Madre', N'308-81-4775', N'Male', CAST(N'1948-05-28' AS Date), 5365574346, N'jmadrek@lulu.com', N'Greece', 21, N'44 Becker Alley', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (51, N'Bryan', N'Markos', N'Ferby', N'798-18-4603', N'Male', CAST(N'1999-08-10' AS Date), 8299504583, N'mferbyl@mlb.com', N'Mexico', 22, N'33139 Canary Terrace', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (52, N'Ham', N'Aylmer', N'Schade', N'417-21-5903', N'Male', CAST(N'2014-04-25' AS Date), 8827515606, N'aschadem@businesswire.com', N'France', 23, N'0 Farmco Terrace', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (53, N'Sharlene', N'Terri-jo', N'Hinder', N'451-49-3842', N'Female', CAST(N'1950-11-20' AS Date), 7242062863, N'thindern@yahoo.com', N'Mexico', 24, N'93120 Buhler Alley', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (54, N'Marta', N'Virginia', N'Libero', N'154-29-6523', N'Female', CAST(N'1939-07-03' AS Date), 5949475461, N'vliberoo@craigslist.org', N'Indonesia', 25, N'7 Paget Plaza', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (55, N'Anet', N'Kariotta', N'Penvarne', N'151-81-9079', N'Female', CAST(N'1972-10-22' AS Date), 8398299143, N'kpenvarnep@weather.com', N'Portugal', 26, N'528 Nobel Alley', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (56, N'Morris', N'Johny', N'Fost', N'355-60-8349', N'Male', CAST(N'1972-07-13' AS Date), 6128288238, N'jfostq@wikipedia.org', N'Russia', 27, N'3766 Eagle Crest Crossing', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (57, N'Dalia', N'Zorana', N'Esslemont', N'618-08-2733', N'Female', CAST(N'1933-09-10' AS Date), 3557404431, N'zesslemontr@unicef.org', N'Argentina', 28, N'56 Declaration Plaza', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (58, N'Agnesse', N'Fionna', N'Bromley', N'196-73-8255', N'Female', CAST(N'1975-10-19' AS Date), 5843528994, N'fbromleys@bbb.org', N'Brazil', 29, N'3 Clarendon Junction', NULL, NULL)
INSERT [dbo].[Patient] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [Allergies], [ExistingConditions]) VALUES (59, N'Roxine', N'Gwyn', N'Ramsier', N'626-11-6800', N'Female', CAST(N'2013-01-30' AS Date), 8181579560, N'gramsiert@dyndns.org', N'Philippines', 30, N'15921 Barby Park', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (1, 101, N'Single', 1, 1, N't')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (3, 102, N'Single', 1, 1, N't')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (4, 103, N'Single', 1, 1, N't')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (5, 111, N'Single', 1, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (6, 112, N'Single', 1, 2, N't')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (7, 113, N'X-Ray', 1, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (8, 121, N'X-Ray', 1, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (9, 122, N'Single', 1, 3, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (10, 123, N'Single', 1, 3, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (11, 201, N'Ward', 2, 1, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (12, 202, N'Ward', 2, 1, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (13, 203, N'Ward', 2, 1, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (14, 211, N'Ward', 2, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (15, 212, N'Single', 2, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (16, 213, N'Single', 2, 2, N't')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (17, 221, N'Ward Private', 2, 3, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (18, 222, N'Ward Private', 2, 3, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (19, 223, N'Ward Private', 2, 3, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (20, 301, N'Single', 3, 1, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (21, 302, N'Single', 3, 1, N't')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (22, 303, N'Ward', 3, 1, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (23, 311, N'Ward', 3, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (24, 312, N'Theater', 3, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (25, 313, N'Theater', 3, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (26, 321, N'Single', 3, 3, N't')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (27, 322, N'Single', 3, 3, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (28, 323, N'Single', 3, 3, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (29, 401, N'Ward', 4, 1, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (30, 402, N'Ward Private', 4, 1, N't')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (31, 403, N'Ward Private', 4, 1, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (32, 411, N'Single', 4, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (33, 412, N'Single', 4, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (34, 413, N'Single', 4, 2, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (35, 421, N'Ward', 4, 3, N'f')
INSERT [dbo].[Room] ([ID], [RoomNumber], [RoomType], [FloorNumber], [BuildingNumber], [Unavailable]) VALUES (36, 422, N'Ward', 4, 3, N'f')
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (1, N'Audiologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (2, N'Allergist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (3, N'Anesthesiologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (4, N'Cardiologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (5, N'Dentist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (6, N'Dermatologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (7, N'Endocrinologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (8, N'Epidemiologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (9, N'Gynecologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (10, N'Immunologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (11, N'Infectious Disease Specialist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (12, N'Internal Medicine Specialist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (13, N'Medical Geneticist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (14, N'Microbiologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (15, N'Neonatologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (16, N'Neurologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (17, N'Neurosurgeon')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (18, N'Obstetrician')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (19, N'Oncologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (20, N'Orthopedic Surgeon')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (21, N'ENT Specialist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (22, N'Pediatrician')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (23, N'Physiologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (24, N'Plastic Surgeon')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (25, N'Podiatrist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (26, N'Psychiatrist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (27, N'Radiologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (28, N'Rheumatologist')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (29, N'Surgeon')
INSERT [dbo].[Specialities] ([ID], [Name]) VALUES (30, N'Urologist')
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (3, N'Mabel', N'Brenda', N'Northleigh', N'841-69-6284', N'Female', CAST(N'1973-10-08' AS Date), 7295311678, N'bnorthleigh2@dmoz.org', N'Greece', 3, N'11691 Cambridge Plaza', 3, 3)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (4, N'Dre', N'Sondra', N'Pettegre', N'362-54-7212', N'Female', CAST(N'1953-07-03' AS Date), 4095175695, N'spettegre3@google.com', N'Russia', 4, N'7082 Milwaukee Avenue', 4, 4)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (5, N'Elke', N'Margi', N'Shory', N'255-24-5912', N'Female', CAST(N'1956-06-05' AS Date), 6006784528, N'mshory4@chronoengine.com', N'Peru', 5, N'16225 Graceland Point', 5, 5)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (6, N'Bunni', N'Kaja', N'Reijmers', N'811-35-8385', N'Female', CAST(N'1963-10-18' AS Date), 6843255897, N'kreijmers5@google.com.br', N'Portugal', 6, N'351 Thackeray Park', 6, 6)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (7, N'Natka', N'Nicol', N'Di Pietro', N'393-63-2307', N'Female', CAST(N'1970-06-30' AS Date), 1732559981, N'ndipietro6@about.me', N'Spain', 7, N'6 Weeping Birch Road', 7, 7)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (8, N'Chadwick', N'Artemus', N'McNeish', N'139-48-9997', N'Male', CAST(N'1971-04-27' AS Date), 2416933946, N'amcneish7@imdb.com', N'China', 8, N'45908 Luster Circle', 8, 8)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (9, N'Farleigh', N'Anatol', N'McGaugan', N'395-25-0510', N'Male', CAST(N'1956-04-07' AS Date), 4407020255, N'amcgaugan8@loc.gov', N'South Africa', 9, N'77 Calypso Way', 9, 8)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (10, N'Fredra', N'Loella', N'Brayson', N'659-29-5122', N'Female', CAST(N'1998-09-08' AS Date), 1929533781, N'lbrayson9@blinklist.com', N'Poland', 10, N'50 Daystar Way', 10, 1)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (11, N'Glyn', N'Milicent', N'Gages', N'866-34-7241', N'Female', CAST(N'1931-07-08' AS Date), 5261977730, N'mgagesa@wix.com', N'Peru', 11, N'8 Transport Lane', 11, 1)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (12, N'Aldo', N'Waldon', N'Kidman', N'324-48-1258', N'Male', CAST(N'2014-04-10' AS Date), 7092066756, N'wkidmanb@admin.ch', N'France', 12, N'14456 Spenser Terrace', 12, 2)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (13, N'Rogers', N'Urban', N'Gallemore', N'631-68-3618', N'Male', CAST(N'1939-11-19' AS Date), 6141489604, N'ugallemorec@businessweek.com', N'Central African Republic', 13, N'0 Sunbrook Crossing', 13, 3)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (14, N'Wat', N'Hilton', N'Cromar', N'729-59-3545', N'Male', CAST(N'1982-02-15' AS Date), 8525216762, N'hcromard@reddit.com', N'Sweden', 14, N'5272 Forster Drive', 14, 4)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (15, N'Nolana', N'Lorry', N'Mulmuray', N'482-75-4940', N'Female', CAST(N'1961-07-01' AS Date), 8308317576, N'lmulmuraye@google.cn', N'France', 15, N'7 Mcguire Circle', 15, 5)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (16, N'Virginia', N'Petronilla', N'Beedom', N'720-01-7737', N'Female', CAST(N'1996-11-23' AS Date), 4141792211, N'pbeedomf@facebook.com', N'Philippines', 16, N'94309 Esch Alley', 16, 6)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (17, N'Andrea', N'Marian', N'Hurler', N'130-62-4945', N'Female', CAST(N'1943-02-19' AS Date), 6287529690, N'mhurlerg@baidu.com', N'Philippines', 17, N'442 Hansons Alley', 17, 7)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (18, N'Pepita', N'Jasmine', N'Peart', N'360-97-6564', N'Female', CAST(N'2012-05-20' AS Date), 4306052607, N'jpearth@addthis.com', N'Mexico', 18, N'00963 Rusk Pass', 18, 8)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (19, N'Tabby', N'Phillipe', N'Claire', N'631-58-1855', N'Male', CAST(N'1977-05-20' AS Date), 8855144689, N'pclairei@tripadvisor.com', N'Indonesia', 19, N'9 Anhalt Junction', 19, 1)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (20, N'Karlan', N'Clemens', N'Fearney', N'567-03-7214', N'Male', CAST(N'1995-06-07' AS Date), 4662728168, N'cfearneyj@nhs.uk', N'Canada', 20, N'0639 Northridge Alley', 20, 2)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (21, N'Luella', N'Keslie', N'Tander', N'435-30-5110', N'Female', CAST(N'2009-06-27' AS Date), 2085478748, N'ktanderk@live.com', N'Brazil', 21, N'5302 Mccormick Court', 21, 2)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (22, N'Tonie', N'Alyse', N'Bleier', N'307-30-1548', N'Female', CAST(N'1947-06-07' AS Date), 6825864098, N'ableierl@reuters.com', N'Germany', 22, N'854 Marcy Lane', 22, 2)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (23, N'Tomaso', N'William', N'Siege', N'720-47-5693', N'Male', CAST(N'1933-02-28' AS Date), 9785884567, N'wsiegem@cornell.edu', N'China', 23, N'0934 Buena Vista Pass', 23, 3)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (24, N'Lonee', N'Shandee', N'Conlon', N'633-19-2769', N'Female', CAST(N'1977-02-24' AS Date), 3543610948, N'sconlonn@dedecms.com', N'Brazil', 24, N'43 Grim Center', 24, 4)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (25, N'Warren', N'Gran', N'Stefanovic', N'772-85-9074', N'Male', CAST(N'1993-01-23' AS Date), 1021808699, N'gstefanovico@imageshack.us', N'Portugal', 25, N'48335 Sunbrook Alley', 25, 5)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (26, N'Mikey', N'Saxon', N'Yves', N'491-54-3515', N'Male', CAST(N'2007-05-27' AS Date), 1409731706, N'syvesp@biglobe.ne.jp', N'Montenegro', 26, N'9 Basil Road', 26, 6)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (27, N'Russ', N'Callean', N'Freak', N'158-17-6695', N'Male', CAST(N'1931-02-20' AS Date), 6143382107, N'cfreakq@dedecms.com', N'Venezuela', 27, N'23724 Sutteridge Place', 27, 7)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (28, N'Harriette', N'Meggy', N'Dulson', N'332-60-5062', N'Female', CAST(N'1938-06-15' AS Date), 3399699100, N'mdulsonr@cpanel.net', N'China', 28, N'45 Sherman Drive', 28, 8)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (29, N'Barbara-anne', N'Carlin', N'Lessmare', N'221-46-3251', N'Female', CAST(N'1949-05-01' AS Date), 4373848164, N'clessmares@ed.gov', N'North Korea', 29, N'42 Towne Crossing', 29, 2)
INSERT [dbo].[Staff] ([ID], [FirstName], [MiddleName], [LastName], [IdentificationNumber], [Gender], [DateOfBirth], [Phone], [Email], [Nationality], [CityID], [Address], [DeptID], [EmployeeTypeID]) VALUES (30, N'Aluin', N'Theodoric', N'Lyfield', N'390-19-1109', N'Male', CAST(N'1966-04-19' AS Date), 4806838867, N'tlyfieldt@jugem.jp', N'Portugal', 30, N'61982 Dottie Court', 30, 3)
SET IDENTITY_INSERT [dbo].[Staff] OFF
SET IDENTITY_INSERT [dbo].[StaffType] ON 

INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (1, N'Bank Staff')
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (2, N'Honarary')
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (3, N'Permanent')
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (4, N'Temporary')
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (5, N'Trainee')
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (6, N'Student (Intern)')
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (7, N'Visiting')
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (8, N'Agency Staff')
SET IDENTITY_INSERT [dbo].[StaffType] OFF
SET IDENTITY_INSERT [dbo].[Surgeon] ON 

INSERT [dbo].[Surgeon] ([ID], [DoctorID]) VALUES (1, 11)
INSERT [dbo].[Surgeon] ([ID], [DoctorID]) VALUES (2, 15)
INSERT [dbo].[Surgeon] ([ID], [DoctorID]) VALUES (3, 17)
INSERT [dbo].[Surgeon] ([ID], [DoctorID]) VALUES (4, 14)
INSERT [dbo].[Surgeon] ([ID], [DoctorID]) VALUES (5, 13)
INSERT [dbo].[Surgeon] ([ID], [DoctorID]) VALUES (6, 3)
INSERT [dbo].[Surgeon] ([ID], [DoctorID]) VALUES (7, 10)
INSERT [dbo].[Surgeon] ([ID], [DoctorID]) VALUES (8, 8)
SET IDENTITY_INSERT [dbo].[Surgeon] OFF
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointments_Doctor]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Nurse] FOREIGN KEY([NurseID])
REFERENCES [dbo].[Nurse] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointments_Nurse]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointments_Patient]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointments_Room]
GO
ALTER TABLE [dbo].[Bed]  WITH CHECK ADD  CONSTRAINT [FK_Bed_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Bed] CHECK CONSTRAINT [FK_Bed_Room]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_Billing_Patient]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Speciality] FOREIGN KEY([SpecialityID])
REFERENCES [dbo].[Specialities] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Speciality]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Staff]
GO
ALTER TABLE [dbo].[Inpatient]  WITH CHECK ADD  CONSTRAINT [FK_Inpatient_Bed] FOREIGN KEY([BedID])
REFERENCES [dbo].[Bed] ([ID])
GO
ALTER TABLE [dbo].[Inpatient] CHECK CONSTRAINT [FK_Inpatient_Bed]
GO
ALTER TABLE [dbo].[Inpatient]  WITH CHECK ADD  CONSTRAINT [FK_Inpatient_Dept] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Inpatient] CHECK CONSTRAINT [FK_Inpatient_Dept]
GO
ALTER TABLE [dbo].[Inpatient]  WITH CHECK ADD  CONSTRAINT [FK_Inpatient_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Inpatient] CHECK CONSTRAINT [FK_Inpatient_Patient]
GO
ALTER TABLE [dbo].[LabOrders]  WITH CHECK ADD  CONSTRAINT [FK_LabOrders_Appointments] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointment] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LabOrders] CHECK CONSTRAINT [FK_LabOrders_Appointments]
GO
ALTER TABLE [dbo].[Nurse]  WITH CHECK ADD  CONSTRAINT [FK_Nurse_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Nurse] CHECK CONSTRAINT [FK_Nurse_Staff]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Nurse] FOREIGN KEY([NurseID])
REFERENCES [dbo].[Nurse] ([ID])
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Nurse]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Inpatient] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Patient]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Room]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Surgeon] FOREIGN KEY([SurgeonID])
REFERENCES [dbo].[Surgeon] ([ID])
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Surgeon]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_City]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([ID])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Doctor]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Patient]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_City]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Department] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Department] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Department]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_StaffType] FOREIGN KEY([EmployeeTypeID])
REFERENCES [dbo].[StaffType] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_StaffType]
GO
ALTER TABLE [dbo].[Surgeon]  WITH CHECK ADD  CONSTRAINT [FK_Surgeon_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Surgeon] CHECK CONSTRAINT [FK_Surgeon_Doctor]
GO
/****** Object:  StoredProcedure [dbo].[AppointmentDelete]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AppointmentDelete]
		@ID int
	As
	Begin
	INSERT INTO [dbo].[AppointmentShadow]
           ([TStamp]
           ,[OpCode]
           ,[ID]
           ,[PatientID]
           ,[DoctorID]
           ,[NurseID]
           ,[RoomID]
           ,[Date]
           ,[Time]
           ,[VisitNote]
           ,[Recommenation])
	Select
	GETDATE()
    ,'D'
    ,ID
           ,PatientID
           ,DoctorID
           ,NurseID
           ,RoomID
           ,Date
           ,Time
           ,VisitNote
           ,Recommenation
	from Appointment
	where ID=@ID
	Delete
	From Appointment
	where Appointment.ID=@ID
End
GO
/****** Object:  StoredProcedure [dbo].[AppointmentInsert]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[AppointmentInsert]
		@PatientID int,
		@DoctorID int,
		@NurseID int,
		@RoomID int,
		@Date Date,
		@Time Time,
		@VisitNote varchar(MAX),
		@Recommenation varchar(MAX)
	As
	Begin
	INSERT INTO [dbo].[Appointments]
           ([PatientID]
           ,[DoctorID]
           ,[NurseID]
           ,[RoomID]
           ,[Date]
           ,[Time]
           ,[VisitNote]
           ,[Recommenation])
     VALUES
           (@PatientID,@DoctorID,@NurseID,@RoomID,@Date,@Time,@VisitNote,@Recommenation)
End
GO
/****** Object:  StoredProcedure [dbo].[AppointmentList]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AppointmentList]
As
Begin
SELECT 
*
FROM [dbo].Appointments
End
GO
/****** Object:  StoredProcedure [dbo].[AppointmentLookup]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AppointmentLookup]
		@ID int
	As
	Begin
	Select 
	*
	From Appointments
	where Appointments.ID=@ID
End
GO
/****** Object:  StoredProcedure [dbo].[AppointmentUpdate]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AppointmentUpdate]
		@ID int,
		@PatientID int,
		@DoctorID int,
		@NurseID int,
		@RoomID int,
		@Date Date,
		@Time Time,
		@VisitNote varchar(MAX),
		@Recommenation varchar(MAX)
	As
	Begin
		INSERT INTO [dbo].[AppointmentShadow]
           ([TStamp]
           ,[OpCode]
           ,[ID]
           ,[PatientID]
           ,[DoctorID]
           ,[NurseID]
           ,[RoomID]
           ,[Date]
           ,[Time]
           ,[VisitNote]
           ,[Recommenation])
	Select
	GETDATE()
    ,'U'
    ,ID
           ,PatientID
           ,DoctorID
           ,NurseID
           ,RoomID
           ,Date
           ,Time
           ,VisitNote
           ,Recommenation
	from Appointment
	where ID=@ID
	UPDATE [dbo].[Appointment]
	SET [PatientID] = @PatientID
      ,[DoctorID] = @DoctorID
      ,[NurseID] = @NurseID
      ,[RoomID] = @RoomID
      ,[Date] = @Date
      ,[Time] = @Time
      ,[VisitNote] = @VisitNote
      ,[Recommenation] = @Recommenation
End
GO
/****** Object:  StoredProcedure [dbo].[DeptHistory]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeptHistory]
	@ID int
	As
	Begin
	SELECT 
		[ID]
      ,[PatientID]
      ,[PatientName]
      ,[DoctorID]
      ,[DoctorStaffID]
      ,[DoctorName]
      ,[DeptID]
      ,[DeptName]
      ,[NurseID]
      ,[NurseStaffID]
      ,[NurseName]
      ,[RoomID]
      ,[RoomNumber]
      ,[RoomType]
      ,[FloorNumber]
      ,[BuildingNumber]
      ,[Date]
      ,[Time]
      ,[VisitNote]
      ,[Recommenation]
	FROM Appointment
	where Appointment.DeptID = @ID
		end
GO
/****** Object:  StoredProcedure [dbo].[DoctorHistory]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DoctorHistory]
	@ID int
	As
	Begin
	SELECT 
		[ID]
      ,[PatientID]
      ,[PatientName]
      ,[DoctorID]
      ,[DoctorStaffID]
      ,[DoctorName]
      ,[DeptID]
      ,[DeptName]
      ,[NurseID]
      ,[NurseStaffID]
      ,[NurseName]
      ,[RoomID]
      ,[RoomNumber]
      ,[RoomType]
      ,[FloorNumber]
      ,[BuildingNumber]
      ,[Date]
      ,[Time]
      ,[VisitNote]
      ,[Recommenation]
	FROM Appointment
	where Appointment.DoctorID = @ID
		end
GO
/****** Object:  StoredProcedure [dbo].[DoctorInsert]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DoctorInsert]
@StaffID int,
@SpecialityID int
as begin
INSERT INTO [dbo].[Doctor]
           ([StaffID]
           ,[SpecialityID])
     VALUES
           (@StaffID
           ,@SpecialityID)
end
GO
/****** Object:  StoredProcedure [dbo].[DoctorList]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DoctorList]
as begin
Select
* 
from Doctors
end
GO
/****** Object:  StoredProcedure [dbo].[DoctorLookup]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DoctorLookup]
@ID int
as begin
Select
* 
from Doctors
WHERE Doctors.ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[DoctorUpdate]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DoctorUpdate]
@ID int,
@SpecialityID int
as begin
UPDATE [dbo].[Doctor]
   SET [SpecialityID] = @SpecialityID
 WHERE Doctor.ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[NurseList]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[NurseList]
as begin
Select * from Nurses
end
GO
/****** Object:  StoredProcedure [dbo].[PatientHistory]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create Procedure [dbo].[PatientHistory]
	@ID int
	As
	Begin
	SELECT 
		[ID]
      ,[PatientID]
      ,[PatientName]
      ,[DoctorID]
      ,[DoctorStaffID]
      ,[DoctorName]
      ,[DeptID]
      ,[DeptName]
      ,[NurseID]
      ,[NurseStaffID]
      ,[NurseName]
      ,[RoomID]
      ,[RoomNumber]
      ,[RoomType]
      ,[FloorNumber]
      ,[BuildingNumber]
      ,[Date]
      ,[Time]
      ,[VisitNote]
      ,[Recommenation]
	FROM Appointment
	where Appointment.PatientID = @ID
		end

		exec PatientHistory 36
GO
/****** Object:  StoredProcedure [dbo].[PatientInsert]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create Procedure [dbo].[PatientInsert]
		@FirstName varchar(255),
		@MiddleName varchar(255),
		@LastName varchar(255),
		@IDnumbeer varchar(MAX),
		@Gender varchar(255),
		@DateOfBirth Date,
		@Phone bigint,
		@Email varchar(255),
		@Nationality varchar(255),
		@CityID int,
		@Address varchar(255),
		@Allergies varchar(MAX),
		@ExistingConditions varchar(MAX)
	As
	Begin
	INSERT INTO [dbo].[Patient]
           ([FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[IdentificationNumber]
           ,[Gender]
           ,[DateOfBirth]
           ,[Phone]
           ,[Email]
           ,[Nationality]
           ,[CityID]
           ,[Address]
           ,[Allergies]
           ,[ExistingConditions])
     VALUES
           (@FirstName,@MiddleName,@LastName,@IDnumbeer,@Gender,@DateOfBirth,@Phone,@Email,@Nationality,@CityID,@Address,@Allergies,@ExistingConditions)
End
GO
/****** Object:  StoredProcedure [dbo].[PatientList]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create Procedure [dbo].[PatientList]
	As
	Begin
	SELECT 
		*
	FROM Patients
		end
GO
/****** Object:  StoredProcedure [dbo].[PatientLookup]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE Procedure [dbo].[PatientLookup]
	@ID int
	As
	Begin
	SELECT 
		dbo.Patients.ID,
		dbo.Patients.Name, 
		dbo.Patients.IdentificationNumber, 
		dbo.Patients.Gender, 
		dbo.Patients.DateOfBirth, 
		dbo.Patients.Phone, 
		dbo.Patients.Email, 
		dbo.Patients.Nationality, 
		dbo.Patients.CityID, 
		dbo.Patients.CityName, 
		dbo.Patients.Address, 
		dbo.Patients.Allergies, 
		dbo.Patients.ExistingConditions
	FROM Patients
	where Patients.ID = @ID
		end

		exec PatientLookup 36
GO
/****** Object:  StoredProcedure [dbo].[PatientUpdate]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create Procedure [dbo].[PatientUpdate]
		@ID int,
		@FirstName varchar(255),
		@MiddleName varchar(255),
		@LastName varchar(255),
		@IDnumbeer varchar(MAX),
		@Gender varchar(255),
		@DateOfBirth Date,
		@Phone bigint,
		@Email varchar(255),
		@Nationality varchar(255),
		@CityID int,
		@Address varchar(255),
		@Allergies varchar(MAX),
		@ExistingConditions varchar(MAX)
	As
	Begin
	Update [dbo].[Patient]
	set
           [FirstName] = @FirstName
           ,[MiddleName] = @MiddleName
           ,[LastName] = @LastName
           ,[IdentificationNumber] = @IDnumbeer
           ,[Gender] = @Gender
           ,[DateOfBirth] = @DateOfBirth
           ,[Phone] = @Phone
           ,[Email] = @Email
           ,[Nationality] = @Nationality
           ,[CityID] = @CityID
           ,[Address] = @Address
           ,[Allergies] = @Allergies
           ,[ExistingConditions] = @ExistingConditions
		   where Patient.ID =@ID
End
GO
/****** Object:  StoredProcedure [dbo].[RoomList]    Script Date: 9/30/2020 3:41:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RoomList]
as begin
Select * from Room
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[26] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employees"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Doctor"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 119
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Specialities"
            Begin Extent = 
               Top = 6
               Left = 487
               Bottom = 102
               Right = 657
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Doctors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Doctors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[22] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Staff"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "City"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 102
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 487
               Bottom = 102
               Right = 657
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StaffType"
            Begin Extent = 
               Top = 99
               Left = 338
               Bottom = 195
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1500
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Employees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Employees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employees"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Nurse"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 136
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Nurses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Nurses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Patient"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "City"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 102
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Patients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Patients'
GO
USE [master]
GO
ALTER DATABASE [Hospital Management System] SET  READ_WRITE 
GO
