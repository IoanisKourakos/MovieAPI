USE [MovieDB]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 7/21/2022 9:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[DirectorID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 7/21/2022 9:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [bigint] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](50) NULL,
	[LanguageFlag] [nvarchar](50) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 7/21/2022 9:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Description] [nvarchar](550) NULL,
	[DateRelease] [datetime] NULL,
	[PromoImage] [nvarchar](550) NULL,
	[DirectorID] [bigint] NULL,
	[CategoryID] [bigint] NULL,
	[LanguageID] [bigint] NULL,
	[RatingID] [bigint] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoviesCategory]    Script Date: 7/21/2022 9:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesCategory](
	[CategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Parent] [bigint] NULL,
 CONSTRAINT [PK_MoviesCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 7/21/2022 9:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[PriceID] [bigint] IDENTITY(1,1) NOT NULL,
	[DefaultPricePerDay] [decimal](19, 2) NULL,
	[IfOffer] [bit] NULL,
	[OfferStartDate] [datetime] NULL,
	[OfferEndDate] [datetime] NULL,
	[OfferPricePerDay] [decimal](19, 2) NULL,
	[MovieID] [bigint] NULL,
 CONSTRAINT [PK_Prices] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 7/21/2022 9:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingID] [bigint] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 7/21/2022 9:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[RentalID] [bigint] IDENTITY(1,1) NOT NULL,
	[MovieID] [bigint] NULL,
	[PriceID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[RentalDate] [datetime] NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([DirectorID], [Name]) VALUES (1, N'George Lucas')
INSERT [dbo].[Directors] ([DirectorID], [Name]) VALUES (2, N'Roland Emmerich')
INSERT [dbo].[Directors] ([DirectorID], [Name]) VALUES (3, N'Michael Mann')
INSERT [dbo].[Directors] ([DirectorID], [Name]) VALUES (4, N'George Lucas')
SET IDENTITY_INSERT [dbo].[Directors] OFF
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([LanguageID], [LanguageName], [LanguageFlag]) VALUES (1, N'English', NULL)
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [DateRelease], [PromoImage], [DirectorID], [CategoryID], [LanguageID], [RatingID]) VALUES (1, N'StarWars', N'Starwars Description', CAST(N'1977-04-30T00:00:00.000' AS DateTime), N'movie.jpg', 1, 1, 1, 5)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [DateRelease], [PromoImage], [DirectorID], [CategoryID], [LanguageID], [RatingID]) VALUES (8, N'The Day After Tomorrow', N'The Day After Tomorrow Description', CAST(N'2004-04-30T00:00:00.000' AS DateTime), N'movie.jpg', 2, 1, 1, 5)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [DateRelease], [PromoImage], [DirectorID], [CategoryID], [LanguageID], [RatingID]) VALUES (9, N'Heat', N'Heat Description', CAST(N'1995-04-30T00:00:00.000' AS DateTime), N'movie.jpg', 3, 2, 1, 3)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [DateRelease], [PromoImage], [DirectorID], [CategoryID], [LanguageID], [RatingID]) VALUES (10, N'The Martian', N'The Martian Description', CAST(N'2015-04-30T00:00:00.000' AS DateTime), N'movie.jpg', 4, 4, 1, 4)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[MoviesCategory] ON 

INSERT [dbo].[MoviesCategory] ([CategoryID], [Name], [Parent]) VALUES (1, N'Action', NULL)
INSERT [dbo].[MoviesCategory] ([CategoryID], [Name], [Parent]) VALUES (2, N'Drama', NULL)
INSERT [dbo].[MoviesCategory] ([CategoryID], [Name], [Parent]) VALUES (3, N'Comedy', NULL)
INSERT [dbo].[MoviesCategory] ([CategoryID], [Name], [Parent]) VALUES (4, N'Adventure ', NULL)
SET IDENTITY_INSERT [dbo].[MoviesCategory] OFF
SET IDENTITY_INSERT [dbo].[Prices] ON 

INSERT [dbo].[Prices] ([PriceID], [DefaultPricePerDay], [IfOffer], [OfferStartDate], [OfferEndDate], [OfferPricePerDay], [MovieID]) VALUES (1, CAST(2.00 AS Decimal(19, 2)), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Prices] ([PriceID], [DefaultPricePerDay], [IfOffer], [OfferStartDate], [OfferEndDate], [OfferPricePerDay], [MovieID]) VALUES (2, CAST(3.00 AS Decimal(19, 2)), NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Prices] ([PriceID], [DefaultPricePerDay], [IfOffer], [OfferStartDate], [OfferEndDate], [OfferPricePerDay], [MovieID]) VALUES (3, CAST(4.00 AS Decimal(19, 2)), NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[Prices] ([PriceID], [DefaultPricePerDay], [IfOffer], [OfferStartDate], [OfferEndDate], [OfferPricePerDay], [MovieID]) VALUES (4, CAST(5.00 AS Decimal(19, 2)), NULL, NULL, NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[Prices] OFF
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingID], [Rating]) VALUES (1, 1)
INSERT [dbo].[Rating] ([RatingID], [Rating]) VALUES (2, 2)
INSERT [dbo].[Rating] ([RatingID], [Rating]) VALUES (3, 3)
INSERT [dbo].[Rating] ([RatingID], [Rating]) VALUES (4, 4)
INSERT [dbo].[Rating] ([RatingID], [Rating]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[Rating] OFF
