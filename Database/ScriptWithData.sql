
GO
/****** Object:  Table [dbo].[EducationMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EducationMaster](
	[EducationID] [uniqueidentifier] NOT NULL,
	[Education] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EducationMaster] PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeviceMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceMaster](
	[DeviceID] [uniqueidentifier] NOT NULL,
	[DeviceName] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[DeviceCode] [nvarchar](20) NULL,
	[PhoneNo] [nvarchar](20) NULL,
	[Port] [int] NULL,
	[IPAddress] [nvarchar](50) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_DeviceMaster_1] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignationMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DesignationMaster](
	[DesignationID] [uniqueidentifier] NOT NULL,
	[Designation] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DesignationMaster] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DesignationMaster] ([DesignationID], [Designation], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'ec241528-ca6a-4884-8235-04a19782e298', N'Mid Level', CAST(0x0000A9B701154424 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A9B701155199 AS DateTime), 0)
INSERT [dbo].[DesignationMaster] ([DesignationID], [Designation], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'd9c94c06-72d4-41df-a848-700e1fbb454a', N'Junior', CAST(0x0000A5880034EB55 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880034EB55 AS DateTime), 1)
INSERT [dbo].[DesignationMaster] ([DesignationID], [Designation], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'd2febfa6-7a2d-4456-a888-922e08dd9e05', N'Senior', CAST(0x0000A5880034F9CC AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880034F9CC AS DateTime), 1)
INSERT [dbo].[DesignationMaster] ([DesignationID], [Designation], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'5044b54a-c05e-4644-85cd-a275a9a885a3', N'HR', CAST(0x0000AA7E016379F4 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AA7E01640C43 AS DateTime), 0)
INSERT [dbo].[DesignationMaster] ([DesignationID], [Designation], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'5e876589-2d2d-49ca-b26c-a37b6110ec32', N'Team Leader', CAST(0x0000A5880035061F AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880035061F AS DateTime), 1)
INSERT [dbo].[DesignationMaster] ([DesignationID], [Designation], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'db81a45e-e0ee-41ba-b106-af9a111b4ddf', N'Project Manager', CAST(0x0000A58800351470 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A58800351470 AS DateTime), 1)
INSERT [dbo].[DesignationMaster] ([DesignationID], [Designation], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'bb495b55-206a-452c-8ab0-bbdd354fc7cf', N'Trainee', CAST(0x0000A58800355487 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A58800355487 AS DateTime), 1)
/****** Object:  Table [dbo].[DepartmentMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepartmentMaster](
	[DepartmentID] [uniqueidentifier] NOT NULL,
	[Department] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'e94e39ca-3e2d-424d-8215-01ad4fb1d8e1', N'Backoffice', CAST(0x0000A9530145A9DC AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A9530145A9DC AS DateTime), 1)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'e754b12b-7d60-4f07-9528-17e6bba2a015', N'Business Development', CAST(0x0000A69E00E2095E AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A69E00E2095E AS DateTime), 1)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'b35f88c7-753b-489b-bdc5-1d10ac332b17', N'SALES', CAST(0x0000A9B70115183B AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A9B701152181 AS DateTime), 0)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'44374edd-ed77-48f8-bb9a-31c585a1084a', N'Mobile App Development', CAST(0x0000A9EB00C32193 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A9EB00C37D3F AS DateTime), 1)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'16cb8df5-78fa-4c2f-9e6c-35445a25e28b', N'Android Developer', CAST(0x0000A9EB00C3103B AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A9EB00C3334D AS DateTime), 0)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'6df7ac0b-a7d6-4628-892d-63c16f44f37f', N'.Net', CAST(0x0000A5880034C25A AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB1A010AA359 AS DateTime), 1)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'534a4da2-ef89-44ea-9de1-67a97ee24b96', N'HR-Admin', CAST(0x0000AA7E01658EAC AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000AA7E01658EAC AS DateTime), 1)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'5569064a-e1a8-4c08-ab69-8fe49e83f1f2', N'Design', CAST(0x0000A5880034CB04 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880034CB04 AS DateTime), 1)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'653e568e-76c1-4848-a3f5-a1485e4df3fd', N'iOS Developer', CAST(0x0000A9EB00C2F542 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A9EB00C329C2 AS DateTime), 0)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'c992f3fd-ac1b-4ba8-9634-b04e39963165', N'PHP', CAST(0x0000A5880034B938 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880034B938 AS DateTime), 1)
INSERT [dbo].[DepartmentMaster] ([DepartmentID], [Department], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'88429b8c-d692-41d6-9d5b-d7595efa351a', N'Tester', CAST(0x0000AA920133AF3C AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000AA920133AF3C AS DateTime), 1)
/****** Object:  Table [dbo].[DeductionMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeductionMaster](
	[DeductionID] [uniqueidentifier] NOT NULL,
	[Deduction] [varchar](50) NOT NULL,
	[IsConsider] [bit] NOT NULL,
	[SortNo] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DeductionMaster] PRIMARY KEY CLUSTERED 
(
	[DeductionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DeductionMaster] ([DeductionID], [Deduction], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'a7c0c64a-7c04-477c-ad11-1ff3211684a7', N'Loan Installment', 1, 0, CAST(0x0000A58A004A21B6 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB7B014A7C15 AS DateTime), 0)
INSERT [dbo].[DeductionMaster] ([DeductionID], [Deduction], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'c7a7da2a-741c-401c-a1ad-26d3c7fa15fe', N'TDS', 0, 0, CAST(0x0000A58800360E57 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A58901682CB3 AS DateTime), 1)
INSERT [dbo].[DeductionMaster] ([DeductionID], [Deduction], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'a62c1e8b-c4fe-494a-b487-2e27458ba82d', N'Advance', 0, 0, CAST(0x0000A58A004A373A AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A58A004A373A AS DateTime), 1)
INSERT [dbo].[DeductionMaster] ([DeductionID], [Deduction], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'a9adf4b5-37c9-404e-8615-8ac645c5424c', N'Security Deposit', 0, 0, CAST(0x0000A7E700DDC4B2 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A7E700DDC4B3 AS DateTime), 1)
/****** Object:  Table [dbo].[CurrencyMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CurrencyMaster](
	[CurrencyID] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyCode] [varchar](10) NOT NULL,
	[CurrencySymbol] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CurrencyMaster] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CurrencyMaster] ON
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencySymbol], [IsActive]) VALUES (1, N'INR', N'₹', 1)
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencySymbol], [IsActive]) VALUES (2, N'USD', N'$', 1)
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencySymbol], [IsActive]) VALUES (3, N'EUR', N'€', 1)
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencySymbol], [IsActive]) VALUES (4, N'AUD', N'$', 1)
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencySymbol], [IsActive]) VALUES (5, N'GBP', N'￡', 1)
INSERT [dbo].[CurrencyMaster] ([CurrencyID], [CurrencyCode], [CurrencySymbol], [IsActive]) VALUES (6, N'SGD', N'$', 1)
SET IDENTITY_INSERT [dbo].[CurrencyMaster] OFF
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[CountryID] [uniqueidentifier] NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[Code] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CountryMaster] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CountryMaster] ([CountryID], [CountryName], [Code], [CreatedDate], [IsActive]) VALUES (N'794e4494-3aa6-43a8-96d2-00c40398c102', N'USA', N'US', CAST(0x0000A4260094E446 AS DateTime), 1)
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyMaster](
	[CompanyID] [uniqueidentifier] NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[CompanyLogo] [varchar](50) NULL,
	[EmailAddress] [varchar](200) NOT NULL,
	[CountryId] [uniqueidentifier] NULL,
	[StateId] [uniqueidentifier] NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](1000) NULL,
	[MobileNo] [varchar](15) NULL,
	[PhoneNo] [varchar](15) NULL,
	[HotlineNo] [varchar](15) NULL,
	[FaxNo] [varchar](15) NULL,
	[Website] [varchar](500) NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserEmailId] [varchar](250) NULL,
	[UserEmailPassword] [varchar](250) NULL,
	[IsEnableSSL] [bit] NULL,
	[SMTPHost] [varchar](100) NULL,
	[SMTPPort] [int] NULL,
	[FromEmailId] [varchar](250) NULL,
	[ReceiveEmailIds] [varchar](5000) NULL,
 CONSTRAINT [PK_CompanyMaster] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CompanyMaster] ([CompanyID], [CompanyName], [CompanyLogo], [EmailAddress], [CountryId], [StateId], [City], [Address], [MobileNo], [PhoneNo], [HotlineNo], [FaxNo], [Website], [ModifiedBy], [ModifiedDate], [IsActive], [UserEmailId], [UserEmailPassword], [IsEnableSSL], [SMTPHost], [SMTPPort], [FromEmailId], [ReceiveEmailIds]) VALUES (N'610498d4-dee2-4799-af02-c8ce41e067f1', N'DS Infoway', N'e12d9a70-d870-45d8-91d5-f8ee91d07378.jpg', N'dsinfoways@gmail.com', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'cee9f1d1-75af-4efe-98e2-004a025938fb', N'Rajkot', N'113, 1st Floor, Pride Square, 
Opp. Aalap Avenue, 
Pushkardham Road, JK Chowk, 
Rajkot, Gujarat 360005 INDIA', N'9824405764', N'9824405764', N'9824405764', N'9824405764', N'www.dsinfoway.com', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000ABDA00E1CF18 AS DateTime), 1, N'hrm@dsinfoway.net', N'DsInfo@123', 1, N'dsinfoway.net', 25, N'hrm@dsinfoway.net', N'hrm@dsinfoway.net')
/****** Object:  Table [dbo].[AllowanceMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllowanceMaster](
	[AllowanceID] [uniqueidentifier] NOT NULL,
	[Allowance] [varchar](50) NOT NULL,
	[IsConsider] [bit] NOT NULL,
	[SortNo] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Percentage] [float] NULL,
 CONSTRAINT [PK_AllowanceMaster] PRIMARY KEY CLUSTERED 
(
	[AllowanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AllowanceMaster] ([AllowanceID], [Allowance], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive], [Percentage]) VALUES (N'2aaa94cd-de49-4b57-b39e-009107a2df97', N'Education Allowance', 1, 3, CAST(0x0000A5880036C8AB AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880036C8AB AS DateTime), 1, 3)
INSERT [dbo].[AllowanceMaster] ([AllowanceID], [Allowance], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive], [Percentage]) VALUES (N'654f1058-cd62-49cd-8a09-307ab2c46b99', N'HRA', 1, 1, CAST(0x0000A5880035C878 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880035C878 AS DateTime), 1, 18)
INSERT [dbo].[AllowanceMaster] ([AllowanceID], [Allowance], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive], [Percentage]) VALUES (N'17c9be7b-cdf0-40eb-b6d3-366a9b3d59f8', N'Performance Allowance', 1, 7, CAST(0x0000A58800373895 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A58800373895 AS DateTime), 1, 7)
INSERT [dbo].[AllowanceMaster] ([AllowanceID], [Allowance], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive], [Percentage]) VALUES (N'ca6958ea-6c85-488d-b0ca-73f6f6952731', N'Conveyance Allowance', 1, 2, CAST(0x0000A5880036B459 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880036B459 AS DateTime), 1, 5)
INSERT [dbo].[AllowanceMaster] ([AllowanceID], [Allowance], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive], [Percentage]) VALUES (N'53aeebbd-a4ec-493e-9fdf-b78242f1c519', N'Medical Allowance', 1, 5, CAST(0x0000A5880036EFA7 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5880036EFA7 AS DateTime), 1, 6)
INSERT [dbo].[AllowanceMaster] ([AllowanceID], [Allowance], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive], [Percentage]) VALUES (N'f914a05e-8d5b-4563-bad5-d6ed6506c6e2', N'Special Allowance', 1, 0, CAST(0x0000A5880036DCA6 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A5E101240268 AS DateTime), 1, 22)
INSERT [dbo].[AllowanceMaster] ([AllowanceID], [Allowance], [IsConsider], [SortNo], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive], [Percentage]) VALUES (N'd1bcb9b6-ffaf-42f8-8d3d-eec4da67bc42', N'Leave Travel Allowance', 1, 6, CAST(0x0000A58800371226 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A58800371226 AS DateTime), 1, 3)
/****** Object:  Table [dbo].[EmployeeAttendanceDevice]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeAttendanceDevice](
	[EmployeeAttendanceID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NULL,
	[DeviceId] [uniqueidentifier] NULL,
	[EnrollNo] [nvarchar](15) NULL,
	[AttendanceDate] [datetime] NULL,
	[AttendanceDateTime] [datetime] NULL,
	[PunchTime] [nvarchar](11) NULL,
	[VerifyMethod] [nvarchar](10) NULL,
	[PunchMethod] [varchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_EmployeeAttendanceDevice] PRIMARY KEY CLUSTERED 
(
	[EmployeeAttendanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeGradeMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeGradeMaster](
	[EmployeeGradeID] [uniqueidentifier] NOT NULL,
	[EmployeeGrade] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeGradeMaster] PRIMARY KEY CLUSTERED 
(
	[EmployeeGradeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EmployeeGradeMaster] ([EmployeeGradeID], [EmployeeGrade], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'8ab70713-a15f-4bb7-a663-03bc6cb23c25', N'C', CAST(0x0000A9B701150449 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A9B701150449 AS DateTime), 1)
INSERT [dbo].[EmployeeGradeMaster] ([EmployeeGradeID], [EmployeeGrade], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'39a9356f-ae85-44b4-9dd2-32999c2f7789', N'A', CAST(0x0000A5880034A953 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB1A010A787A AS DateTime), 1)
INSERT [dbo].[EmployeeGradeMaster] ([EmployeeGradeID], [EmployeeGrade], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'd158834a-07e1-4c23-b5ac-7186f90ef30c', N'B', CAST(0x0000A809016169FC AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A809016169FC AS DateTime), 1)
/****** Object:  Table [dbo].[EmployeeDeviceMap]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDeviceMap](
	[EmployeeDeviceID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NULL,
	[DeviceId] [uniqueidentifier] NULL,
	[EnrollNo] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_EmployeeDeviceMap] PRIMARY KEY CLUSTERED 
(
	[EmployeeDeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePaidDeductionMap]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePaidDeductionMap](
	[EmployeePaidDeductionMapID] [uniqueidentifier] NOT NULL,
	[EmployeePaidSalaryId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[DeductionId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](12, 2) NULL,
	[PaidAmount] [decimal](12, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeePaidDeductionMap] PRIMARY KEY CLUSTERED 
(
	[EmployeePaidDeductionMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePaidAllowanceMap]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePaidAllowanceMap](
	[EmployeePaidAllowanceMapID] [uniqueidentifier] NOT NULL,
	[EmployeePaidSalaryId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[AllowanceId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](12, 2) NULL,
	[PaidAmount] [decimal](12, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeePaidAllowanceMap] PRIMARY KEY CLUSTERED 
(
	[EmployeePaidAllowanceMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShiftMaster](
	[ShiftID] [uniqueidentifier] NOT NULL,
	[Shift] [varchar](50) NOT NULL,
	[FromTime] [varchar](20) NULL,
	[ToTime] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ShiftMaster] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ShiftMaster] ([ShiftID], [Shift], [FromTime], [ToTime], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'8a35b967-d841-4966-8b49-043955baa7e7', N'Full Day', N'10:00 AM', N'08:00 PM', CAST(0x0000A58800358493 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AAE70160867D AS DateTime), 1)
INSERT [dbo].[ShiftMaster] ([ShiftID], [Shift], [FromTime], [ToTime], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'9d211469-1340-48ee-93d6-12e508f64786', N'MorningTESTSHIFT', N'08:01 AM', N'06:01 PM', CAST(0x0000AAE7015BBB29 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AAE7016077E3 AS DateTime), 0)
INSERT [dbo].[ShiftMaster] ([ShiftID], [Shift], [FromTime], [ToTime], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'a82bbc5a-01f4-437a-ac3f-c9491bd5dc25', N'Night shift', N'10:00 PM', N'04:00 AM', CAST(0x0000A9B701157D8E AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A9B701157D8E AS DateTime), 1)
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleMaster](
	[RoleID] [uniqueidentifier] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RoleMaster] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName], [IsActive]) VALUES (N'c2737ea6-bfe8-401d-ad15-43147de775ca', N'Administrator', 1)
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName], [IsActive]) VALUES (N'5417f6e8-9dab-4a8c-9c35-cb197193be13', N'Employee', 1)
/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModuleMaster](
	[ModuleID] [uniqueidentifier] NOT NULL,
	[EnumName] [varchar](200) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[TreeLevel] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ModuleMaster] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaveCategoryMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveCategoryMaster](
	[LeaveCategoryID] [uniqueidentifier] NOT NULL,
	[LeaveCategory] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_LeaveCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[LeaveCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[LeaveCategoryMaster] ([LeaveCategoryID], [LeaveCategory], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'77c9a2ad-1045-423a-b74e-0ded19169b5b', N'Others', CAST(0x0000A5890174AB68 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', NULL, CAST(0x0000A5890174AB68 AS DateTime), 1)
INSERT [dbo].[LeaveCategoryMaster] ([LeaveCategoryID], [LeaveCategory], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'65ad615a-e0c8-4e99-b90b-a11c7b58ad8b', N'Emergancy Leave', CAST(0x0000A58800379A9A AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A58A0048F6C6 AS DateTime), 1)
INSERT [dbo].[LeaveCategoryMaster] ([LeaveCategoryID], [LeaveCategory], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'38c1de1d-ae17-47b2-8d66-b0488e410c4d', N'Sick Leave', CAST(0x0000A58800376694 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A58A00494122 AS DateTime), 1)
INSERT [dbo].[LeaveCategoryMaster] ([LeaveCategoryID], [LeaveCategory], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'cec42a9e-a506-41a1-bdb7-ffae9e977286', N'Causal Leave', CAST(0x0000A58800377117 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A58A0048E7F5 AS DateTime), 1)
/****** Object:  Table [dbo].[EmployeeTypeMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeTypeMaster](
	[EmployeeTypeID] [uniqueidentifier] NOT NULL,
	[EmployeeType] [varchar](50) NOT NULL,
	[NoOfLeavePerMonth] [decimal](5, 1) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeTypeMaster] PRIMARY KEY CLUSTERED 
(
	[EmployeeTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EmployeeTypeMaster] ([EmployeeTypeID], [EmployeeType], [NoOfLeavePerMonth], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'f394a47e-0573-4616-8025-3cc878259c1d', N'Permanent', CAST(1.0 AS Decimal(5, 1)), CAST(0x0000A58800349D9B AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB1A010A40B9 AS DateTime), 1)
INSERT [dbo].[EmployeeTypeMaster] ([EmployeeTypeID], [EmployeeType], [NoOfLeavePerMonth], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'66405d47-1b7d-4b62-b7bd-6d482630e9f9', N'temporaruy', CAST(3.0 AS Decimal(5, 1)), CAST(0x0000A9B70114EE34 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A9B70114F730 AS DateTime), 0)
INSERT [dbo].[EmployeeTypeMaster] ([EmployeeTypeID], [EmployeeType], [NoOfLeavePerMonth], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'211b7a43-189b-43cd-afdd-f86ddae9ab39', N'Contract', CAST(1.0 AS Decimal(5, 1)), CAST(0x0000A588003493CF AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB1A010A19DC AS DateTime), 1)
/****** Object:  Table [dbo].[InterviewMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InterviewMaster](
	[InterviewID] [uniqueidentifier] NOT NULL,
	[FullName] [varchar](150) NULL,
	[Email] [varchar](200) NULL,
	[MobileNo] [varchar](15) NULL,
	[Address] [varchar](1000) NULL,
	[EducationId] [uniqueidentifier] NOT NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[CurrentSalary] [varchar](50) NULL,
	[ExpectedSalary] [varchar](50) NULL,
	[ExperienceYear] [varchar](50) NULL,
	[ExperienceMonth] [varchar](50) NULL,
	[IsJoiningDay] [bit] NULL,
	[NoticePeriod] [varchar](50) NULL,
	[PersonalDetail] [text] NULL,
	[ResumeName] [varchar](50) NULL,
	[CertificateName] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Description] [text] NULL,
	[InterviewDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_InterviewMaster] PRIMARY KEY CLUSTERED 
(
	[InterviewID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HolidayMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HolidayMaster](
	[HolidayID] [uniqueidentifier] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_HolidayMaster] PRIMARY KEY CLUSTERED 
(
	[HolidayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HolidayMaster] ([HolidayID], [Title], [Description], [StartDate], [EndDate], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'2e41c3ac-1cec-4cf6-8e06-266a8ae72914', N'31st December', N'The End of year Celebration so we are having a full day leave. 
enjoy the last day of this year :)', CAST(0x0000AB3400000000 AS DateTime), CAST(0x0000AB3400000000 AS DateTime), CAST(0x0000AB2D00C4E1D0 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB3100B86A9D AS DateTime), 1)
INSERT [dbo].[HolidayMaster] ([HolidayID], [Title], [Description], [StartDate], [EndDate], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'a5a146cb-052b-44ea-afa7-33ad414684e8', N'Satam / Aatham', N'Janmasthami Holidays (4 Days)', CAST(0x0000AC1200000000 AS DateTime), CAST(0x0000AC1500000000 AS DateTime), CAST(0x0000A58901868AC1 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB3301263CE2 AS DateTime), 1)
INSERT [dbo].[HolidayMaster] ([HolidayID], [Title], [Description], [StartDate], [EndDate], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'463c40e7-55f1-4200-a739-8bcbe81b4cb2', N'Diwali', N'Diwali Holidays (4 Days)', CAST(0x0000AC7400000000 AS DateTime), CAST(0x0000AC7700000000 AS DateTime), CAST(0x0000A58901878CC9 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB3301265D1D AS DateTime), 1)
INSERT [dbo].[HolidayMaster] ([HolidayID], [Title], [Description], [StartDate], [EndDate], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'0e4fed46-7c7d-40f4-a77c-a4c222de3bd3', N'Makar Sankranti', N'Makar Sankranti ( Kite Festival)', CAST(0x0000AB4200000000 AS DateTime), CAST(0x0000AB4200000000 AS DateTime), CAST(0x0000A800012F3A0B AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB33011B792B AS DateTime), 1)
INSERT [dbo].[HolidayMaster] ([HolidayID], [Title], [Description], [StartDate], [EndDate], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'f05611df-1e4c-4358-88e5-bec6444a5909', N'Christmas', N'Christmas Holiday 2020', CAST(0x0000AC9C00000000 AS DateTime), CAST(0x0000AC9C00000000 AS DateTime), CAST(0x0000AB330120F796 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB33012106F3 AS DateTime), 1)
INSERT [dbo].[HolidayMaster] ([HolidayID], [Title], [Description], [StartDate], [EndDate], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'3cfeb50b-2509-4650-997f-d86cfa16ac6b', N'Dhuleti', N'Holi''s Next Day – Dhuleti', CAST(0x0000AB7A00000000 AS DateTime), CAST(0x0000AB7A00000000 AS DateTime), CAST(0x0000A5890184E1F8 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB33011BD02D AS DateTime), 1)
INSERT [dbo].[HolidayMaster] ([HolidayID], [Title], [Description], [StartDate], [EndDate], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'a4577744-d684-477f-a886-e90d3fd28668', N'Raksha Bandhan', N'Raksha Bandhan', CAST(0x0000AC0C00000000 AS DateTime), CAST(0x0000AC0C00000000 AS DateTime), CAST(0x0000A58901853857 AS DateTime), N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000AB33011C57CB AS DateTime), 1)
/****** Object:  Table [dbo].[History]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[HistoryID] [uniqueidentifier] NOT NULL,
	[Description] [varchar](max) NULL,
	[TableId] [varchar](50) NULL,
	[TableTypeId] [int] NOT NULL,
	[OperationTypeId] [int] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[XmlContent] [varchar](max) NULL,
	[IPAddress] [varchar](20) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FinancialYearMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FinancialYearMaster](
	[FinancialYearID] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[FinancialYear] [varchar](15) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StartMonth] [int] NOT NULL,
	[EndMonth] [int] NOT NULL,
 CONSTRAINT [PK_FinancialYearMaster] PRIMARY KEY CLUSTERED 
(
	[FinancialYearID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[FinancialYearMaster] ([FinancialYearID], [Year], [FinancialYear], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive], [StartMonth], [EndMonth]) VALUES (N'be6071ff-a52e-4d85-93cc-e43cdbe7cd6e', 2020, N'2020 - 2021', CAST(0x0000ABDA017E75BE AS DateTime), NULL, NULL, CAST(0x0000ABDA017E75BE AS DateTime), 1, 4, 3)
/****** Object:  Table [dbo].[VisitMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VisitMaster](
	[VisitID] [uniqueidentifier] NOT NULL,
	[FullName] [varchar](150) NULL,
	[NoOfPerson] [int] NULL,
	[Email] [varchar](200) NULL,
	[MobileNo] [varchar](15) NULL,
	[Address] [varchar](1000) NULL,
	[VisitToName] [varchar](150) NULL,
	[VisitReference] [varchar](150) NULL,
	[Relation] [varchar](50) NULL,
	[Purpose] [varchar](500) NULL,
	[VisitInDateTime] [datetime] NULL,
	[VisitOutDateTime] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_VisitMaster] PRIMARY KEY CLUSTERED 
(
	[VisitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StateMaster](
	[StateID] [uniqueidentifier] NOT NULL,
	[CountryId] [uniqueidentifier] NULL,
	[StateName] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_StateMaster] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'cee9f1d1-75af-4efe-98e2-004a025938fb', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Alabama', CAST(0x0000A4260097AE8F AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'63d32080-d7ef-410c-a292-0826137b9695', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Alaska', CAST(0x0000A4260097AE8E AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'db071d7a-3050-40b1-9845-0d333c740cc9', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Arizona', CAST(0x0000A4260097AE8D AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'066301ba-e4fc-40b0-ba27-0eac9c918d4d', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Arkansas', CAST(0x0000A4260097AE92 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'c42bb78a-98d1-4fa3-a1e1-0f7d72421299', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'California', CAST(0x0000A4260097AE8D AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'c6b8c739-6e5d-4412-bd03-12347c8d8086', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Tennessee', CAST(0x0000AC0100F871BF AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'b11283bd-0409-4bc5-993c-1af51e4a74bd', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Colorado', CAST(0x0000A4260097AE92 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'742cccd8-bb7f-42b0-8764-1ed535350635', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Connecticut', CAST(0x0000A4260097AE8C AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'ae299358-b6d0-44da-b125-257a43415621', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Delaware', CAST(0x0000A4260097AE90 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'69f2a0a1-7235-4340-9c78-2717f0f4b491', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Florida', CAST(0x0000A4260097AE8B AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'09654610-4860-4695-8122-2e05940f4827', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'South Dakota', CAST(0x0000AC0100F868A4 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'd34b6fff-d84b-4d14-afb6-304bd83fa528', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Georgia', CAST(0x0000A4260097AE8C AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'cf72b687-eddc-412e-a119-3374b257e650', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Hawaii', CAST(0x0000A4260097AE91 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'dbdb778b-76f5-4b25-adab-36f9529dea37', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Idaho', CAST(0x0000A4260097AE8C AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'9702984b-7a9c-496b-8075-3dbc5b72cd3b', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'IllinoisIndiana', CAST(0x0000A4260097AE8F AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'a281cc13-8425-44fa-b3eb-45b577ab00c1', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Washington', CAST(0x0000AC0100F8A4AC AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'c4e90a4e-c3c1-4d62-821c-49ae1ae4600d', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Iowa', CAST(0x0000A4260097AE8C AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'431223d9-e905-4ec9-ad17-4b7c4d0d9a85', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Vermont', CAST(0x0000AC0100F88ADE AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'8a60fd17-2e2f-4034-9eac-528d3c36d2ae', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Kansas', CAST(0x0000A4260097AE91 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'917c6362-88d6-48fd-874b-53a241e97f53', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Kentucky', CAST(0x0000A4260097AE8C AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'd89be818-caab-442f-8d25-53d9bbc0fe3d', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Louisiana', CAST(0x0000A4260097AE8C AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'3c628262-f087-496b-ae21-589c9660b2c0', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'South Carolina', CAST(0x0000AC0100F85E18 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'96c5e5b2-0d51-44eb-8252-5991430e3abc', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Maine', CAST(0x0000A4260097AE8E AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'88b3691e-d534-431d-8c53-5d44b542bcad', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Maryland', CAST(0x0000A4260097AE8E AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'413ad503-7f3b-48c3-ac62-693e974f2921', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Massachusetts', CAST(0x0000A4260097AE90 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'75ec4577-0549-465f-b2e4-6d7136320979', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Utah', CAST(0x0000AC0100F88233 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'3003f2a1-b7da-4dbf-9195-743f22b2578b', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Michigan', CAST(0x0000A4260097AE90 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'3c87d7ac-6625-4246-a796-7ac018f02f5a', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Minnesota', CAST(0x0000A4260097AE92 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'089e7198-392d-4e59-9952-8117cc9db480', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Virginia', CAST(0x0000AC0100F88EFB AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'8944b643-b9d8-429d-9ace-81c60ddee694', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Mississippi', CAST(0x0000A4260097AE8D AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'3e8e916a-29f4-4f37-98a0-879909132333', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Missouri', CAST(0x0000A4260097AE93 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'7a0a5d9a-2866-4759-917d-87c8aab019f2', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'MontanaNebraska', CAST(0x0000A4260097AE8D AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'a1129d03-4b13-4969-bd9a-933a1a5e5f22', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Nevada', CAST(0x0000A4260097AE8C AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'c88dc2e7-4ac9-46b7-93c6-93d1b088e0f9', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Texas', CAST(0x0000AC0100F87A2F AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'694b1436-75cc-44b2-baee-947b9faf3d2c', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'New Hampshire', CAST(0x0000A4260097AE8B AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'a5d2541b-361e-42dd-8833-9505ae139d10', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'New Jersey', CAST(0x0000A4260097AE8E AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'014a5632-991d-4f92-8238-9ab73009bdb0', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Wisconsin', CAST(0x0000AC0100F8BC00 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'30806b0d-7158-41d1-9799-9ecd5db7dee7', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'West Virginia', CAST(0x0000AC0100F8B0BD AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'e21ef859-ac0c-4d05-82ba-aa21ca519535', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'New Mexico', CAST(0x0000A4260097AE8E AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'e9f5b318-df03-448a-999e-b041b75ba3fa', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Wyoming', CAST(0x0000AC0100F8C7E6 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'2d39f74d-197d-45d2-96de-b6dc01230e7f', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'New York', CAST(0x0000A4260097AE8F AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'84ba6619-1de5-439e-aa1d-cef9bf418fa7', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'North Carolina', CAST(0x0000A4260097AE8D AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'5515214d-77c3-4fe4-9cf9-d08e76e236b4', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'North Dakota', CAST(0x0000A4260097AE91 AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'd427de44-be94-47ae-b244-d153ea3e1407', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Ohio', CAST(0x0000A4260097AE8C AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'21208ec6-d2d3-4a6c-a7f7-e229f0077017', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Oklahoma', CAST(0x0000A4260097AE8B AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'bbcc1813-229b-4c30-9c15-f16787dbff28', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'Oregon', CAST(0x0000A4260097AE8E AS DateTime), 1)
INSERT [dbo].[StateMaster] ([StateID], [CountryId], [StateName], [CreatedDate], [IsActive]) VALUES (N'ee19de72-eae1-4a16-8382-fe3dfef003e4', N'794e4494-3aa6-43a8-96d2-00c40398c102', N'PennsylvaniaRhode Island', CAST(0x0000AC0100F84A3B AS DateTime), 1)
/****** Object:  UserDefinedFunction [dbo].[GetTime]    Script Date: 07/30/2021 12:29:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetTime] 
(
	@Date DateTime,
	@EmployeeId uniqueidentifier
)
RETURNS varchar(max)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @AllTimeEntry varchar(max)
SELECT   @AllTimeEntry = ISNULL(@AllTimeEntry + '|', '') +' '+ PunchTime+' '
FROM   EmployeeAttendanceDevice
WHERE   AttendanceDate = @Date and EmployeeId=@EmployeeId and IsActive=1
order by AttendanceDateTime
RETURN @AllTimeEntry

END
GO
/****** Object:  Table [dbo].[InvoiceMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceMaster](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[CurrencyId] [int] NULL,
	[PartyName] [nvarchar](50) NULL,
	[PartyAddress] [nvarchar](500) NULL,
	[Description] [nvarchar](100) NULL,
	[SubTotal] [decimal](12, 2) NULL,
	[ServiceTax] [decimal](12, 2) NULL,
	[GrandTotal] [decimal](12, 2) NULL,
	[SubTotalINR] [decimal](12, 2) NULL,
	[ServiceTaxINR] [decimal](12, 2) NULL,
	[GrandTotalINR] [decimal](12, 2) NULL,
	[IsFixed] [bit] NULL,
	[IsPaid] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_InvoiceMaster] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeMaster](
	[EmployeeID] [uniqueidentifier] NOT NULL,
	[EmployeeTypeId] [uniqueidentifier] NOT NULL,
	[EmployeeGradeId] [uniqueidentifier] NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[ShiftId] [uniqueidentifier] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[FatherName] [varchar](150) NULL,
	[Gender] [bit] NULL,
	[MaratialStatus] [varchar](50) NULL,
	[Cast] [varchar](50) NULL,
	[PhotoName] [varchar](50) NULL,
	[CountryId] [uniqueidentifier] NULL,
	[StateId] [uniqueidentifier] NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](1000) NULL,
	[PinCode] [varchar](10) NULL,
	[MobileNo] [varchar](15) NULL,
	[PhoneNo] [varchar](15) NULL,
	[JoinDate] [datetime] NULL,
	[EmployeeNo] [int] NOT NULL,
	[PFNo] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[BankName] [varchar](50) NULL,
	[BranchName] [varchar](50) NULL,
	[AccountName] [varchar](150) NULL,
	[AccountNo] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsLeave] [bit] NOT NULL,
	[LeaveDate] [datetime] NULL,
	[LeaveDescription] [varchar](max) NULL,
	[Previlage] [nvarchar](20) NULL,
	[Password] [nvarchar](50) NULL,
	[FaceTemplate] [nvarchar](max) NULL,
	[IsHavingFace] [bit] NULL,
	[FaceLength] [int] NULL,
	[FingureTemplate] [nvarchar](max) NULL,
	[finger_template_data_bw] [varbinary](max) NULL,
	[finger_template_data_tft] [varbinary](max) NULL,
	[finger_template_data_tft1] [varbinary](max) NULL,
	[finger_template_data_tft2] [varbinary](max) NULL,
	[finger_template_data_tft3] [varbinary](max) NULL,
	[finger_template_data_tft4] [varbinary](max) NULL,
	[finger_template_data_tft5] [varbinary](max) NULL,
	[finger_template_data_tft6] [varbinary](max) NULL,
	[finger_template_data_tft7] [varbinary](max) NULL,
	[finger_template_data_tft8] [varbinary](max) NULL,
	[finger_template_data_tft9] [varbinary](max) NULL,
	[finger_template_data_bw1] [varbinary](max) NULL,
	[finger_template_data_bw2] [varbinary](max) NULL,
	[finger_template_data_bw3] [varbinary](max) NULL,
	[finger_template_data_bw4] [varbinary](max) NULL,
	[finger_template_data_bw5] [varbinary](max) NULL,
	[finger_template_data_bw6] [varbinary](max) NULL,
	[finger_template_data_bw7] [varbinary](max) NULL,
	[finger_template_data_bw8] [varbinary](max) NULL,
	[finger_template_data_bw9] [varbinary](max) NULL,
	[is_having_fingureprint] [bit] NULL,
	[IsSend] [bit] NULL,
	[FaceTemplateData] [varbinary](max) NULL,
 CONSTRAINT [PK_EmployeeMaster] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeLoan]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeLoan](
	[EmployeeLoanMapID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](12, 2) NOT NULL,
	[LoanDate] [datetime] NOT NULL,
	[LoanTitle] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[ApprovedBy] [varchar](150) NULL,
	[TotalMonths] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsComplete] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeLoanMap] PRIMARY KEY CLUSTERED 
(
	[EmployeeLoanMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeLeaveCategory]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeLeaveCategory](
	[EmployeeLeaveCategoryMapID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[LeaveCategoryId] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[TotalDay] [decimal](12, 2) NULL,
	[IsFirstHalfDay] [bit] NOT NULL,
	[IsLastHalfDay] [bit] NOT NULL,
	[Reason] [varchar](1000) NOT NULL,
	[Comments] [varchar](1000) NULL,
	[ApplyDate] [datetime] NULL,
	[ApprovedBy] [varchar](150) NULL,
	[ApproveDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsApprove] [bit] NULL,
 CONSTRAINT [PK_EmployeeLeaveCategoryMap] PRIMARY KEY CLUSTERED 
(
	[EmployeeLeaveCategoryMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeDeductionMap]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDeductionMap](
	[EmployeeDeductionMapID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[DeductionId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](12, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeDeductionMap] PRIMARY KEY CLUSTERED 
(
	[EmployeeDeductionMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeAttendance]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeAttendance](
	[EmployeeAttendanceID] [uniqueidentifier] NOT NULL,
	[FinancialYearId] [uniqueidentifier] NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
	[TimeIn] [varchar](50) NULL,
	[TimeOut] [varchar](50) NULL,
	[WorkingHours] [decimal](10, 2) NULL,
	[OverTimeHours] [decimal](10, 2) NULL,
	[AttendanceType] [int] NULL,
	[Attendance] [decimal](6, 2) NULL,
	[Description] [varchar](1000) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeAttendance] PRIMARY KEY CLUSTERED 
(
	[EmployeeAttendanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeAttachment]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeAttachment](
	[EmployeeAttachmentMapID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NULL,
	[AttachmentName] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeAttachmentMap] PRIMARY KEY CLUSTERED 
(
	[EmployeeAttachmentMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeAllowanceMap]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAllowanceMap](
	[EmployeeAllowanceMapID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[AllowanceId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](12, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeAllowanceMap] PRIMARY KEY CLUSTERED 
(
	[EmployeeAllowanceMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[InvoiceDetailID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NULL,
	[ItemDescription] [nvarchar](100) NOT NULL,
	[ItemDate] [datetime] NOT NULL,
	[Hours] [decimal](8, 2) NULL,
	[HourRate] [decimal](8, 2) NULL,
	[Amount] [decimal](12, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSalary]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSalary](
	[EmployeeSalaryID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Basic] [decimal](12, 2) NULL,
	[TotalEarning] [decimal](12, 2) NULL,
	[TotalDeduction] [decimal](12, 2) NULL,
	[TotalSalary] [decimal](12, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeSalary] PRIMARY KEY CLUSTERED 
(
	[EmployeeSalaryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePaidSalary]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeePaidSalary](
	[EmployeePaidSalaryID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Basic] [decimal](12, 2) NULL,
	[TotalEarning] [decimal](12, 2) NULL,
	[TotalDeduction] [decimal](12, 2) NULL,
	[TotalSalary] [decimal](12, 2) NULL,
	[PaidBasic] [decimal](12, 2) NULL,
	[PaidTotalEarning] [decimal](12, 2) NULL,
	[PaidTotalDeduction] [decimal](12, 2) NULL,
	[PaidTotalSalary] [decimal](12, 2) NULL,
	[Month] [varchar](15) NOT NULL,
	[Year] [int] NOT NULL,
	[TotalOverTimeDays] [decimal](12, 2) NULL,
	[TotalDays] [int] NOT NULL,
	[AllowLeave] [decimal](6, 2) NULL,
	[TotalUseLeave] [decimal](6, 1) NULL,
	[TotalHoliday] [decimal](6, 1) NULL,
	[TotalPaidLeave] [decimal](6, 1) NULL,
	[TotalPaidLeaveAmount] [decimal](12, 2) NULL,
	[TotalOverTimeAmount] [decimal](12, 2) NULL,
	[PaidLoanAmount] [decimal](12, 2) NULL,
	[PaidDate] [datetime] NOT NULL,
	[PaidBy] [varchar](150) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[FinancialYearId] [uniqueidentifier] NOT NULL,
	[TotalPresentDays] [decimal](6, 1) NULL,
	[ProfessionalTax] [decimal](12, 2) NULL,
 CONSTRAINT [PK_EmployeePaidSalary] PRIMARY KEY CLUSTERED 
(
	[EmployeePaidSalaryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserID] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NULL,
	[Username] [varchar](200) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[LastLogin] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[UserMaster] ([UserID], [RoleId], [EmployeeId], [Username], [Password], [LastLogin], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (N'6f99a72f-7785-4b38-b90d-95f9b99379bd', N'c2737ea6-bfe8-401d-ad15-43147de775ca', NULL, N'demo@dsinfoway.com', N'6waAKwqQRGTTK43dHyBuAotSO31oqjOSHVEJT/nHPo8=', CAST(0x0000ABDA017A820B AS DateTime), CAST(0x0000A55C0100D3A5 AS DateTime), NULL, N'6f99a72f-7785-4b38-b90d-95f9b99379bd', CAST(0x0000A55D0127EEBD AS DateTime), 1)
/****** Object:  Table [dbo].[EmployeeWorkingDay]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeWorkingDay](
	[EmployeeWorkingDayMapID] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[DayName] [varchar](15) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeWorkingDayMap] PRIMARY KEY CLUSTERED 
(
	[EmployeeWorkingDayMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserModuleMap]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserModuleMap](
	[UserModuleMapID] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ModuleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserModuleMap] PRIMARY KEY CLUSTERED 
(
	[UserModuleMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePaidLoan]    Script Date: 07/30/2021 12:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeePaidLoan](
	[EmployeePaidLoanMapID] [uniqueidentifier] NOT NULL,
	[EmployeeLoanMapId] [uniqueidentifier] NOT NULL,
	[PaidAmount] [decimal](12, 2) NOT NULL,
	[PaidDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Month] [varchar](15) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_EmployeePaidLoanMap] PRIMARY KEY CLUSTERED 
(
	[EmployeePaidLoanMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_AllowanceMaster_AllowanceID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[AllowanceMaster] ADD  CONSTRAINT [DF_AllowanceMaster_AllowanceID]  DEFAULT (newid()) FOR [AllowanceID]
GO
/****** Object:  Default [DF_AllowanceMaster_IsConsider]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[AllowanceMaster] ADD  CONSTRAINT [DF_AllowanceMaster_IsConsider]  DEFAULT ((1)) FOR [IsConsider]
GO
/****** Object:  Default [DF_AllowanceMaster_SortNo]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[AllowanceMaster] ADD  CONSTRAINT [DF_AllowanceMaster_SortNo]  DEFAULT ((0)) FOR [SortNo]
GO
/****** Object:  Default [DF_AllowanceMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[AllowanceMaster] ADD  CONSTRAINT [DF_AllowanceMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_AllowanceMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[AllowanceMaster] ADD  CONSTRAINT [DF_AllowanceMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_AllowanceMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[AllowanceMaster] ADD  CONSTRAINT [DF_AllowanceMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_CompanyMaster_CompanyID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[CompanyMaster] ADD  CONSTRAINT [DF_CompanyMaster_CompanyID]  DEFAULT (newid()) FOR [CompanyID]
GO
/****** Object:  Default [DF_CompanyMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[CompanyMaster] ADD  CONSTRAINT [DF_CompanyMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_CompanyMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[CompanyMaster] ADD  CONSTRAINT [DF_CompanyMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_CountryMaster_CountryID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[CountryMaster] ADD  CONSTRAINT [DF_CountryMaster_CountryID]  DEFAULT (newid()) FOR [CountryID]
GO
/****** Object:  Default [DF_CountryMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[CountryMaster] ADD  CONSTRAINT [DF_CountryMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Table_2_IsDelete]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[CountryMaster] ADD  CONSTRAINT [DF_Table_2_IsDelete]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_CurrencyMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[CurrencyMaster] ADD  CONSTRAINT [DF_CurrencyMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_DeductionMaster_DeductionID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeductionMaster] ADD  CONSTRAINT [DF_DeductionMaster_DeductionID]  DEFAULT (newid()) FOR [DeductionID]
GO
/****** Object:  Default [DF_DeductionMaster_IsConsider]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeductionMaster] ADD  CONSTRAINT [DF_DeductionMaster_IsConsider]  DEFAULT ((1)) FOR [IsConsider]
GO
/****** Object:  Default [DF_DeductionMaster_SortNo]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeductionMaster] ADD  CONSTRAINT [DF_DeductionMaster_SortNo]  DEFAULT ((0)) FOR [SortNo]
GO
/****** Object:  Default [DF_DeductionMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeductionMaster] ADD  CONSTRAINT [DF_DeductionMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_DeductionMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeductionMaster] ADD  CONSTRAINT [DF_DeductionMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_DeductionMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeductionMaster] ADD  CONSTRAINT [DF_DeductionMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_DepartmentMaster_DepartmentID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_DepartmentID]  DEFAULT (newid()) FOR [DepartmentID]
GO
/****** Object:  Default [DF_DepartmentMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_DepartmentMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_DepartmentMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_DesignationMaster_DesignationID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DesignationMaster] ADD  CONSTRAINT [DF_DesignationMaster_DesignationID]  DEFAULT (newid()) FOR [DesignationID]
GO
/****** Object:  Default [DF_DesignationMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DesignationMaster] ADD  CONSTRAINT [DF_DesignationMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_DesignationMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DesignationMaster] ADD  CONSTRAINT [DF_DesignationMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_DesignationMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DesignationMaster] ADD  CONSTRAINT [DF_DesignationMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_DeviceMaster_DeviceID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeviceMaster] ADD  CONSTRAINT [DF_DeviceMaster_DeviceID]  DEFAULT (newid()) FOR [DeviceID]
GO
/****** Object:  Default [DF_DeviceMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeviceMaster] ADD  CONSTRAINT [DF_DeviceMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_DeviceMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeviceMaster] ADD  CONSTRAINT [DF_DeviceMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_DeviceMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[DeviceMaster] ADD  CONSTRAINT [DF_DeviceMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EducationMaster_EducationID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EducationMaster] ADD  CONSTRAINT [DF_EducationMaster_EducationID]  DEFAULT (newid()) FOR [EducationID]
GO
/****** Object:  Default [DF_EducationMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EducationMaster] ADD  CONSTRAINT [DF_EducationMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EducationMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EducationMaster] ADD  CONSTRAINT [DF_EducationMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EducationMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EducationMaster] ADD  CONSTRAINT [DF_EducationMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Table_1_EmployeeAllowanceID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAllowanceMap] ADD  CONSTRAINT [DF_Table_1_EmployeeAllowanceID]  DEFAULT (newid()) FOR [EmployeeAllowanceMapID]
GO
/****** Object:  Default [DF_EmployeeAllowanceMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAllowanceMap] ADD  CONSTRAINT [DF_EmployeeAllowanceMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeAllowanceMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAllowanceMap] ADD  CONSTRAINT [DF_EmployeeAllowanceMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeAllowanceMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAllowanceMap] ADD  CONSTRAINT [DF_EmployeeAllowanceMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeAttachmentMap_EmployeeAttachmentMapID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttachment] ADD  CONSTRAINT [DF_EmployeeAttachmentMap_EmployeeAttachmentMapID]  DEFAULT (newid()) FOR [EmployeeAttachmentMapID]
GO
/****** Object:  Default [DF_EmployeeAttachmentMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttachment] ADD  CONSTRAINT [DF_EmployeeAttachmentMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeAttachmentMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttachment] ADD  CONSTRAINT [DF_EmployeeAttachmentMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeAttachmentMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttachment] ADD  CONSTRAINT [DF_EmployeeAttachmentMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeAttendance_EmployeeAttendanceID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendance] ADD  CONSTRAINT [DF_EmployeeAttendance_EmployeeAttendanceID]  DEFAULT (newid()) FOR [EmployeeAttendanceID]
GO
/****** Object:  Default [DF_EmployeeAttendance_AttendanceDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendance] ADD  CONSTRAINT [DF_EmployeeAttendance_AttendanceDate]  DEFAULT (getdate()) FOR [AttendanceDate]
GO
/****** Object:  Default [DF_EmployeeAttendance_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendance] ADD  CONSTRAINT [DF_EmployeeAttendance_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeAttendance_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendance] ADD  CONSTRAINT [DF_EmployeeAttendance_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeAttendance_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendance] ADD  CONSTRAINT [DF_EmployeeAttendance_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeAttendanceDevice_EmployeeAttendanceID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendanceDevice] ADD  CONSTRAINT [DF_EmployeeAttendanceDevice_EmployeeAttendanceID]  DEFAULT (newid()) FOR [EmployeeAttendanceID]
GO
/****** Object:  Default [DF_EmployeeAttendanceDevice_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendanceDevice] ADD  CONSTRAINT [DF_EmployeeAttendanceDevice_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeAttendanceDevice_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendanceDevice] ADD  CONSTRAINT [DF_EmployeeAttendanceDevice_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeAttendanceDevice_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendanceDevice] ADD  CONSTRAINT [DF_EmployeeAttendanceDevice_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeDeductionMap_EmployeeDeductionMapID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeductionMap] ADD  CONSTRAINT [DF_EmployeeDeductionMap_EmployeeDeductionMapID]  DEFAULT (newid()) FOR [EmployeeDeductionMapID]
GO
/****** Object:  Default [DF_EmployeeDeductionMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeductionMap] ADD  CONSTRAINT [DF_EmployeeDeductionMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeDeductionMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeductionMap] ADD  CONSTRAINT [DF_EmployeeDeductionMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeDeductionMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeductionMap] ADD  CONSTRAINT [DF_EmployeeDeductionMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeDeviceMap_EmployeeDeviceID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeviceMap] ADD  CONSTRAINT [DF_EmployeeDeviceMap_EmployeeDeviceID]  DEFAULT (newid()) FOR [EmployeeDeviceID]
GO
/****** Object:  Default [DF_EmployeeDeviceMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeviceMap] ADD  CONSTRAINT [DF_EmployeeDeviceMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeDeviceMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeviceMap] ADD  CONSTRAINT [DF_EmployeeDeviceMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeGradeMaster_EmployeeGradeID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeGradeMaster] ADD  CONSTRAINT [DF_EmployeeGradeMaster_EmployeeGradeID]  DEFAULT (newid()) FOR [EmployeeGradeID]
GO
/****** Object:  Default [DF_EmployeeGradeMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeGradeMaster] ADD  CONSTRAINT [DF_EmployeeGradeMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeGradeMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeGradeMaster] ADD  CONSTRAINT [DF_EmployeeGradeMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeGradeMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeGradeMaster] ADD  CONSTRAINT [DF_EmployeeGradeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Table_1_EmployeeLeaveMapID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory] ADD  CONSTRAINT [DF_Table_1_EmployeeLeaveMapID]  DEFAULT (newid()) FOR [EmployeeLeaveCategoryMapID]
GO
/****** Object:  Default [DF_EmployeeLeaveCategoryMap_IsFirstHalfDay]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory] ADD  CONSTRAINT [DF_EmployeeLeaveCategoryMap_IsFirstHalfDay]  DEFAULT ((0)) FOR [IsFirstHalfDay]
GO
/****** Object:  Default [DF_EmployeeLeaveCategoryMap_IsLastHalfDay]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory] ADD  CONSTRAINT [DF_EmployeeLeaveCategoryMap_IsLastHalfDay]  DEFAULT ((0)) FOR [IsLastHalfDay]
GO
/****** Object:  Default [DF_EmployeeLeaveCategoryMap_ApplyDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory] ADD  CONSTRAINT [DF_EmployeeLeaveCategoryMap_ApplyDate]  DEFAULT (getdate()) FOR [ApplyDate]
GO
/****** Object:  Default [DF_EmployeeLeaveCategoryMap_ApproveDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory] ADD  CONSTRAINT [DF_EmployeeLeaveCategoryMap_ApproveDate]  DEFAULT (getdate()) FOR [ApproveDate]
GO
/****** Object:  Default [DF_EmployeeLeaveCategoryMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory] ADD  CONSTRAINT [DF_EmployeeLeaveCategoryMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeLeaveCategoryMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory] ADD  CONSTRAINT [DF_EmployeeLeaveCategoryMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeLeaveCategoryMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory] ADD  CONSTRAINT [DF_EmployeeLeaveCategoryMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeLoanMap_EmployeeLoanMapID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLoan] ADD  CONSTRAINT [DF_EmployeeLoanMap_EmployeeLoanMapID]  DEFAULT (newid()) FOR [EmployeeLoanMapID]
GO
/****** Object:  Default [DF_EmployeeLoanMap_LoanDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLoan] ADD  CONSTRAINT [DF_EmployeeLoanMap_LoanDate]  DEFAULT (getdate()) FOR [LoanDate]
GO
/****** Object:  Default [DF_EmployeeLoanMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLoan] ADD  CONSTRAINT [DF_EmployeeLoanMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeLoanMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLoan] ADD  CONSTRAINT [DF_EmployeeLoanMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeLoanMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLoan] ADD  CONSTRAINT [DF_EmployeeLoanMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeLoanMap_IsComplete]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLoan] ADD  CONSTRAINT [DF_EmployeeLoanMap_IsComplete]  DEFAULT ((0)) FOR [IsComplete]
GO
/****** Object:  Default [DF_EmployeeMaster_EmployeeID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_EmployeeID]  DEFAULT (newid()) FOR [EmployeeID]
GO
/****** Object:  Default [DF_EmployeeMaster_Gender]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_Gender]  DEFAULT ((1)) FOR [Gender]
GO
/****** Object:  Default [DF_EmployeeMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeMaster_IsLeave]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_IsLeave]  DEFAULT ((0)) FOR [IsLeave]
GO
/****** Object:  Default [DF__EmployeeM__Leave__2CF2ADDF]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  DEFAULT (NULL) FOR [LeaveDescription]
GO
/****** Object:  Default [DF_EmployeeMaster_IsHavingFace_1]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_IsHavingFace_1]  DEFAULT ((0)) FOR [IsHavingFace]
GO
/****** Object:  Default [DF_EmployeeMaster_is_having_fingureprint_1]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_is_having_fingureprint_1]  DEFAULT ((1)) FOR [is_having_fingureprint]
GO
/****** Object:  Default [DF_EmployeeMaster_IsSend_1]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_IsSend_1]  DEFAULT ((0)) FOR [IsSend]
GO
/****** Object:  Default [DF_EmployeePaidAllowanceMap_EmployeePaidAllowanceMapID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidAllowanceMap] ADD  CONSTRAINT [DF_EmployeePaidAllowanceMap_EmployeePaidAllowanceMapID]  DEFAULT (newid()) FOR [EmployeePaidAllowanceMapID]
GO
/****** Object:  Default [DF_EmployeePaidAllowanceMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidAllowanceMap] ADD  CONSTRAINT [DF_EmployeePaidAllowanceMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeePaidAllowanceMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidAllowanceMap] ADD  CONSTRAINT [DF_EmployeePaidAllowanceMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeePaidAllowanceMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidAllowanceMap] ADD  CONSTRAINT [DF_EmployeePaidAllowanceMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Table_1_EmployeeDeductionMapID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidDeductionMap] ADD  CONSTRAINT [DF_Table_1_EmployeeDeductionMapID]  DEFAULT (newid()) FOR [EmployeePaidDeductionMapID]
GO
/****** Object:  Default [DF_EmployeePaidDeductionMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidDeductionMap] ADD  CONSTRAINT [DF_EmployeePaidDeductionMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeePaidDeductionMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidDeductionMap] ADD  CONSTRAINT [DF_EmployeePaidDeductionMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeePaidDeductionMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidDeductionMap] ADD  CONSTRAINT [DF_EmployeePaidDeductionMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Table_1_EmployeePayLoanMapID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidLoan] ADD  CONSTRAINT [DF_Table_1_EmployeePayLoanMapID]  DEFAULT (newid()) FOR [EmployeePaidLoanMapID]
GO
/****** Object:  Default [DF_EmployeePaidLoanMap_PaidDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidLoan] ADD  CONSTRAINT [DF_EmployeePaidLoanMap_PaidDate]  DEFAULT (getdate()) FOR [PaidDate]
GO
/****** Object:  Default [DF_EmployeePaidLoanMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidLoan] ADD  CONSTRAINT [DF_EmployeePaidLoanMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeePaidLoanMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidLoan] ADD  CONSTRAINT [DF_EmployeePaidLoanMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeePaidLoanMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidLoan] ADD  CONSTRAINT [DF_EmployeePaidLoanMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeePaidSalary_EmployeePaidSalaryID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidSalary] ADD  CONSTRAINT [DF_EmployeePaidSalary_EmployeePaidSalaryID]  DEFAULT (newid()) FOR [EmployeePaidSalaryID]
GO
/****** Object:  Default [DF_EmployeePaidSalary_PaidDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidSalary] ADD  CONSTRAINT [DF_EmployeePaidSalary_PaidDate]  DEFAULT (getdate()) FOR [PaidDate]
GO
/****** Object:  Default [DF_EmployeePaidSalary_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidSalary] ADD  CONSTRAINT [DF_EmployeePaidSalary_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeePaidSalary_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidSalary] ADD  CONSTRAINT [DF_EmployeePaidSalary_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeePaidSalary_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidSalary] ADD  CONSTRAINT [DF_EmployeePaidSalary_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeePaidSalary_IsPaid]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidSalary] ADD  CONSTRAINT [DF_EmployeePaidSalary_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
/****** Object:  Default [DF_EmployeeSalary_EmployeeSalaryID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_EmployeeSalaryID]  DEFAULT (newid()) FOR [EmployeeSalaryID]
GO
/****** Object:  Default [DF_EmployeeSalary_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeSalary_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeSalary_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeSalary_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeTypeMaster_EmployeeTypeID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeTypeMaster] ADD  CONSTRAINT [DF_EmployeeTypeMaster_EmployeeTypeID]  DEFAULT (newid()) FOR [EmployeeTypeID]
GO
/****** Object:  Default [DF_EmployeeTypeMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeTypeMaster] ADD  CONSTRAINT [DF_EmployeeTypeMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeTypeMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeTypeMaster] ADD  CONSTRAINT [DF_EmployeeTypeMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeTypeMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeTypeMaster] ADD  CONSTRAINT [DF_EmployeeTypeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_EmployeeWorkingDayMap_EmployeeWorkingDayMapID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeWorkingDay] ADD  CONSTRAINT [DF_EmployeeWorkingDayMap_EmployeeWorkingDayMapID]  DEFAULT (newid()) FOR [EmployeeWorkingDayMapID]
GO
/****** Object:  Default [DF_EmployeeWorkingDayMap_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeWorkingDay] ADD  CONSTRAINT [DF_EmployeeWorkingDayMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_EmployeeWorkingDayMap_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeWorkingDay] ADD  CONSTRAINT [DF_EmployeeWorkingDayMap_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_EmployeeWorkingDayMap_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeWorkingDay] ADD  CONSTRAINT [DF_EmployeeWorkingDayMap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_FinancialYearMaster_FinancialYearID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[FinancialYearMaster] ADD  CONSTRAINT [DF_FinancialYearMaster_FinancialYearID]  DEFAULT (newid()) FOR [FinancialYearID]
GO
/****** Object:  Default [DF_FinancialYearMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[FinancialYearMaster] ADD  CONSTRAINT [DF_FinancialYearMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_FinancialYearMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[FinancialYearMaster] ADD  CONSTRAINT [DF_FinancialYearMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_FinancialYearMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[FinancialYearMaster] ADD  CONSTRAINT [DF_FinancialYearMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_History_HistoryID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF_History_HistoryID]  DEFAULT (newid()) FOR [HistoryID]
GO
/****** Object:  Default [DF_History_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF_History_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_HolidayMaster_HolidayID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[HolidayMaster] ADD  CONSTRAINT [DF_HolidayMaster_HolidayID]  DEFAULT (newid()) FOR [HolidayID]
GO
/****** Object:  Default [DF_HolidayMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[HolidayMaster] ADD  CONSTRAINT [DF_HolidayMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_HolidayMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[HolidayMaster] ADD  CONSTRAINT [DF_HolidayMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_HolidayMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[HolidayMaster] ADD  CONSTRAINT [DF_HolidayMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_InterviewMaster_InterviewID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InterviewMaster] ADD  CONSTRAINT [DF_InterviewMaster_InterviewID]  DEFAULT (newid()) FOR [InterviewID]
GO
/****** Object:  Default [DF_InterviewMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InterviewMaster] ADD  CONSTRAINT [DF_InterviewMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_InterviewMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InterviewMaster] ADD  CONSTRAINT [DF_InterviewMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_InterviewMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InterviewMaster] ADD  CONSTRAINT [DF_InterviewMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_InvoiceDetail_ItemDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceDetail] ADD  CONSTRAINT [DF_InvoiceDetail_ItemDate]  DEFAULT (getdate()) FOR [ItemDate]
GO
/****** Object:  Default [DF_InvoiceDetail_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceDetail] ADD  CONSTRAINT [DF_InvoiceDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_InvoiceDetail_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceDetail] ADD  CONSTRAINT [DF_InvoiceDetail_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_InvoiceDetail_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceDetail] ADD  CONSTRAINT [DF_InvoiceDetail_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_InvoiceMaster_InvoiceDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceMaster] ADD  CONSTRAINT [DF_InvoiceMaster_InvoiceDate]  DEFAULT (getdate()) FOR [InvoiceDate]
GO
/****** Object:  Default [DF_InvoiceMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceMaster] ADD  CONSTRAINT [DF_InvoiceMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_InvoiceMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceMaster] ADD  CONSTRAINT [DF_InvoiceMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_InvoiceMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceMaster] ADD  CONSTRAINT [DF_InvoiceMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_LeaveCategoryMaster_LeaveCategoryID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[LeaveCategoryMaster] ADD  CONSTRAINT [DF_LeaveCategoryMaster_LeaveCategoryID]  DEFAULT (newid()) FOR [LeaveCategoryID]
GO
/****** Object:  Default [DF_LeaveCategoryMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[LeaveCategoryMaster] ADD  CONSTRAINT [DF_LeaveCategoryMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_LeaveCategoryMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[LeaveCategoryMaster] ADD  CONSTRAINT [DF_LeaveCategoryMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_LeaveCategoryMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[LeaveCategoryMaster] ADD  CONSTRAINT [DF_LeaveCategoryMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_ModuleMaster_ModuleID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[ModuleMaster] ADD  CONSTRAINT [DF_ModuleMaster_ModuleID]  DEFAULT (newid()) FOR [ModuleID]
GO
/****** Object:  Default [DF_ModuleMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[ModuleMaster] ADD  CONSTRAINT [DF_ModuleMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_ModuleMaster_SortOrder]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[ModuleMaster] ADD  CONSTRAINT [DF_ModuleMaster_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_RoleMaster_RoleID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[RoleMaster] ADD  CONSTRAINT [DF_RoleMaster_RoleID]  DEFAULT (newid()) FOR [RoleID]
GO
/****** Object:  Default [DF_RoleMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[RoleMaster] ADD  CONSTRAINT [DF_RoleMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_ShiftMaster_ShiftID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[ShiftMaster] ADD  CONSTRAINT [DF_ShiftMaster_ShiftID]  DEFAULT (newid()) FOR [ShiftID]
GO
/****** Object:  Default [DF_ShiftMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[ShiftMaster] ADD  CONSTRAINT [DF_ShiftMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_ShiftMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[ShiftMaster] ADD  CONSTRAINT [DF_ShiftMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_ShiftMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[ShiftMaster] ADD  CONSTRAINT [DF_ShiftMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_StateMaster_StateID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[StateMaster] ADD  CONSTRAINT [DF_StateMaster_StateID]  DEFAULT (newid()) FOR [StateID]
GO
/****** Object:  Default [DF_StateMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[StateMaster] ADD  CONSTRAINT [DF_StateMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_StateMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[StateMaster] ADD  CONSTRAINT [DF_StateMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_UserMaster_UserID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_UserID]  DEFAULT (newid()) FOR [UserID]
GO
/****** Object:  Default [DF_UserMaster_LastLogin]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_LastLogin]  DEFAULT (getdate()) FOR [LastLogin]
GO
/****** Object:  Default [DF_UserMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_UserMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_UserMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_Table_1_UserModuleID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserModuleMap] ADD  CONSTRAINT [DF_Table_1_UserModuleID]  DEFAULT (newid()) FOR [UserModuleMapID]
GO
/****** Object:  Default [DF_Table_1_VisitorID]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[VisitMaster] ADD  CONSTRAINT [DF_Table_1_VisitorID]  DEFAULT (newid()) FOR [VisitID]
GO
/****** Object:  Default [DF_VisitMaster_CreatedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[VisitMaster] ADD  CONSTRAINT [DF_VisitMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_VisitMaster_ModifiedDate]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[VisitMaster] ADD  CONSTRAINT [DF_VisitMaster_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
/****** Object:  Default [DF_VisitMaster_IsActive]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[VisitMaster] ADD  CONSTRAINT [DF_VisitMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  ForeignKey [FK_EmployeeAllowanceMap_AllowanceMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAllowanceMap]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAllowanceMap_AllowanceMaster] FOREIGN KEY([AllowanceId])
REFERENCES [dbo].[AllowanceMaster] ([AllowanceID])
GO
ALTER TABLE [dbo].[EmployeeAllowanceMap] CHECK CONSTRAINT [FK_EmployeeAllowanceMap_AllowanceMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeAllowanceMap_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAllowanceMap]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAllowanceMap_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeAllowanceMap] CHECK CONSTRAINT [FK_EmployeeAllowanceMap_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeAttachment_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttachment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAttachment_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeAttachment] CHECK CONSTRAINT [FK_EmployeeAttachment_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeAttendance_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeAttendance]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAttendance_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeAttendance] CHECK CONSTRAINT [FK_EmployeeAttendance_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeDeductionMap_DeductionMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeductionMap]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDeductionMap_DeductionMaster] FOREIGN KEY([DeductionId])
REFERENCES [dbo].[DeductionMaster] ([DeductionID])
GO
ALTER TABLE [dbo].[EmployeeDeductionMap] CHECK CONSTRAINT [FK_EmployeeDeductionMap_DeductionMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeDeductionMap_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeDeductionMap]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDeductionMap_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeDeductionMap] CHECK CONSTRAINT [FK_EmployeeDeductionMap_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeLeaveCategory_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeaveCategory_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeLeaveCategory] CHECK CONSTRAINT [FK_EmployeeLeaveCategory_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeLeaveCategory_LeaveCategoryMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLeaveCategory]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeaveCategory_LeaveCategoryMaster] FOREIGN KEY([LeaveCategoryId])
REFERENCES [dbo].[LeaveCategoryMaster] ([LeaveCategoryID])
GO
ALTER TABLE [dbo].[EmployeeLeaveCategory] CHECK CONSTRAINT [FK_EmployeeLeaveCategory_LeaveCategoryMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeLoan_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeLoan]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLoan_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeLoan] CHECK CONSTRAINT [FK_EmployeeLoan_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeMaster_DepartmentMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_DepartmentMaster] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentMaster] ([DepartmentID])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_DepartmentMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeMaster_DesignationMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_DesignationMaster] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[DesignationMaster] ([DesignationID])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_DesignationMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeMaster_EmployeeGradeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_EmployeeGradeMaster] FOREIGN KEY([EmployeeGradeId])
REFERENCES [dbo].[EmployeeGradeMaster] ([EmployeeGradeID])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_EmployeeGradeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeMaster_EmployeeTypeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_EmployeeTypeMaster] FOREIGN KEY([EmployeeTypeId])
REFERENCES [dbo].[EmployeeTypeMaster] ([EmployeeTypeID])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_EmployeeTypeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeMaster_ShiftMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_ShiftMaster] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[ShiftMaster] ([ShiftID])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_ShiftMaster]
GO
/****** Object:  ForeignKey [FK_EmployeePaidLoan_EmployeeLoan]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidLoan]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePaidLoan_EmployeeLoan] FOREIGN KEY([EmployeeLoanMapId])
REFERENCES [dbo].[EmployeeLoan] ([EmployeeLoanMapID])
GO
ALTER TABLE [dbo].[EmployeePaidLoan] CHECK CONSTRAINT [FK_EmployeePaidLoan_EmployeeLoan]
GO
/****** Object:  ForeignKey [FK_EmployeePaidSalary_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePaidSalary_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeePaidSalary] CHECK CONSTRAINT [FK_EmployeePaidSalary_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeePaidSalary_FinancialYearMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeePaidSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePaidSalary_FinancialYearMaster] FOREIGN KEY([FinancialYearId])
REFERENCES [dbo].[FinancialYearMaster] ([FinancialYearID])
GO
ALTER TABLE [dbo].[EmployeePaidSalary] CHECK CONSTRAINT [FK_EmployeePaidSalary_FinancialYearMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeSalary_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalary_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeSalary] CHECK CONSTRAINT [FK_EmployeeSalary_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeWorkingDay_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[EmployeeWorkingDay]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeWorkingDay_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeWorkingDay] CHECK CONSTRAINT [FK_EmployeeWorkingDay_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_InvoiceDetail_InvoiceMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_InvoiceMaster] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[InvoiceMaster] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_InvoiceMaster]
GO
/****** Object:  ForeignKey [FK_InvoiceMaster_CurrencyMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[InvoiceMaster]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceMaster_CurrencyMaster] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[CurrencyMaster] ([CurrencyID])
GO
ALTER TABLE [dbo].[InvoiceMaster] CHECK CONSTRAINT [FK_InvoiceMaster_CurrencyMaster]
GO
/****** Object:  ForeignKey [FK_StateMaster_CountryMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[StateMaster]  WITH CHECK ADD  CONSTRAINT [FK_StateMaster_CountryMaster] FOREIGN KEY([CountryId])
REFERENCES [dbo].[CountryMaster] ([CountryID])
GO
ALTER TABLE [dbo].[StateMaster] CHECK CONSTRAINT [FK_StateMaster_CountryMaster]
GO
/****** Object:  ForeignKey [FK_UserMaster_EmployeeMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_EmployeeMaster] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_UserMaster_RoleMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_RoleMaster] FOREIGN KEY([RoleId])
REFERENCES [dbo].[RoleMaster] ([RoleID])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_RoleMaster]
GO
/****** Object:  ForeignKey [FK_UserModuleMap_ModuleMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserModuleMap]  WITH CHECK ADD  CONSTRAINT [FK_UserModuleMap_ModuleMaster] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[ModuleMaster] ([ModuleID])
GO
ALTER TABLE [dbo].[UserModuleMap] CHECK CONSTRAINT [FK_UserModuleMap_ModuleMaster]
GO
/****** Object:  ForeignKey [FK_UserModuleMap_UserMaster]    Script Date: 07/30/2021 12:29:18 ******/
ALTER TABLE [dbo].[UserModuleMap]  WITH CHECK ADD  CONSTRAINT [FK_UserModuleMap_UserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[UserModuleMap] CHECK CONSTRAINT [FK_UserModuleMap_UserMaster]
GO
