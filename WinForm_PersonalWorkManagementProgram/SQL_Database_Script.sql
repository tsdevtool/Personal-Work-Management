USE [master]
GO
/****** Object:  Database [Personal_Work_Management]    Script Date: 11/19/2023 1:05:20 PM ******/
CREATE DATABASE [Personal_Work_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Personal_Work_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Personal_Work_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Personal_Work_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Personal_Work_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Personal_Work_Management] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Personal_Work_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Personal_Work_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Personal_Work_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Personal_Work_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Personal_Work_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Personal_Work_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET RECOVERY FULL 
GO
ALTER DATABASE [Personal_Work_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Personal_Work_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Personal_Work_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Personal_Work_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Personal_Work_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Personal_Work_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Personal_Work_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Personal_Work_Management', N'ON'
GO
ALTER DATABASE [Personal_Work_Management] SET QUERY_STORE = ON
GO
ALTER DATABASE [Personal_Work_Management] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Personal_Work_Management]
GO
/****** Object:  User [tuan]    Script Date: 11/19/2023 1:05:20 PM ******/
CREATE USER [tuan] FOR LOGIN [tuan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [test]    Script Date: 11/19/2023 1:05:20 PM ******/
CREATE USER [test] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sieu1]    Script Date: 11/19/2023 1:05:20 PM ******/
CREATE USER [sieu1] FOR LOGIN [sieu1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 11/19/2023 1:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[maLichLam] [int] IDENTITY(1,1) NOT NULL,
	[ngayLam] [date] NOT NULL,
	[gioBatDau] [int] NOT NULL,
	[gioKetThuc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maLichLam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 11/19/2023 1:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[maLichLam] [int] NOT NULL,
	[maDonHang] [int] NOT NULL,
	[maLoaiDon] [int] NOT NULL,
	[tenKhachHang] [nvarchar](30) NULL,
	[thanhToan] [bit] NOT NULL,
	[soDienThoai] [char](15) NOT NULL,
	[diaChi] [nvarchar](max) NOT NULL,
	[soTien] [int] NOT NULL,
	[tip] [int] NOT NULL,
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[maLichLam] ASC,
	[maDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDonHang]    Script Date: 11/19/2023 1:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDonHang](
	[maLoai] [int] NOT NULL,
	[tenLoai] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salarys]    Script Date: 11/19/2023 1:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salarys](
	[maLuong] [int] IDENTITY(1,1) NOT NULL,
	[soGioCong] [int] NOT NULL,
	[soDonHang] [int] NOT NULL,
	[tienCong] [int] NOT NULL,
	[tienGiaoHang] [int] NOT NULL,
	[tongTien] [int] NOT NULL,
	[ngayBatDau] [date] NOT NULL,
	[ngayKetThuc] [date] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[maLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shedule]    Script Date: 11/19/2023 1:05:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shedule](
	[maLichHoc] [int] IDENTITY(1,1) NOT NULL,
	[ngayHoc] [date] NOT NULL,
	[gioBatDau] [int] NOT NULL,
	[gioKetThuc] [int] NOT NULL,
	[lopHoc] [char](15) NOT NULL,
	[tenMonHoc] [nvarchar](50) NULL,
	[kiemTra] [bit] NOT NULL,
	[baiTapVeNha] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[maLichHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Delivery] ADD  CONSTRAINT [DF_Delivery_soTien]  DEFAULT ((0)) FOR [soTien]
GO
ALTER TABLE [dbo].[Delivery] ADD  CONSTRAINT [DF_Delivery_tip]  DEFAULT ((0)) FOR [tip]
GO
ALTER TABLE [dbo].[Salarys] ADD  CONSTRAINT [DF_Table_1_soGioCong]  DEFAULT ((0)) FOR [soGioCong]
GO
ALTER TABLE [dbo].[Salarys] ADD  CONSTRAINT [DF_Table_1_soDonHang]  DEFAULT ((0)) FOR [soDonHang]
GO
ALTER TABLE [dbo].[Salarys] ADD  CONSTRAINT [DF_Table_1_tienCong]  DEFAULT ((0)) FOR [tienCong]
GO
ALTER TABLE [dbo].[Salarys] ADD  CONSTRAINT [DF_Table_1_tienGiaoHang]  DEFAULT ((0)) FOR [tienGiaoHang]
GO
ALTER TABLE [dbo].[Salarys] ADD  CONSTRAINT [DF_Table_1_tongTien]  DEFAULT ((0)) FOR [tongTien]
GO
ALTER TABLE [dbo].[Shedule] ADD  DEFAULT ((0)) FOR [kiemTra]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Calendar] FOREIGN KEY([maLichLam])
REFERENCES [dbo].[Calendar] ([maLichLam])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Calendar]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_LoaiDonHang] FOREIGN KEY([maLoaiDon])
REFERENCES [dbo].[LoaiDonHang] ([maLoai])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_LoaiDonHang]
GO
USE [master]
GO
ALTER DATABASE [Personal_Work_Management] SET  READ_WRITE 
GO
