USE [master]
GO
/****** Object:  Database [EventSchedule]    Script Date: 7/31/2022 12:24:02 AM ******/
CREATE DATABASE [EventSchedule] ON  PRIMARY 
( NAME = N'EventSchedule', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\EventSchedule.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EventSchedule_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\EventSchedule_log.LDF' , SIZE = 20096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EventSchedule] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventSchedule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventSchedule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventSchedule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventSchedule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventSchedule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventSchedule] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventSchedule] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EventSchedule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventSchedule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventSchedule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventSchedule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventSchedule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventSchedule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventSchedule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventSchedule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventSchedule] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EventSchedule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventSchedule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventSchedule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventSchedule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventSchedule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventSchedule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventSchedule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventSchedule] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventSchedule] SET  MULTI_USER 
GO
ALTER DATABASE [EventSchedule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventSchedule] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EventSchedule', N'ON'
GO
USE [EventSchedule]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [nvarchar](100) NULL,
	[admin_phone] [nvarchar](10) NULL,
	[admin_email] [nvarchar](100) NULL,
	[admin_password] [nvarchar](100) NULL,
	[admin_role] [nvarchar](50) NULL,
	[admin_status] [bit] NULL,
	[image_url] [nvarchar](max) NULL,
 CONSTRAINT [PK__tblClub__BCAD3DD90EA330E9] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblCateg__D54EE9B4014935CB] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEvent]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvent](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[event_name] [nvarchar](50) NULL,
	[event_content] [nvarchar](max) NULL,
	[event_start] [datetime] NULL,
	[event_status] [bit] NULL,
	[category_id] [int] NULL,
	[location_id] [int] NULL,
	[admin_id] [int] NULL,
	[event_end] [datetime] NULL,
 CONSTRAINT [PK__tblEvent__2370F7270519C6AF] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEventParticipated]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEventParticipated](
	[event_id] [int] NOT NULL,
	[users_id] [int] NOT NULL,
	[date_participated] [datetime] NULL,
	[payment_status] [bit] NULL,
	[users_status] [bit] NULL,
 CONSTRAINT [PK__tblEvent__8DDA8A3308EA5793] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [nvarchar](max) NULL,
	[rating] [int] NULL,
	[created_time] [date] NULL,
	[event_id] [int] NULL,
	[users_id] [int] NULL,
 CONSTRAINT [PK__tblFeedb__7A6B2B8C0CBAE877] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblImage]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImage](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[image_url] [nvarchar](max) NULL,
	[event_id] [int] NULL,
	[image_name] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblImage__DC9AC955108B795B] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocation](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[location_detail] [nvarchar](max) NULL,
	[location_status] [char](10) NULL,
 CONSTRAINT [PK__tblLocat__771831EA145C0A3F] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[payment_url] [nvarchar](max) NULL,
	[payment_fee] [int] NULL,
	[payment_detail] [nvarchar](max) NULL,
	[event_id] [int] NULL,
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__tblPayme__ED1FC9EA182C9B23] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[users_id] [int] IDENTITY(1,1) NOT NULL,
	[users_name] [nvarchar](50) NULL,
	[users_email] [nvarchar](100) NULL,
	[users_phone] [nchar](10) NULL,
	[users_address] [nchar](100) NULL,
 CONSTRAINT [PK__tblUser__EAA7D14B1BFD2C07] PRIMARY KEY CLUSTERED 
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVideo]    Script Date: 7/31/2022 12:24:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVideo](
	[video_id] [int] IDENTITY(1,1) NOT NULL,
	[video_url] [nvarchar](max) NULL,
	[event_id] [int] NULL,
	[video_name] [nvarchar](50) NULL,
 CONSTRAINT [PK__tblVideo__E8F11E1007020F21] PRIMARY KEY CLUSTERED 
(
	[video_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAdmin] ON 

INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (1, N'Admin FPT', N'031232331', N'admin@gmail.com', N'123', N'admin', 1, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (3, N'F Live Music', N'0930012148', N'fsharp.fpthcm@gmail.com', N'1', N'club', NULL, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (4, N'FPT football', N'0934215443', N'ffc.fptuhcm@gmail.com', N'1', N'club', NULL, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (5, N'Fstyle hiphop', N'0364652434', N'fptstyle.fpthcm@gmail.com', N'1', N'club', NULL, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (6, N'Multimedia Entertainment', N'0916111237', N'mec.fptuhcmc@gmail.com', N'1', N'club', NULL, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (7, N'FPT basketball', N'0945125844', N'fbc.fptuhcm@gmail.com', N'1', N'club', NULL, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (8, N'FPT Traditional Instruments', N'0967777929', N'fti.fptuhcm@gmail.com', N'1', N'club', NULL, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (9, N'FPTU Public Speaking', N'0945125847', N'fps.fptuhcm@gmail.com ', N'1', N'club', NULL, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (10, N'FPT Vovinam', N'0954812547', N'fvcvovinamclub@gmail.com', N'1', N'club', 1, NULL)
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (11, N'Japan Style', N'0548454745', N'jsc.fptuhcm@gmail.com', N'jsc.fptuhcm@gmail.com', N'club', 1, N'https://firebasestorage.googleapis.com/v0/b/event-schedule-system-4284a.appspot.com/o/clubs%2Fjapanlogo.jpg?alt=media&token=64224631-664a-4c0f-a4ae-490ab6592fd8')
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (22, N'F#', N'0926365236', N'fsharp@gmail.com', N'1', N'club', 1, N'')
INSERT [dbo].[tblAdmin] ([admin_id], [admin_name], [admin_phone], [admin_email], [admin_password], [admin_role], [admin_status], [image_url]) VALUES (23, N'string', N'string', N'string', N'string', N'string', 0, N'string')
SET IDENTITY_INSERT [dbo].[tblAdmin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([category_id], [category_name]) VALUES (1, N'Kinh doanh')
INSERT [dbo].[tblCategory] ([category_id], [category_name]) VALUES (2, N'Gaming')
INSERT [dbo].[tblCategory] ([category_id], [category_name]) VALUES (3, N'Học thuật')
INSERT [dbo].[tblCategory] ([category_id], [category_name]) VALUES (4, N'Thể thao')
INSERT [dbo].[tblCategory] ([category_id], [category_name]) VALUES (5, N'Âm nhạc')
INSERT [dbo].[tblCategory] ([category_id], [category_name]) VALUES (6, N'Hội họa')
INSERT [dbo].[tblCategory] ([category_id], [category_name]) VALUES (7, N'Hoạt động xã hội')
INSERT [dbo].[tblCategory] ([category_id], [category_name]) VALUES (8, N'Công nghệ')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEvent] ON 

INSERT [dbo].[tblEvent] ([event_id], [event_name], [event_content], [event_start], [event_status], [category_id], [location_id], [admin_id], [event_end]) VALUES (2, N'Event Cosplay Japan', N'Are you new to code? Then you come to the right place, in here we invite all those student who want to learn code, who join this event will be seeing a lot of our coding product(games, big project for big company),...', CAST(N'2022-12-21T00:00:00.000' AS DateTime), 1, 3, 1, 1, CAST(N'2023-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tblEvent] ([event_id], [event_name], [event_content], [event_start], [event_status], [category_id], [location_id], [admin_id], [event_end]) VALUES (4, N'Cosplay', N'Are you a weebs? Do you want to find out more about japan, do you want to be your dream character? Then you have come to the right place, in here we cosplay as our favorite character from various anime. We also have a contest which who cosplay the most beautifull will receive a big price, join now', CAST(N'2022-07-12T00:00:00.000' AS DateTime), 1, 3, 1, 11, CAST(N'2022-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[tblEvent] ([event_id], [event_name], [event_content], [event_start], [event_status], [category_id], [location_id], [admin_id], [event_end]) VALUES (7, N'Music Events ', N'Are you in love with music? Do you want to show your music talents to other people? Then this is the right place for you, join now and register your song so that you can perform it live on stage', CAST(N'2022-12-01T00:00:00.000' AS DateTime), 1, 3, 1, 1, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tblEvent] ([event_id], [event_name], [event_content], [event_start], [event_status], [category_id], [location_id], [admin_id], [event_end]) VALUES (1242, N'DỰ ÁN BROTHERS & SISTERS 2022', N'Cốc… Cốc… Cốc… Ở đây đang cần những cánh tay của Brother&Sister 2022 ✌️ Để chuẩn bị chào đón tân sinh viên K18, Phòng Công tác sinh viên Đại học FPT TP. HCM rất cần những cánh tay của các bạn khóa trước hướng dẫn những "tấm chiếu" mới. Hãy cùng nhìn qua những thông tin về dự án này và nhanh tay đăng ký trở thành mảnh ghép của chúng mình nhé ❤ ✨️ BROTHERS&SISTERS LÀ AI? ✅️ Là những người trực tiếp đồng hành cùng các bạn tân sinh viên K18 vượt qua những bỡ ngỡ khi mới bước chân vào trường Đại học FPT TP. HCM. ✅️ Là người sẽ dìu dắt các bạn Tân sinh viên đối mặt với những khó khăn của thời gian đầu nhập học và giúp các bạn khám phá hết mình những trải nghiệm tại ĐH FPT TP. HCM. ✅️ Là những người hướng dẫn, giải đáp thắc mắc và chia sẻ tất tần tật những thông tin về trường F. Ngoài ra BroSis có thể là những người bạn đầu tiên của các bạn tân sinh viên khi mới vào, là người lắng nghe tâm sự của các bạn.  ✨️LÀM SAO TRỞ THÀNH BROTHERS&SISTERS 2022?  ✅️ Sinh viên FPTU HCMC. ✅️ Sinh viên có tinh thần nhiệt huyết, đóng góp vào mục đích chung, có tinh thần trách nhiệm với công việc được phân công. ✅️ Sinh viên có kỹ năng làm việc nhóm, kỹ năng quản lý hoạt động nhóm là một lợi thế. ✅️ Ưu tiên các bạn đã từng làm BroSis những mùa trước. ✅️ Ưu tiên sinh viên đã và đang là BCN các CLB, thành viên nòng cốt của CLB, sinh viên đạt thành tích tốt trong học tập và hoạt động phong trào.', CAST(N'2022-06-08T00:00:00.000' AS DateTime), 1, 2, 2, 3, CAST(N'2022-07-04T23:59:00.000' AS DateTime))
INSERT [dbo].[tblEvent] ([event_id], [event_name], [event_content], [event_start], [event_status], [category_id], [location_id], [admin_id], [event_end]) VALUES (1243, N'TALKSHOW ARTTALK IV - CHẤT LIỆU DÂN GIAN', N'🖼 Chất liệu văn hoá dân gian là những giá trị, những sản phẩm cả vật chất lẫn tinh thần (văn hoá vật thể và phi vật thể, đặc biệt là văn học dân gian) góp phần tạo dựng, hun đúc nên nền văn hoá Việt Nam đậm đà bản sắc dân tộc. 🖼 Bằng việc ứng dụng các chất liệu dân gian vào trong các hoạt động sáng tạo, chúng ta có thể tạo nên các sản phẩm mang đậm chất riêng của mình, lại vừa truyền tải, gìn giữ và phát huy được các di sản văn hóa dân tộc. Đó cũng là những gì mà Arttalk IV với chủ đề xoay quanh Chất liệu dân gian muốn đem đến cho các bạn.', CAST(N'2022-07-09T19:00:00.000' AS DateTime), 1, 6, 12, 1, CAST(N'2022-07-09T21:00:00.000' AS DateTime))
INSERT [dbo].[tblEvent] ([event_id], [event_name], [event_content], [event_start], [event_status], [category_id], [location_id], [admin_id], [event_end]) VALUES (1254, N'𝗪𝗢𝗥𝗞𝗦𝗛𝗢𝗣 #𝟳: 𝗙𝗨𝗧𝗨𝗥𝗘 𝗢𝗙 𝗠𝗘𝗗𝗜𝗔', N'VŨ TRỤ TRUYỀN THÔNG NẰM Ở ĐÂU TRONG VŨ TRỤ CỦA CHÚNG TA ☄️ 
🌏 Hiện nay, một trong những động lực quan trọng thúc đẩy sự phát triển của xã hội phải kể đến chính là vũ trụ truyền thông ✨ Truyền thông trở thành trung tâm của mọi hoạt động kinh tế xã hội và đóng vai trò tác động mạnh mẽ lên thành công lâu dài của bất kì tổ chức, doanh nghiệp, hay thậm chí là thương hiệu cá nhân 😳‼️ 
📍 Tại trường Đại học FPT HCM, chuyên ngành Truyền thông đa Phương tiện là một trong những ngành học nóng hổi và được đông đảo sinh viên quan tâm yêu thích! Tuy nhiên, vì ngành học còn mới lạ, có lẽ sẽ còn nhiều bạn trẻ đang lạc trôi trong vũ trụ truyền thông bao la này chăng ⁉️ 
🔮 Đến với 𝗪𝗼𝗿𝗸𝘀𝗵𝗼𝗽 #𝟳 “𝗙𝘂𝘁𝘂𝗿𝗲 𝗼𝗳 𝗠𝗲𝗱𝗶𝗮”, các bạn trẻ sẽ hiểu rõ hơn tất tần tật về ngành học truyền thông ở hiện tại. Từ đó, các bạn có thể nắm bắt tiềm năng xu thế phát triển của sự nghiệp bản thân trong tương lai, thông qua những lời chia sẻ, giải đáp thắc mắc từ diễn giả 𝗠𝗿. 𝗩𝗜𝗡𝗘𝗘𝗧𝗛 𝗗𝗛𝗥𝗨𝗩𝗔𝗡 có kinh nghiệm thâm niên thực chiến trong ngành nghề truyền thông. 
🔷 Diễn giả: 𝗠𝗿. 𝗩𝗜𝗡𝗘𝗘𝗧𝗛 𝗗𝗛𝗥𝗨𝗩𝗔𝗡 
     🔸 Managing Director tại Publicis Media Vietnam  
     🔸 Có 18 năm kinh nghiệm trong lĩnh vực Media Planning & Buying.   
     🔸 Từng làm việc ở các global agencies lừng lẫy như Mindshare, Starcom, Madison Communications.... 
👾 Hãy nhanh tay đăng ký form dưới đây để có thể dành cho mình một ghế MIỄN PHÍ đầu tư kiến thức quý giá cho hiện tại và cả sự nghiệp tương lai đi bạn nhé ‼️', CAST(N'2022-06-30T10:00:00.000' AS DateTime), 0, 3, 2, 1, CAST(N'2022-06-30T12:00:00.000' AS DateTime))
INSERT [dbo].[tblEvent] ([event_id], [event_name], [event_content], [event_start], [event_status], [category_id], [location_id], [admin_id], [event_end]) VALUES (1255, N'HỒ SEN CHỜ AI 14 - NÓNG', N'Hè đã đến rồi, cái nóng oi bức của mùa hè chắc hẳn sẽ làm chúng ta cảm thấy khó chịu.
☀️Nóng ở đây không chỉ về cái “Nóng” của mùa hè mà còn là những cơn Nóng giận khi bị deadline cận kề hay là những lúc mâu thuẫn với gia đình, bạn bè, áp lực điểm số.
☀️Liệu rằng chúng ta có đủ tỉnh táo để giải quyết nó hay nổi nóng sẽ cách giải quyết dễ nhất và theo sau nó là lời ngụy biện hời hợt: ”Thôi, sao cũng được” ?
Chúng mình ai rồi cũng sẽ có lúc như thế thôi!!!
Vậy còn chần chừ gì nữa mà không đến với:
👉Hồ sen chờ ai - số thứ 14 với chủ đề “Nóng”, các bạn sẽ cảm nhận được một mùa đông Hà Nội giữa cái hè chói chang !!!
🔥🔥Bạn đã thấy “Nóng” chưa ?
Cùng sự tham dự của các khách mời quen thuộc: Thầy Nguyễn Thế Hoàng, Cô Kiều Thị Thu Chung, Cô Hồ Yên Thục và cô Phan Mai Chi.', CAST(N'2022-06-24T20:00:00.000' AS DateTime), 0, 7, 10, 1, CAST(N'2022-06-24T22:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblEvent] OFF
GO
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (2, 2204, CAST(N'2022-07-11T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (4, 2204, CAST(N'2022-07-11T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (1242, 1, CAST(N'2022-10-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (1242, 2, CAST(N'2022-07-09T11:04:41.523' AS DateTime), 1, 1)
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (1242, 3, NULL, 0, NULL)
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (1243, 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (1243, 2, CAST(N'2022-10-21T00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (1243, 5, NULL, 1, NULL)
INSERT [dbo].[tblEventParticipated] ([event_id], [users_id], [date_participated], [payment_status], [users_status]) VALUES (1243, 6, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblFeedback] ON 

INSERT [dbo].[tblFeedback] ([feedback_id], [comment], [rating], [created_time], [event_id], [users_id]) VALUES (17, N'su kien do qua', 2, CAST(N'2022-07-11' AS Date), 4, 2204)
SET IDENTITY_INSERT [dbo].[tblFeedback] OFF
GO
SET IDENTITY_INSERT [dbo].[tblImage] ON 

INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Images%2FJQV1vCII?alt=media&token=adb40a7e-46dd-46d0-ab27-5d3780516db0', NULL, NULL)
INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (2, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Images%2FJQV1vCII?alt=media&token=adb40a7e-46dd-46d0-ab27-5d3780516db0', 2, N'testImage')
INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (3, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Images%2FJQV1vCII?alt=media&token=adb40a7e-46dd-46d0-ab27-5d3780516db0', NULL, N'testImage')
INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (4, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Images%2FJQV1vCII?alt=media&token=adb40a7e-46dd-46d0-ab27-5d3780516db0', NULL, NULL)
INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (5, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Images%2FJQV1vCII?alt=media&token=adb40a7e-46dd-46d0-ab27-5d3780516db0', NULL, NULL)
INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (15, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Images%2FJQV1vCII?alt=media&token=adb40a7e-46dd-46d0-ab27-5d3780516db0', 1242, N'JQV1vCII')
INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (16, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Images%2FrLWGqLRk?alt=media&token=683b6d6b-68d4-4db5-87b2-526299b32490', 1243, N'rLWGqLRk')
INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (20, N'https://firebasestorage.googleapis.com/v0/b/event-schedule-system-4284a.appspot.com/o/chatlieudangian.jpg?alt=media&token=01cf7a8b-6a50-4977-98f1-dc7ffeaf5d27', 1254, N'hTjFqOg1')
INSERT [dbo].[tblImage] ([image_id], [image_url], [event_id], [image_name]) VALUES (21, N'https://firebasestorage.googleapis.com/v0/b/event-schedule-system-4284a.appspot.com/o/chatlieudangian.jpg?alt=media&token=01cf7a8b-6a50-4977-98f1-dc7ffeaf5d27', 1255, N'L1fY9nbv')
SET IDENTITY_INSERT [dbo].[tblImage] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLocation] ON 

INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (1, N'Hội trường B', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (2, N'Hội trường A', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (3, N'Hội trường C', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (4, N'Sảnh trống đồng', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (5, N'Lầu 1 sảnh trống đồng', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (6, N'Lầu 2 sảnh trống đồng', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (7, N'Sân banh', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (8, N'Sân võ lầu 5', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (9, N'Thư viện', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (10, N'Hồ sen', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (11, N'Sân trường', N'open      ')
INSERT [dbo].[tblLocation] ([location_id], [location_detail], [location_status]) VALUES (12, N'Google meet', N'open      ')
SET IDENTITY_INSERT [dbo].[tblLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPayment] ON 

INSERT [dbo].[tblPayment] ([payment_url], [payment_fee], [payment_detail], [event_id], [payment_id]) VALUES (N'https://me.momo.vn/aMI2TPsVUntwTytzFWtNCk/MYer2Yp0RRD2eOB', 50000, N'thanh toan cho event abc', 2, 4)
INSERT [dbo].[tblPayment] ([payment_url], [payment_fee], [payment_detail], [event_id], [payment_id]) VALUES (N'No payment', 0, NULL, 1242, 14)
INSERT [dbo].[tblPayment] ([payment_url], [payment_fee], [payment_detail], [event_id], [payment_id]) VALUES (N'No payment', 0, NULL, 1243, 15)
INSERT [dbo].[tblPayment] ([payment_url], [payment_fee], [payment_detail], [event_id], [payment_id]) VALUES (N'No fee', 0, NULL, 1254, 20)
INSERT [dbo].[tblPayment] ([payment_url], [payment_fee], [payment_detail], [event_id], [payment_id]) VALUES (N'No fee', 0, NULL, 1255, 21)
SET IDENTITY_INSERT [dbo].[tblPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (1, N'Test', N'Test@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (2, N'Phu', N'phu@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (3, N'Hanh', N'hanh@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (4, N'Tan', N'tan@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (5, N'Duc', N'duc@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (6, N'Nhan', N'nhan@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (7, N'Hong', N'hong@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (8, N'Hoang', N'hoang@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (9, N'Hien', N'hien@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (12, N'lan', N'lan@gmail.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (13, N'longphuc', N'longthse150882@fpt.edu.vn', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (223, N'Testin', N'Test@email.com', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (2203, N'UpdateUser', N'Update@gmail.com ', NULL, NULL)
INSERT [dbo].[tblUser] ([users_id], [users_name], [users_email], [users_phone], [users_address]) VALUES (2204, N'Cao Hong Hanh (K15 HCM)', N'hanhchse150754@fpt.edu.vn', N'          ', N'                                                                                                    ')
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
SET IDENTITY_INSERT [dbo].[tblVideo] ON 

INSERT [dbo].[tblVideo] ([video_id], [video_url], [event_id], [video_name]) VALUES (2, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Videos%2FQAvfpKyc?alt=media&token=3c6eeec0-f792-4607-8a5c-aa856567a869', 2, N'testvideo')
INSERT [dbo].[tblVideo] ([video_id], [video_url], [event_id], [video_name]) VALUES (3, N'https://firebasestorage.googleapis.com/v0/b/testfirebase-a9644.appspot.com/o/Videos%2FQAvfpKyc?alt=media&token=3c6eeec0-f792-4607-8a5c-aa856567a869', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblVideo] OFF
GO
ALTER TABLE [dbo].[tblEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_tblAdmin] FOREIGN KEY([admin_id])
REFERENCES [dbo].[tblAdmin] ([admin_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEvent] CHECK CONSTRAINT [FK_tblEvent_tblAdmin]
GO
ALTER TABLE [dbo].[tblEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_tblCategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[tblCategory] ([category_id])
GO
ALTER TABLE [dbo].[tblEvent] CHECK CONSTRAINT [FK_tblEvent_tblCategory]
GO
ALTER TABLE [dbo].[tblEvent]  WITH CHECK ADD  CONSTRAINT [FK_tblEvent_tblLocation] FOREIGN KEY([location_id])
REFERENCES [dbo].[tblLocation] ([location_id])
GO
ALTER TABLE [dbo].[tblEvent] CHECK CONSTRAINT [FK_tblEvent_tblLocation]
GO
ALTER TABLE [dbo].[tblEventParticipated]  WITH CHECK ADD  CONSTRAINT [FK_tblEventParticipated_tblEvent] FOREIGN KEY([event_id])
REFERENCES [dbo].[tblEvent] ([event_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEventParticipated] CHECK CONSTRAINT [FK_tblEventParticipated_tblEvent]
GO
ALTER TABLE [dbo].[tblEventParticipated]  WITH CHECK ADD  CONSTRAINT [FK_tblEventParticipated_tblUser] FOREIGN KEY([users_id])
REFERENCES [dbo].[tblUser] ([users_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblEventParticipated] CHECK CONSTRAINT [FK_tblEventParticipated_tblUser]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedback_tblEventParticipated] FOREIGN KEY([event_id], [users_id])
REFERENCES [dbo].[tblEventParticipated] ([event_id], [users_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK_tblFeedback_tblEventParticipated]
GO
ALTER TABLE [dbo].[tblImage]  WITH CHECK ADD  CONSTRAINT [FK_tblImage_tblEvent] FOREIGN KEY([event_id])
REFERENCES [dbo].[tblEvent] ([event_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblImage] CHECK CONSTRAINT [FK_tblImage_tblEvent]
GO
ALTER TABLE [dbo].[tblPayment]  WITH CHECK ADD  CONSTRAINT [FK_tblPayment_tblEvent] FOREIGN KEY([event_id])
REFERENCES [dbo].[tblEvent] ([event_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPayment] CHECK CONSTRAINT [FK_tblPayment_tblEvent]
GO
ALTER TABLE [dbo].[tblVideo]  WITH CHECK ADD  CONSTRAINT [FK_tblVideo_tblEvent] FOREIGN KEY([event_id])
REFERENCES [dbo].[tblEvent] ([event_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblVideo] CHECK CONSTRAINT [FK_tblVideo_tblEvent]
GO
USE [master]
GO
ALTER DATABASE [EventSchedule] SET  READ_WRITE 
GO
