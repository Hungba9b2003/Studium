USE [master]
GO
/****** Object:  Database [SWP_Studium]    Script Date: 3/20/2024 10:27:30 PM ******/
CREATE DATABASE [SWP_Studium]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP_Studium', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUNGPHAM\MSSQL\DATA\SWP_Studium.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP_Studium_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HUNGPHAM\MSSQL\DATA\SWP_Studium_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP_Studium] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_Studium].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_Studium] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_Studium] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_Studium] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_Studium] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_Studium] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_Studium] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP_Studium] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_Studium] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_Studium] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_Studium] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_Studium] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_Studium] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_Studium] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_Studium] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_Studium] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP_Studium] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_Studium] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_Studium] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_Studium] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_Studium] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_Studium] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_Studium] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_Studium] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP_Studium] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_Studium] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_Studium] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_Studium] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_Studium] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_Studium] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_Studium] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP_Studium] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP_Studium] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP_Studium]
GO
/****** Object:  Table [dbo].[AcademicAchievement]    Script Date: 3/20/2024 10:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicAchievement](
	[AchievementID] [int] IDENTITY(1,1) NOT NULL,
	[AchievementDetail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AchievementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](128) NULL,
	[Phone] [varchar](11) NULL,
	[Email] [nvarchar](255) NULL,
	[ProfilePic] [nvarchar](max) NULL,
	[Role] [tinyint] NULL,
	[UserName] [nvarchar](30) NULL,
	[HashedPassword] [varchar](64) NULL,
	[DateCreated] [date] NULL,
	[LastLogin] [date] NULL,
	[IsBlocked] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[TutorID] [int] NULL,
	[ParentID] [int] NULL,
	[AdminInCharge] [int] NULL,
	[TutorGender] [tinyint] NOT NULL,
	[PayPerSession] [decimal](12, 3) NOT NULL,
	[SesPerWeek] [tinyint] NULL,
	[TimeS] [int] NOT NULL,
	[OpenDate] [date] NULL,
	[ClassDescription] [nvarchar](2000) NULL,
	[PublicAddress] [nvarchar](255) NULL,
	[ActualAddress] [nvarchar](255) NULL,
	[SubjectID] [int] NULL,
	[TutorEdLevel] [tinyint] NULL,
	[StudentNum] [tinyint] NULL,
	[CheckDate] [date] NULL,
	[IsApproved] [bit] NULL,
	[ClassStatus] [tinyint] NULL,
	[Map] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Class_classID] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Freeschedule]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Freeschedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timeId] [int] NULL,
	[classId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID][Int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[CreatTime] [date] NULL,
	[InvoiceType] [int] NULL,
	[imgInvoice] [nvarchar](max) NULL,
	[HasPaid] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[TutorID] [int] NULL,
	[RequestType] [tinyint] NULL,
	[DateCreate] [date] NULL,
	[RequestStatus] [tinyint] NULL,
	[TrialEndDate] [date] NULL,
	[AcceptDate] [date] NULL,
	[ContractLink] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeschedule]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timeschedule](
	[id] [int] NOT NULL,
	[day] [nvarchar](255) NULL,
	[Time] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[TutorID] [int] NOT NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [bit] NULL,
	[School] [nvarchar](255) NULL,
	[Major] [nvarchar](255) NULL,
	[GraduationYear] [smallint] NULL,
	[EducationLevel] [tinyint] NULL,
	[Introduction] [nvarchar](2000) NULL,
	[IdCardPic1] [nvarchar](max) NULL,
	[IdCardPic2] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsValidated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Achievement]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor_Achievement](
	[AchievementID] [int] NOT NULL,
	[TutorID] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[CertImage] [varchar](3000) NULL,
PRIMARY KEY CLUSTERED 
(
	[AchievementID] ASC,
	[TutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Location]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor_Location](
	[TutorID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Subject]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor_Subject](
	[TutorID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC,
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tutorEdlevel]    Script Date: 3/20/2024 10:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutorEdlevel](
	[id] [tinyint] NOT NULL,
	[EdLevel] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AcademicAchievement] ON 

INSERT [dbo].[AcademicAchievement] ([AchievementID], [AchievementDetail]) VALUES (1, N'Có chứng chỉ ngoại ngữ')
INSERT [dbo].[AcademicAchievement] ([AchievementID], [AchievementDetail]) VALUES (2, N'Đạt giải trong kỳ thi học sinh giỏi từ cấp quận, huyện')
INSERT [dbo].[AcademicAchievement] ([AchievementID], [AchievementDetail]) VALUES (3, N'Có môn đạt 8 điểm trở lên khi thi Đại học')
INSERT [dbo].[AcademicAchievement] ([AchievementID], [AchievementDetail]) VALUES (4, N'Bạn còn thành tích nổi bật khác')
SET IDENTITY_INSERT [dbo].[AcademicAchievement] OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (1, N'Phan Đức Vượng', N'9786343123 ', N'vuong123@gmail.com', N'default.jpg', 1, N'admin1', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2024-03-18' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (2, N'Hùng Phạm', N'1234567890 ', N'hung123@gmail.com', N'default.jpg', 1, N'admin2', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2024-03-20' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (3, N'Admin', N'0987654321 ', N'admin123@gmail.com', N'default.jpg', 1, N'admin3', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2024-02-22' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (4, N'Trần Thị Phương Quỳnh', N'0312345678 ', N'quynh123@gmail.com', N'default.jpg', 2, N'PhuongQuynh123', N'3a5fb5a6b1e6f2078df3450e0b9575a0590a9d52cf7cf66bfe98a28fa6a4f015', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (5, N'Huyền Ngọc', N'13243546578', N'ngoc123@gmail.com', N'default.jpg', 2, N'Huyen123', N'6daa8f24e6e6574e6aebf5846881d2a94ed32a4b7ef2e682142de4e85bb5a78e', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (6, N'Phạm Công Thành', N'1231841987 ', N'thanh123@gmail.com', N'default.jpg', 2, N'lamhoang9911', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (7, N'Lê Trần Hùng Dương', N'1919292939 ', N'duong123@gmail.com', N'default.jpg', 2, N'congthanh123', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (8, N'Nguyễn Hữu Lộc', N'1919191923 ', N'loc123@gmail.com', N'default.jpg', 2, N'hungduong987', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (9, N'Đỗ Ngọc Sương', N'198112345 ', N'suong123@gmail.com', N'default.jpg', 2, N'locnguyen1123', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (10, N'Ngọc Hân', N'199988812 ', N'han123.com', N'default.jpg', 2, N'ngocsuong1981', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (11, N'Nguyễn Kim An', N'2001100212 ', N'kiman123@gmail.com', N'default.jpg', 2, N'han1999', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2024-03-18' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (12, N'Vũ Thanh Phương', N'20032001200', N'phuong123@gmail.com', N'default.jpg', 2, N'kiman2001', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (13, N'Lê Hồng Nhi', N'9786343232 ', N'nhi123@gmail.com', N'default.jpg', 2, N'thanhphuong2003', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (14, N'Lăng Hoàng Lâm', N'9786343123 ', N'lam123@gmail.com', N'default.jpg', 2, N'hongnhi97', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2023-06-19' AS Date), 0)
INSERT [dbo].[Account] ([AccountID], [FullName], [Phone], [Email], [ProfilePic], [Role], [UserName], [HashedPassword], [DateCreated], [LastLogin], [IsBlocked]) VALUES (15, N'Nguyen Van Parent', N'9786343123 ', N'parent1@gmail.com', N'default.jpg', 3, N'parent1', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', CAST(N'2023-06-19' AS Date), CAST(N'2024-03-18' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (1, NULL, 3, 2, 3, CAST(20000.000 AS Decimal(12, 3)), 20, 50, CAST(N'2024-01-20' AS Date), N'ClassDescrionpti_12', N'Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội', N'76 P. Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội', 4, 2, 10, NULL, 1, 1, N'<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7447.838188709387!2d105.812756!3d21.035923!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab149e6ae865%3A0xb9b845308f999596!2zUC4gS2ltIE3DoyBUaMaw4bujbmcsIEJhIMSQw6xuaCwgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2sus!4v1709114021560!5m2!1svi!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>')
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (2, NULL, 3, 2, 1, CAST(60000.000 AS Decimal(12, 3)), 3, 60, CAST(N'2024-01-21' AS Date), N'ClassDescription_2', N'Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội', N'74 P. Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội', 2, 2, 2, NULL, 1, 1, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (3, NULL, 3, 2, 0, CAST(45000.000 AS Decimal(12, 3)), 1, 60, CAST(N'2024-01-22' AS Date), N'ClassDescription_3', N'Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội', N'24 P. Kim Mã Thượng, Cống Vị, Ba Đình, Hà Nội', 3, 1, 1, NULL, 1, 1, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (4, NULL, 3, 2, 2, CAST(55000.000 AS Decimal(12, 3)), 2, 60, CAST(N'2024-01-23' AS Date), N'ClassDescription_4', N'ngõ 133 Thái Hà Hà Nội', N'Số 3 ngõ 133 Thái Hà Hà Nội', 5, 1, 2, NULL, 1, 1, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (5, NULL, 3, 2, 0, CAST(50000.000 AS Decimal(12, 3)), 2, 60, CAST(N'2024-01-24' AS Date), N'ClassDescription_5', N'ngõ 133 Thái Hà Hà Nội', N'Số 5 ngõ 133 Thái Hà Hà Nội ', 6, 2, 2, NULL, 1, 1, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (6, NULL, 4, 3, 1, CAST(60000.000 AS Decimal(12, 3)), 3, 60, CAST(N'2024-01-25' AS Date), N'ClassDescription_6', N'ngõ 133 Thái Hà Hà Nội', N'Số 6 ngõ 133 Thái Hà Hà Nội ', 7, 1, 2, NULL, 1, 1, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (7, NULL, 2, 3, 2, CAST(45000.000 AS Decimal(12, 3)), 1, 60, CAST(N'2024-01-26' AS Date), N'ClassDescription_7', N'ngõ 133 Thái Hà Hà Nội', N'Số 1 ngõ 133 Thái Hà Hà Nội i', 8, 2, 1, NULL, 1, 1, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (8, NULL, 5, 3, 1, CAST(55000.000 AS Decimal(12, 3)), 2, 60, CAST(N'2024-01-27' AS Date), N'ClassDescription_8', N'ngõ 133 Thái Hà Hà Nội', N'Số 3 ngõ 133 Thái Hà Hà Nội ', 10, 1, 0, NULL, 1, 1, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (9, NULL, 6, 2, 1, CAST(60000.000 AS Decimal(12, 3)), 3, 45, CAST(N'2024-01-28' AS Date), N'Hung', N'Trần Xuân Soạn, Ngô Thì Nhậm, Hai Bà Trưng, Hà Nội, Hương', N'72 P. Trần Xuân Soạn, Ngô Thì Nhậm, Hai Bà Trưng, Hà Nội, Hương', 12, 3, 10, NULL, 1, 1, N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.395120148941!2d105.8509742747141!3d21.01687058818786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abf2c6b8a479%3A0x7efbf7b3b7611cc6!2zUC4gVHLhuqduIFh1w6JuIFNv4bqhbiwgUGjhuqFtIMSQw6xuaCBI4buTLCBIYWkgQsOgIFRyxrBuZywgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1708851026507!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>')
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (25, NULL, 15, 2, 2, CAST(111.000 AS Decimal(12, 3)), 111, 11, CAST(N'2023-12-03' AS Date), N'22xxx', N'Trần Xuân Soạn, Ngô Thì Nhậm, Hai Bà Trưng, Hà Nội, Hương1', N'111', 13, 2, 20, NULL, 1, 1, N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.395120148941!2d105.8509742747141!3d21.01687058818786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abf2c6b8a479%3A0x7efbf7b3b7611cc6!2zUC4gVHLhuqduIFh1w6JuIFNv4bqhbiwgUGjhuqFtIMSQw6xuaCBI4buTLCBIYWkgQsOgIFRyxrBuZywgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1708851026507!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>')
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (26, NULL, 15, 2, 0, CAST(23.000 AS Decimal(12, 3)), 2, 3, CAST(N'2023-12-01' AS Date), N'22', NULL, N'22', 8, NULL, 2, NULL, 1, 0, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (27, NULL, 15, 2, 3, CAST(50000.000 AS Decimal(12, 3)), 4, 60, CAST(N'2023-12-02' AS Date), N'Học sinh ngoan', N'Liên Hà, Đông Anh, Hà Nội', N'Châu Phong, Liên Hà, Đông Anh, Hà Nội', 6, 2, 10, NULL, 1, 0, N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29769.492351723726!2d105.87457940345773!3d21.144973280550772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313506df1f72a785%3A0x3f126d4046baf893!2zTGnDqm4gSMOgLCDEkMO0bmcgQW5oLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1709795802565!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>')
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (28, NULL, 15, 2, 2, CAST(40000.000 AS Decimal(12, 3)), 3, 60, CAST(N'2024-04-03' AS Date), N'oke', N' Liên Hà , Đông Anh, Hà Nội', N'Châu Phong, Liên Hà , Đông Anh, Hà Nội', 11, 2, 4, NULL, 1, 1, N'<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7447.838188709387!2d105.812756!3d21.035923!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab149e6ae865%3A0xb9b845308f999596!2zUC4gS2ltIE3DoyBUaMaw4bujbmcsIEJhIMSQw6xuaCwgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2sus!4v1709114021560!5m2!1svi!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>')
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (29, NULL, 15, NULL, 0, CAST(30000.000 AS Decimal(12, 3)), 3, 60, CAST(N'2024-07-03' AS Date), N'Học sinh ngoan ', NULL, N'Châu Phong, Liên Hà,  Đông Anh, Hà Nọi', 21, 1, 3, NULL, 0, 1, NULL)
INSERT [dbo].[Class] ([ClassID], [TutorID], [ParentID], [AdminInCharge], [TutorGender], [PayPerSession], [SesPerWeek], [TimeS], [OpenDate], [ClassDescription], [PublicAddress], [ActualAddress], [SubjectID], [TutorEdLevel], [StudentNum], [CheckDate], [IsApproved], [ClassStatus], [Map]) VALUES (31, NULL, 15, NULL, 0, CAST(1.000 AS Decimal(12, 3)), 1, 1, CAST(N'2024-07-03' AS Date), N'1', NULL, N'1', 21, 1, 1, NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Freeschedule] ON 

INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (322, 77, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (323, 78, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (325, 79, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (276, 77, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (326, 52, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (328, 54, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (330, 56, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (332, 103, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (15, 85, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (18, 90, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (20, 159, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (22, 29, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (333, 102, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (335, 100, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (500, 54, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (501, 56, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (533, 57, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (596, 93, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (597, 137, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (555, 30, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (557, 31, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (559, 56, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (544, 5, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (546, 34, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (457, 30, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (459, 126, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (461, 87, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (462, 90, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (464, 152, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (468, 12, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (470, 13, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (473, 17, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (475, 19, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (133, 1, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (134, 25, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (136, 73, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (138, 121, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (139, 145, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (141, 48, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (143, 96, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (145, 144, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (146, 168, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (480, 104, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (482, 134, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (484, 91, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (485, 92, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (517, 139, 27)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (518, 138, 27)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (519, 140, 27)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (521, 163, 27)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (523, 84, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (526, 86, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (548, 87, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (477, 52, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (528, 62, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (14, 55, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (16, 103, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (23, 33, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (144, 120, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (321, 76, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (327, 53, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (17, 84, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (19, 139, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (21, 125, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (550, 136, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (476, 20, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (483, 112, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (135, 49, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (137, 97, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (140, 24, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (142, 72, 2)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (334, 101, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (279, 79, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (503, 80, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (551, 130, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (530, 87, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (506, 58, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (598, 108, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (458, 52, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (471, 15, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (481, 131, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (532, 161, 27)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (331, 104, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (508, 82, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (553, 85, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (324, 80, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (329, 55, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (509, 83, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (469, 14, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (474, 18, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (479, 81, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (600, 141, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (463, 137, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (562, 57, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (564, 82, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (602, 45, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (472, 16, 25)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (478, 76, 26)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (569, 86, 9)
GO
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (511, 58, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (512, 59, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (605, 99, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (607, 62, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (575, 42, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (609, 136, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (577, 158, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (611, 148, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (580, 109, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (612, 79, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (584, 129, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (586, 133, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (588, 53, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (590, 78, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (591, 79, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (593, 61, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (614, 71, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1596, 7, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1597, 8, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1598, 9, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1600, 11, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1602, 13, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1605, 154, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1607, 155, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1609, 157, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (502, 78, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (504, 81, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (505, 57, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (507, 59, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (510, 57, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (513, 60, 1)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (524, 60, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (541, 65, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (567, 84, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (582, 105, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (603, 114, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1603, 151, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (520, 162, 27)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (522, 164, 27)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (529, 63, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (531, 137, 27)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (537, 61, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (556, 54, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (547, 83, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (549, 89, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (554, 42, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (558, 32, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (610, 13, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (565, 59, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (574, 65, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (587, 8, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (594, 128, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (525, 61, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (527, 85, 28)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (535, 59, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (561, 80, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (543, 2, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (545, 8, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (552, 77, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (601, 80, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1601, 12, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (579, 108, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (585, 153, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (599, 90, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (608, 109, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (615, 95, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1608, 156, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (604, 102, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (606, 52, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (613, 56, 9)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1599, 10, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1604, 152, 31)
INSERT [dbo].[Freeschedule] ([id], [timeId], [classId]) VALUES (1606, 153, 31)
SET IDENTITY_INSERT [dbo].[Freeschedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (1, N'Quận Ba Đình')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (2, N'Quận Cầu Giấy')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (3, N'Quận Hoàn Kiếm')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (4, N'Quận Hai Bà Trưng')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (5, N'Quận Hoàng Mai')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (6, N'Quận Đống Đa')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (7, N'Quận Tây Hồ')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (8, N'Quận Thanh Xuân')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (9, N'Quận Bắc Từ Liêm')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (10, N'Quận Hà Đông')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (11, N'Quận Long Biên')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (12, N'Quận Nam Từ Liêm')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (13, N'Huyện Ba Vì')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (14, N'Huyện Chương Mỹ')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (15, N'Huyện Đan Phượng')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (16, N'Huyện Đông Anh')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (17, N'Huyện Gia Lâm')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (18, N'Huyện Hoài Đức')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (19, N'Huyện Mê Linh')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (20, N'Huyện Mỹ Đức')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (21, N'Huyện Phú Xuyên')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (22, N'Huyện Quốc Oai')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (23, N'Huyện Sóc Sơn')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (24, N'Huyện Thạch Thất')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (25, N'Huyện Thanh Oai')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (26, N'Huyện Thanh Trì')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (27, N'Huyện Thường Tín')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (28, N'Huyện Ứng Hòa')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (29, N'Thị xã Sơn Tây')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([RequestID], [ClassID], [TutorID], [RequestType], [DateCreate], [RequestStatus], [TrialEndDate], [AcceptDate], [ContractLink]) VALUES (1, 1, 4, 0, CAST(N'2024-03-10' AS Date), 2, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [ClassID], [TutorID], [RequestType], [DateCreate], [RequestStatus], [TrialEndDate], [AcceptDate], [ContractLink]) VALUES (2, 2, 5, 0, CAST(N'2024-03-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [ClassID], [TutorID], [RequestType], [DateCreate], [RequestStatus], [TrialEndDate], [AcceptDate], [ContractLink]) VALUES (3, 1, 5, 0, CAST(N'2024-03-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [ClassID], [TutorID], [RequestType], [DateCreate], [RequestStatus], [TrialEndDate], [AcceptDate], [ContractLink]) VALUES (4, 3, 5, 0, CAST(N'2024-03-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [ClassID], [TutorID], [RequestType], [DateCreate], [RequestStatus], [TrialEndDate], [AcceptDate], [ContractLink]) VALUES (5, 3, 6, 0, CAST(N'2024-03-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [ClassID], [TutorID], [RequestType], [DateCreate], [RequestStatus], [TrialEndDate], [AcceptDate], [ContractLink]) VALUES (6, 7, 6, 1, CAST(N'2024-03-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [ClassID], [TutorID], [RequestType], [DateCreate], [RequestStatus], [TrialEndDate], [AcceptDate], [ContractLink]) VALUES (7, 8, 7, 0, CAST(N'2024-03-10' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [ClassID], [TutorID], [RequestType], [DateCreate], [RequestStatus], [TrialEndDate], [AcceptDate], [ContractLink]) VALUES (8, 26, 4, 1, CAST(N'2024-03-11' AS Date), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (1, N'Toán tiểu học')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (2, N'Toán trung học cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (3, N'Toán 10')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (4, N'Toán 11')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (5, N'Toán 12')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (6, N'Tiếng Việt tiểu học')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (7, N'Ngữ Văn trung học cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (8, N'Ngữ Văn 10')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (9, N'Ngữ Văn 11')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (10, N'Ngữ Văn 12')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (11, N'Hóa lớp 8')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (12, N'Hóa lớp 9')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (13, N'Hóa lớp 10')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (14, N'Hóa lớp 11')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (15, N'Hóa lớp 12')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (16, N'Tin học tiểu học')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (17, N'Tin học trung học cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (18, N'Tin học trung học phổ thông')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (19, N'Lý trung học cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (20, N'Lý lớp 10')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (21, N'Lý lớp 11')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (22, N'Lý lớp 12')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (23, N'Tiếng Anh tiểu học')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (24, N'Tiếng Anh trung học phổ cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (25, N'Tiếng Anh trung học phổ thông')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (26, N'Tiếng Anh luyện thi IELTS')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (27, N'Tiếng Anh luyện thi TOEIC')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (28, N'Đàn Piano')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (29, N'Đàn Guitar')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (1, N'Thứ 2', 0)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (2, N'Thứ 2', 1)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (3, N'Thứ 2', 2)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (4, N'Thứ 2', 3)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (5, N'Thứ 2', 4)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (6, N'Thứ 2', 5)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (7, N'Thứ 2', 6)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (8, N'Thứ 2', 7)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (9, N'Thứ 2', 8)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (10, N'Thứ 2', 9)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (11, N'Thứ 2', 10)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (12, N'Thứ 2', 11)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (13, N'Thứ 2', 12)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (14, N'Thứ 2', 13)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (15, N'Thứ 2', 14)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (16, N'Thứ 2', 15)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (17, N'Thứ 2', 16)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (18, N'Thứ 2', 17)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (19, N'Thứ 2', 18)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (20, N'Thứ 2', 19)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (21, N'Thứ 2', 20)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (22, N'Thứ 2', 21)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (23, N'Thứ 2', 22)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (24, N'Thứ 2', 23)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (25, N'Thứ 3', 0)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (26, N'Thứ 3', 1)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (27, N'Thứ 3', 2)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (28, N'Thứ 3', 3)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (29, N'Thứ 3', 4)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (30, N'Thứ 3', 5)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (31, N'Thứ 3', 6)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (32, N'Thứ 3', 7)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (33, N'Thứ 3', 8)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (34, N'Thứ 3', 9)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (35, N'Thứ 3', 10)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (36, N'Thứ 3', 11)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (37, N'Thứ 3', 12)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (38, N'Thứ 3', 13)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (39, N'Thứ 3', 14)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (40, N'Thứ 3', 15)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (41, N'Thứ 3', 16)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (42, N'Thứ 3', 17)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (43, N'Thứ 3', 18)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (44, N'Thứ 3', 19)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (45, N'Thứ 3', 20)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (46, N'Thứ 3', 21)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (47, N'Thứ 3', 22)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (48, N'Thứ 3', 23)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (49, N'Thứ 4', 0)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (50, N'Thứ 4', 1)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (51, N'Thứ 4', 2)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (52, N'Thứ 4', 3)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (53, N'Thứ 4', 4)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (54, N'Thứ 4', 5)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (55, N'Thứ 4', 6)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (56, N'Thứ 4', 7)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (57, N'Thứ 4', 8)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (58, N'Thứ 4', 9)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (59, N'Thứ 4', 10)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (60, N'Thứ 4', 11)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (61, N'Thứ 4', 12)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (62, N'Thứ 4', 13)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (63, N'Thứ 4', 14)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (64, N'Thứ 4', 15)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (65, N'Thứ 4', 16)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (66, N'Thứ 4', 17)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (67, N'Thứ 4', 18)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (68, N'Thứ 4', 19)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (69, N'Thứ 4', 20)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (70, N'Thứ 4', 21)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (71, N'Thứ 4', 22)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (72, N'Thứ 4', 23)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (73, N'Thứ 5', 0)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (74, N'Thứ 5', 1)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (75, N'Thứ 5', 2)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (76, N'Thứ 5', 3)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (77, N'Thứ 5', 4)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (78, N'Thứ 5', 5)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (79, N'Thứ 5', 6)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (80, N'Thứ 5', 7)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (81, N'Thứ 5', 8)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (82, N'Thứ 5', 9)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (83, N'Thứ 5', 10)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (84, N'Thứ 5', 11)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (85, N'Thứ 5', 12)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (86, N'Thứ 5', 13)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (87, N'Thứ 5', 14)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (88, N'Thứ 5', 15)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (89, N'Thứ 5', 16)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (90, N'Thứ 5', 17)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (91, N'Thứ 5', 18)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (92, N'Thứ 5', 19)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (93, N'Thứ 5', 20)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (94, N'Thứ 5', 21)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (95, N'Thứ 5', 22)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (96, N'Thứ 5', 23)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (97, N'Thứ 6', 0)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (98, N'Thứ 6', 1)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (99, N'Thứ 6', 2)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (100, N'Thứ 6', 3)
GO
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (101, N'Thứ 6', 4)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (102, N'Thứ 6', 5)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (103, N'Thứ 6', 6)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (104, N'Thứ 6', 7)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (105, N'Thứ 6', 8)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (106, N'Thứ 6', 9)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (107, N'Thứ 6', 10)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (108, N'Thứ 6', 11)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (109, N'Thứ 6', 12)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (110, N'Thứ 6', 13)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (111, N'Thứ 6', 14)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (112, N'Thứ 6', 15)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (113, N'Thứ 6', 16)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (114, N'Thứ 6', 17)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (115, N'Thứ 6', 18)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (116, N'Thứ 6', 19)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (117, N'Thứ 6', 20)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (118, N'Thứ 6', 21)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (119, N'Thứ 6', 22)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (120, N'Thứ 6', 23)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (121, N'Thứ 7', 0)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (122, N'Thứ 7', 1)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (123, N'Thứ 7', 2)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (124, N'Thứ 7', 3)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (125, N'Thứ 7', 4)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (126, N'Thứ 7', 5)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (127, N'Thứ 7', 6)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (128, N'Thứ 7', 7)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (129, N'Thứ 7', 8)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (130, N'Thứ 7', 9)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (131, N'Thứ 7', 10)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (132, N'Thứ 7', 11)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (133, N'Thứ 7', 12)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (134, N'Thứ 7', 13)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (135, N'Thứ 7', 14)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (136, N'Thứ 7', 15)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (137, N'Thứ 7', 16)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (138, N'Thứ 7', 17)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (139, N'Thứ 7', 18)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (140, N'Thứ 7', 19)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (141, N'Thứ 7', 20)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (142, N'Thứ 7', 21)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (143, N'Thứ 7', 22)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (144, N'Thứ 7', 23)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (145, N'Chủ nhật', 0)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (146, N'Chủ nhật', 1)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (147, N'Chủ nhật', 2)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (148, N'Chủ nhật', 3)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (149, N'Chủ nhật', 4)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (150, N'Chủ nhật', 5)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (151, N'Chủ nhật', 6)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (152, N'Chủ nhật', 7)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (153, N'Chủ nhật', 8)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (154, N'Chủ nhật', 9)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (155, N'Chủ nhật', 10)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (156, N'Chủ nhật', 11)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (157, N'Chủ nhật', 12)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (158, N'Chủ nhật', 13)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (159, N'Chủ nhật', 14)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (160, N'Chủ nhật', 15)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (161, N'Chủ nhật', 16)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (162, N'Chủ nhật', 17)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (163, N'Chủ nhật', 18)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (164, N'Chủ nhật', 19)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (165, N'Chủ nhật', 20)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (166, N'Chủ nhật', 21)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (167, N'Chủ nhật', 22)
INSERT [dbo].[Timeschedule] ([id], [day], [Time]) VALUES (168, N'Chủ nhật', 23)
GO
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (4, CAST(N'2001-06-19' AS Date), 0, N'Đại Học Ngoại Thương', N'Kinh Tế', 2025, 1, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 1)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (5, CAST(N'2001-06-19' AS Date), 0, N'Học Viện Nông Nghiệp', N'Công nghệ sinh học', 2025, 1, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 1)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (6, CAST(N'2001-06-19' AS Date), 1, N'Học Viện Tài Chính', N'Quản trị kinh doanh', 2025, 1, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 0)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (7, CAST(N'2001-06-19' AS Date), 1, N'Học Viện Tài Chính', N'Quản trị kinh doanh', 2025, 2, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 1)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (8, CAST(N'2001-06-19' AS Date), 0, N'Đại Học FPT', N'Ngôn ngữ Anh', 2024, 2, N'Đã có kinh nghiệm dạy tiếng anh IELTS', NULL, NULL, 1, 0)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (9, CAST(N'2001-06-19' AS Date), 0, N'Học Viện Tài Chính', N'Quản trị kinh doanh', 2025, 1, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 0)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (10, CAST(N'2001-06-19' AS Date), 1, N'Học Viện Tài Chính', N'Quản trị kinh doanh', 2025, 1, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 1)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (11, CAST(N'2001-06-19' AS Date), 0, N'Học Viện Tài Chính', N'Quản trị kinh doanh', 2025, 1, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 1)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (12, CAST(N'2001-06-19' AS Date), 0, N'Đại Học Bách Khoa', N'Quản trị kinh doanh', 2026, 1, N'Đã có kinh nghiệm dạy Công nghệ thông tin', NULL, NULL, 1, 1)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (13, CAST(N'2001-06-19' AS Date), 0, N'Học Viện Tài Chính', N'Quản trị kinh doanh', 2025, 1, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 1)
INSERT [dbo].[Tutor] ([TutorID], [DateOfBirth], [Gender], [School], [Major], [GraduationYear], [EducationLevel], [Introduction], [IdCardPic1], [IdCardPic2], [IsActive], [IsValidated]) VALUES (14, CAST(N'2001-06-19' AS Date), 1, N'Học Viện Tài Chính', N'Quản trị kinh doanh', 2025, 1, N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', NULL, NULL, 1, 1)
GO
INSERT [dbo].[Tutor_Achievement] ([AchievementID], [TutorID], [Description], [CertImage]) VALUES (1, 5, N'Bằng IELTS Band 8.0 vào năm 2021', N'/img/Ielts1')
INSERT [dbo].[Tutor_Achievement] ([AchievementID], [TutorID], [Description], [CertImage]) VALUES (1, 6, N'Học sinh giỏi toán Trung học phổ thông cấp huyện', N'/img/Ielts1')
INSERT [dbo].[Tutor_Achievement] ([AchievementID], [TutorID], [Description], [CertImage]) VALUES (1, 7, N'Bằng TOEIC', N'/img/certificate-of-authenticity-34')
INSERT [dbo].[Tutor_Achievement] ([AchievementID], [TutorID], [Description], [CertImage]) VALUES (1, 8, N'Tiếng Nhật N2', N'/img/certificate-of-authenticity-34')
INSERT [dbo].[Tutor_Achievement] ([AchievementID], [TutorID], [Description], [CertImage]) VALUES (2, 5, N'Bằng IELTS Band 8.0 vào năm 2021', N'/img/85ef4939955b3b1903ddd7cfad60628c61ae00e4')
INSERT [dbo].[Tutor_Achievement] ([AchievementID], [TutorID], [Description], [CertImage]) VALUES (2, 6, N'Học sinh giỏi toán Trung học phổ thông cấp huyện', N'/img/85ef4939955b3b1903ddd7cfad60628c61ae00e4')
GO
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (4, 1)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (4, 2)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (5, 3)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (5, 4)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (6, 5)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (6, 6)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (7, 1)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (7, 2)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (8, 7)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (9, 7)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (10, 8)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (10, 9)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (11, 2)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (11, 3)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (12, 11)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (12, 12)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (13, 12)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (14, 12)
GO
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (4, 1)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (4, 2)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (5, 3)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (5, 4)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (6, 5)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (6, 6)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (7, 1)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (7, 2)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (8, 7)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (9, 7)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (10, 7)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (11, 7)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (11, 11)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (12, 8)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (12, 12)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (13, 9)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (14, 2)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (14, 3)
GO
INSERT [dbo].[tutorEdlevel] ([id], [EdLevel]) VALUES (1, N'Sinh viên')
INSERT [dbo].[tutorEdlevel] ([id], [EdLevel]) VALUES (2, N'Giáo viên')
INSERT [dbo].[tutorEdlevel] ([id], [EdLevel]) VALUES (3, N'Đã tốt nghiệp')
INSERT [dbo].[tutorEdlevel] ([id], [EdLevel]) VALUES (4, N'Bất kì')
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([AdminInCharge])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([ParentID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Tutor] ([TutorID])
GO
ALTER TABLE [dbo].[Class]  WITH NOCHECK ADD  CONSTRAINT [FK_TutorEdLevel_Class] FOREIGN KEY([TutorEdLevel])
REFERENCES [dbo].[tutorEdlevel] ([id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_TutorEdLevel_Class]
GO
ALTER TABLE [dbo].[Freeschedule]  WITH CHECK ADD FOREIGN KEY([classId])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Freeschedule]  WITH CHECK ADD FOREIGN KEY([timeId])
REFERENCES [dbo].[Timeschedule] ([id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Tutor] ([TutorID])
GO
ALTER TABLE [dbo].[Tutor]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Tutor]  WITH NOCHECK ADD  CONSTRAINT [FK_TutorEdLevel_Tutor] FOREIGN KEY([EducationLevel])
REFERENCES [dbo].[tutorEdlevel] ([id])
GO
ALTER TABLE [dbo].[Tutor] CHECK CONSTRAINT [FK_TutorEdLevel_Tutor]
GO
ALTER TABLE [dbo].[Tutor_Achievement]  WITH CHECK ADD FOREIGN KEY([AchievementID])
REFERENCES [dbo].[AcademicAchievement] ([AchievementID])
GO
ALTER TABLE [dbo].[Tutor_Achievement]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Tutor] ([TutorID])
GO
ALTER TABLE [dbo].[Tutor_Location]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Tutor_Location]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Tutor] ([TutorID])
GO
ALTER TABLE [dbo].[Tutor_Subject]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Tutor_Subject]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Tutor] ([TutorID])
GO
USE [master]
GO
ALTER DATABASE [SWP_Studium] SET  READ_WRITE 
GO
