USE [ITInventory]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [pk_Category_Cat_ID] PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [pk_Department_Dept_ID] PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Designation_ID] [int] NOT NULL,
	[Designation_Title] [varchar](100) NULL,
	[desig_priority] [int] NULL,
 CONSTRAINT [PK_Employee_Designation] PRIMARY KEY CLUSTERED 
(
	[Designation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_ID] [char](4) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Dept_ID] [int] NULL,
	[Status] [char](1) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Created_date] [datetime] NULL,
	[Created_By] [varchar](50) NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[ResetCode] [varchar](100) NULL,
	[Designation_ID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory_Available]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory_Available](
	[Inventory_No] [char](10) NOT NULL,
	[PID] [int] NULL,
	[Placement] [varchar](50) NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [pk_Inventory_Inven_ID] PRIMARY KEY CLUSTERED 
(
	[Inventory_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[PID] [int] NOT NULL,
	[Cat_ID] [int] NOT NULL,
	[Model_Name] [varchar](50) NOT NULL,
	[Image] [varchar](max) NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales_Issue]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_Issue](
	[Issued_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_ID] [char](4) NULL,
	[Comments] [varchar](100) NULL,
	[Placement] [varchar](150) NULL,
	[Created_Date] [datetime] NULL CONSTRAINT [DF__Sales_Iss__Creat__4C364F0E]  DEFAULT (getdate()),
	[Modify_Date] [datetime] NULL CONSTRAINT [DF_Sales_Issue_Created_Date1]  DEFAULT (getdate()),
	[Modify_By] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [pk_Sales_Issue_Issued_ID] PRIMARY KEY CLUSTERED 
(
	[Issued_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales_Issue_Details]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_Issue_Details](
	[Inventory_No] [char](10) NOT NULL,
	[Issued_ID] [int] NOT NULL,
	[SerialNo] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[Issued_From] [varchar](150) NULL,
	[Issued_By] [varchar](50) NULL,
	[Issue_Type] [char](1) NULL,
	[Issued_Date] [datetime] NULL CONSTRAINT [DF_Sales_Issue_Details_Issued_Date]  DEFAULT (getdate()),
	[Comments] [varchar](100) NULL,
	[Modify_Date] [datetime] NULL,
	[Modify_By] [varchar](50) NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [PK_Sales_Issue_Details] PRIMARY KEY CLUSTERED 
(
	[Inventory_No] ASC,
	[Issued_ID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_SalesDetails]    Script Date: 1/22/2021 10:11:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SalesDetails]
AS
SELECT        dbo.Employee.Name, dbo.Sales_Issue.Comments AS Sales_IssueComments, dbo.Sales_Issue.Placement, dbo.Sales_Issue.Created_Date, dbo.Sales_Issue.Status AS Sales_IssueStatus, 
                         dbo.Sales_Issue_Details.Inventory_No, dbo.Sales_Issue_Details.Issued_From, dbo.Sales_Issue_Details.Issued_By, dbo.Sales_Issue_Details.Issue_Type, dbo.Sales_Issue_Details.Issued_Date, 
                         dbo.Sales_Issue_Details.Status AS SalesDetailsStatus, dbo.Category.Name AS CatName, dbo.Products.Model_Name, dbo.Sales_Issue.Issued_ID, dbo.Department.Name AS DeptName, 
                         dbo.Sales_Issue_Details.SerialNo, dbo.Sales_Issue_Details.Comments AS Sales_Issue_DetailsComments, dbo.Sales_Issue_Details.Modify_Date, dbo.Sales_Issue_Details.Modify_By, 
                         dbo.Sales_Issue_Details.Description, dbo.Designation.Designation_Title, dbo.Employee.Designation_ID, dbo.Sales_Issue.Emp_ID
FROM            dbo.Employee INNER JOIN
                         dbo.Sales_Issue INNER JOIN
                         dbo.Sales_Issue_Details ON dbo.Sales_Issue.Issued_ID = dbo.Sales_Issue_Details.Issued_ID ON dbo.Employee.Emp_ID = dbo.Sales_Issue.Emp_ID INNER JOIN
                         dbo.Department ON dbo.Employee.Dept_ID = dbo.Department.Dept_ID INNER JOIN
                         dbo.Products INNER JOIN
                         dbo.Category ON dbo.Products.Cat_ID = dbo.Category.Cat_ID INNER JOIN
                         dbo.Inventory_Available ON dbo.Products.PID = dbo.Inventory_Available.PID ON dbo.Sales_Issue_Details.Inventory_No = dbo.Inventory_Available.Inventory_No INNER JOIN
                         dbo.Designation ON dbo.Employee.Designation_ID = dbo.Designation.Designation_ID



GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (8, N'Bag')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (1, N'Desktop')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (11, N'HDD')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (6, N'Keyboard')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (3, N'Laptop')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (4, N'LCD')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (9, N'LED')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (7, N'Mouse')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (5, N'Printer')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (12, N'SSD')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (10, N'Tool')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (13, N'USB')
INSERT [dbo].[Category] ([Cat_ID], [Name]) VALUES (2, N'Viper')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (306, N'Accounts')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (307, N'Admin')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (305, N'CAO')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (301, N'CS')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (310, N'CSO')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (316, N'Director Office')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (302, N'EE')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (303, N'FSM')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (308, N'HR')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (304, N'IT')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (309, N'Library')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (314, N'MR')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (315, N'ORIC')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (311, N'QEC')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (313, N'S&H')
INSERT [dbo].[Department] ([Dept_ID], [Name]) VALUES (312, N'SA')
SET IDENTITY_INSERT [dbo].[Department] OFF
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (1, N'Director', 1)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (2, N'Manager IT', 1)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (3, N'Head Of Department', 2)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (4, N'Assistant Manager (IT)', 2)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (5, N'Professor', 3)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (6, N'Associate Professor (Dean Faculty of FSM)', 3)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (7, N'Associate Professor', 4)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (8, N'Assistant Professor', 5)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (9, N'Assistant Professor (Adjunct)', 5)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (10, N'Assistant Manager (Media)', 5)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (11, N'Lecturer', 6)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (12, N'Lecturer(Adjunct)', 6)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (13, N'Instructor', 7)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (14, N'Lab Engineer', 7)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (15, N'Research Officer', 7)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (16, N'Senoir Lab Supervisor', 7)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (17, N'Department Secretary', 9)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (18, N'Assistant Manager Academic', 9)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (19, N'Academic Officer', 10)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (20, N'Manager Academics', 10)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (21, N'Deputy Manager (Academics)', 10)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (22, N'Assistant Academic Officer', 11)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (23, N'Academic Assistant', 12)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (24, N'System Officer', 13)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (25, N'Assistant System Officer', 15)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (26, N'Lab Assistant', 7)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (27, N'Sr. Software Engineer', 17)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (28, N'Software Engineer', 18)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (29, N'Chief Librarian', 19)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (30, N'Assistant Librarian', 20)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (31, N'Manager Administration', 22)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (32, N'Manager QEC', 23)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (33, N'Manager (Services)', 25)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (34, N'Receptionist', 25)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (35, N'Deputy Manager', 26)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (36, N'Deputy Manager (Career Services)', 27)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (37, N'Deputy Manager QEC', 28)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (38, N'Assistant Manager Accounts', 29)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (39, N'Deputy Manager HRM', 30)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (40, N'Accounts Officer', 30)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (41, N'Assistant Manager (Career Services)', 31)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (42, N'Assistant Accounts Officer', 31)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (43, N'Library Assistant', 31)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (44, N'Account Assistant', 32)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (45, N'Administration Officer', 33)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (46, N'HR Officer', 34)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (47, N'Maintenance Supervisor', 35)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (48, N'Supervisor', 35)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (49, N'Maintenance Engineer', 36)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (50, N'Sports Officer', 37)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (51, N'Office Assistant', 37)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (52, N'Assistant', 37)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (53, N'Admin Assistant', 37)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (54, N'Technician', 38)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (55, N'Junior Assistant', 7)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (56, N'Senior Technician', 7)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (57, N'Lab Technician ', 7)
INSERT [dbo].[Designation] ([Designation_ID], [Designation_Title], [desig_priority]) VALUES (58, N'Secretary (Director)', 23)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3441', N'Aamer Munir', N'aamer.munir@nu.edu.pk', 302, N'1', NULL, NULL, NULL, N'', N'mustafa', CAST(N'2020-02-04 14:24:48.587' AS DateTime), N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3525', N'Salma Kanwal', N'salma.kanwal@nu.edu.pk', 312, N'1', N'', N'', NULL, N'', N'', NULL, N'', 34)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3533', N'Sumayya Iqbal', N'sumayya.iqbal@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 22)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3534', N'Irfan Rabbani', N'irfan.rabani@nu.edu.pk', 307, N'1', N'', N'', NULL, N'', N'', NULL, N'', 49)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3535', N'Ansar Abbas', N'ansar.abbas@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 17)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3536', N'Muhammad Shiraz (Sr)', N'muhammad.shiraz@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 55)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3567', N'Kashif Abbasi', N'kashif.abbasi@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 51)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3625', N'Farhan Khalid', N'farhan.khalid@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3629', N'Kashif Munir', N'kashif.munir@nu.edu.pk', 301, N'1', NULL, NULL, NULL, N'', N'mustafa', CAST(N'2020-02-04 13:54:07.487' AS DateTime), N'', 3)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3662', N'Muhammad Ali', N'muhammad.ali@nu.edu.pk', 306, N'1', N'', N'', NULL, N'', N'', NULL, N'', 38)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3707', N'Azhar Rauf', N'azhar.rauf@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3712', N'Mazhar Hussain', N'mazhar.hussain@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 5)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3730', N'Shahid Qureshi', N'shahid.qureshi@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3738', N'Zubair Liaquat', N'zubair.liaqat@nu.edu.pk', 307, N'1', N'', N'', NULL, N'', N'', NULL, N'', 51)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3739', N'Muhammad Tariq', N'malik.tariq@nu.edu.pk', 302, N'1', N'', N'123321', NULL, N'', N'', NULL, NULL, 23)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3758', N'Ijaz ur Rehman', N'ijaz.rehman@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3766', N'Mahmood Iqbal', N'mahmood.iqbal@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 25)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3813', N'Sadia Nadeem', N'sadia.nadeem@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3818', N'Usman Tariq', N'usman.tariq@nu.edu.pk', 307, N'1', N'', N'', NULL, N'', N'', NULL, N'', 45)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3844', N'Shehzad Ahmad', N'shehzad.ahmad@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3907', N'Zulqarnain Haider', N'zulqarnain.haider@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 53)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3938', N'Khadija Farooq', N'khadija.farooq@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3940', N'Aisha Ijaz', N'aisha.ijaz@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3949', N'Mehreen Alam', N'mehreen.alam@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3966', N'Durdana Habib', N'durdana.habib@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'3990', N'M. Ibrar Khan', N'ibrar.khan@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4068', N'Ghulam Mustafa', N'ghulam.mustafa@nu.edu.pk', 308, N'1', N'mustafa', N'mustafa', NULL, N'', N'm.asif', CAST(N'2019-12-17 14:29:36.707' AS DateTime), N'094e9bd5-9e6a-4465-b9c2-a02163386443', 51)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4125', N'Syeda Huma Batool Naqvi', N'huma.batool@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4127', N'Mehwish Hassan', N'mehwish.hassan@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 3)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4129', N'Amna Basharat', N'amna.basharat@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4133', N'M. Atif Baig', N'atif.baig@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 18)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4137', N'Attiq Hassan Shah', N'attiq.shah@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4141', N'Muhammad Saeed', N'muhammad.saeed@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4154', N'Shakeel Ahmed Kiyani', N'shakeel.kiyani@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 22)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4175', N'Fida Ul Hassan Shah', N'fida.hassan@nu.edu.pk', 306, N'1', N'', N'', NULL, N'', N'', NULL, N'', 35)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4214', N'Farah Jabeen Awan', N'farah.awan@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4218', N'M. Usman Ashraf', N'usman.ashraf@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4219', N'Muhammad Ali', N'm.ali@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4220', N'Syed Irfan Shah', N'irfan.shah@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4278', N'Arshad Hassan Khan', N'arshad.hassan@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4283', N'Aamer Hafeez', N'aamer.hafeez@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4335', N'Asma Ahmad', N'asma.ahmad@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4336', N'Adil Amin Kazi', N'adil.kazi@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4340', N'Sana Hassan', N'sana.hassan@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4379', N'Farah Naz', N'farah.naz@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4380', N'Saba Rasheed Malik', N'saba.rasheed@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4381', N'Jawad Hassan Nisar', N'jawad.hassan@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4385', N'Hafiz M. Tayyeb Nadeem', N'tayyeb.nadeem@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4398', N'Sarah Khan', N'sara.khan@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4400', N'Hammad Majeed', N'hammad.majeed@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4401', N'Atif Aftab Ahmed Jilani', N'atif.jilani@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4402', N'Sayeeda Nasiba', N'sayeeda.nasiba@nu.edu.pk', 307, N'1', N'', N'', NULL, N'', N'', NULL, N'', NULL)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4446', N'Qasim Mehmood', N'qasim.mehmood@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 4)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4455', N'Rizwan Javed', N'rizwan.javed@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 26)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4456', N'Saqib Shahbaz Raja', N'saqib.shahbaz@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 56)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4506', N'Akhtar Hussain Shah', N'akhtar.hussain@nu.edu.pk', 305, N'1', N'', N'', NULL, N'', N'', NULL, N'', 19)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4518', N'Waqas Bin Abbas', N'waqas.abbas@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4549', N'Noor Ul Ain', N'noorul.ain@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4551', N'Hasan Mujtaba Kiyani', N'hasan.mujtaba@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4553', N'Waseem Shahzad', N'waseem.shahzad@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 5)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4576', N'Khalil Ullah', N'khalil.awan@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4589', N'Ayesha Bano', N'ayesha.bano@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4633', N'Fazlur Rehman', N'fazlur.rahman@nu.edu.pk', 305, N'1', N'', N'', NULL, N'', N'', NULL, N'', 51)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4641', N'Irfan Hussain', N'irfan.hussain@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 24)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4656', N'Tufail Ahmad', N'tufail.ahmad@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 19)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4669', N'Fakhar Abbas', N'fakhar.abbas@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 14)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4672', N'Muhammad Rashid Karim', N'rashid.karim@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4708', N'Uzair Khan', N'uzair.khan@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4737', N'Ahsan Iqbal Khan', N'Ahsan.iqbal@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 56)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4738', N'Shahzad Saleem', N'shahzad.saleem@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4805', N'Asmat Ullah Malik', N'asmat.ullah@nu.edu.pk', 307, N'1', N'', N'', NULL, N'', N'', NULL, N'', 51)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4821', N'Muhammad Asif', N'mohammad.asif@nu.edu.pk', 304, N'1', N'm.asif', N'asif', CAST(N'2019-12-18 08:42:08.087' AS DateTime), N'mustafa', N'mustafa', CAST(N'2019-12-18 08:52:10.113' AS DateTime), NULL, 26)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4826', N'Zubair Ahmed', N'Zubair.yousafzai@nu.edu.pk', 305, N'1', N'', N'', NULL, N'', N'', NULL, N'', NULL)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4830', N'Irshad Ahmed', N'irshad.muhammad@nu.edu.pk', 306, N'1', N'', N'', NULL, N'', N'', NULL, N'', 40)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4882', N'Atifa Sarwar', N'atifa.sarwar@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4891', N'Ehtesham Zahoor', N'Ehtesham.zahoor@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4894', N'Ejaz Ahmed', N'ejaz.ahmed@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4974', N'Sibt Ul Hussain', N'sibtul.hussain@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4986', N'Muhammad Ali Nasir', N'ali.nasir@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'4997', N'Hina Raza', N'hina.raza@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5001', N'Arshad Ali Shahid', N'arshad.ali@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 5)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5004', N'Waseem Ikram', N'waseem.ikram@nu.edu.pk', 302, N'1', N'waseem.ikram', N'1234', NULL, N'', N'', NULL, N'', 5)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5026', N'Aman Ullah Khan', N'aman.ullah@nu.edu.pk', 312, N'1', N'', N'', NULL, N'', N'', NULL, N'', 33)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5027', N'Hafeez-ur-Rehman', N'hafeez.rehman@nu.edu.pk', 307, N'1', N'', N'', NULL, N'', N'', NULL, N'', 47)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5030', N'Kashif Islam', N'kashif.islam@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 16)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5031', N'Abdul Hameed', N'abdul.hameed@nu.edu.pk', 305, N'1', N'', N'', NULL, N'', N'', NULL, N'', 21)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5043', N'Maqsood Abbasi', N'maqsood.abbasi@nu.edu.pk', 308, N'1', N'', N'', NULL, N'', N'', NULL, N'', 46)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5044', N'Nadeem Abbas', N'nadeem.abbas@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 26)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5051', N'Babar Minhas', N'babar.minhas@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5055', N'Sana Saleh', N'sana.saleh@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 14)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5056', N'Adan Abid', N'muhammad.adan@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 14)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5074', N'Aneela Sabir', N'aneela.sabir@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 14)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5093', N'Sidra Abbas', N'sidra.abbas@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5099', N'Muhammad Asim', N'muhammad.asim@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5101', N'Muhammad Imran', N'mohammad.imran@nu.edu.pk', 310, N'1', N'', N'', NULL, N'', N'', NULL, N'', 41)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5109', N'Ahsan Rahman Sheikh', N'ahsan.sheikh@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 57)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5140', N'Kabir Khan', N'muhammad.khan@nu.edu.pk', 309, N'1', N'', N'', NULL, N'', N'', NULL, N'', 43)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5141', N'Saifullah Khan', N'saifullah.khan@nu.edu.pk', 306, N'1', N'', N'', NULL, N'', N'', NULL, N'', 42)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5155', N'Rabia Khan', N'rabiakhan@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 17)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5182', N'Haroon Kareem', N'haroon.kareem@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 2)
GO
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5185', N'Amna Ali Khan', N'amna.ali@nu.edu.pk', 310, N'1', N'', N'', NULL, N'', N'', NULL, N'', 36)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5195', N'Abdul Ali Bangash', N'abdul.ali@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5196', N'Irum Inayat', N'irum.inayat@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5197', N'Aftab Ahmed Bhatti', N'aftab.bhatti@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5201', N'Hassan Raza', N'hassan.raza@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5212', N'Shoaib Mehboob', N'shoaib.mehboob@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5213', N'Hafiz Tayyeb Javed', N'tayyeb.javed@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5243', N'Muhammad Abbas', N'admin.abbas@nu.edu.pk', 307, N'1', N'', N'', NULL, N'', N'', NULL, N'', NULL)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5247', N'Danial Hasan', N'danial.hassan@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5248', N'Hamda Khan', N'hamda.khan@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5249', N'Labiba Fahad', N'labiba.fahad@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5250', N'Amna Irum', N'amna.irum@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5251', N'Hifsa Aftab', N'hifsa.aftab@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5261', N'Usra Zahid', N'usra.zahid@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5274', N'Muhammad Zubair', N'zubair.farooqi@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5287', N'Asad Farid', N'asad.farid@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 26)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5288', N'Uzair Uddin Farooqi', N'uzair.farooqi@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 22)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5292', N'M Rizwan Majeed', N'm.rizwan@nu.edu.pk', 304, N'1', NULL, N'123', NULL, N'', N'm.asif', CAST(N'2020-02-06 11:02:07.657' AS DateTime), NULL, 26)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5293', N'Zeeshan Ahmed', N'zeeshan.ahmed@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 26)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5294', N'Muhammad Ilyas', N'm.ilyas@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 25)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5304', N'Muhammad Abrar Bilal', N'abrar.bilal@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 25)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5318', N'Sajjad Hanif', N'sajjad.hanif@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5329', N'Hafsa Rasheed Qureshi', N'hifsa.rasheed@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5331', N'Abdul Wahab', N'abdul.wahab@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 3)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5332', N'Muhammad Akhtar', N'muhammad.akhtar@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5333', N'Bilal Saeed', N'bilal.saeed@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5334', N'Rehan Aftab', N'rehan.aftab@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5354', N'Sehrish Hassan Shigri', N'sehrish.hassan@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5357', N'Muhammad Hassaan', N'muhammad.hassaan@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5358', N'Mehran Khan', N'mehran.khan@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5359', N'Qammer Naveed', N'qammer.naveed@nu.edu.pk', 309, N'1', N'', N'', NULL, N'', N'', NULL, N'', 29)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5367', N'Iqra Akram', N'iqra.akram@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 14)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5376', N'Ghulam Nabi', N'ghulam.nabi@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 57)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5389', N'Adil Bin Zahid', N'adilbin.zahid@nu.edu.pk', 316, N'1', N'', N'', NULL, N'', N'', NULL, N'', 58)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5391', N'Soha Saqib', N'soha.saqib@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 19)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5393', N'Fahad Shahzad', N'fahad.shahzad@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 22)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5405', N'Jabeen Akhtar', N'jabeen.akhtar@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 22)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5424', N'Hammad Naveed', N'hammad.naveed@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5425', N'Muhammad Adnan Tariq', N'muhammad.adnan@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5426', N'Ummara Saood', N'ummara.saood@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5433', N'Anmol Bilal', N'anmol.bilal@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5441', N'Amna Arsalan Farooqui', N'amna.farooqui@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5442', N'Muhammad Usman', N'mian.usman@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5443', N'M Sheraz Khalid', N'sheraz.khalid@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 26)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5451', N'Arjumand Bilal', N'arjumand.bilal@nu.edu.pk', 313, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5465', N'Majid Hussain', N'majid.hussain@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5467', N'Syed Zuhair Khalid', N'zuhair.khalid@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5502', N'Ifrah Maqsood', N'ifrah.maqsood@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 14)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5509', N'Waseem Haider', N'waseem.haider@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 57)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5519', N'Salma Kulsoom', N'salma.kulsoom@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5522', N'Mukhtar Ullah', N'mukhtar.alaah@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 3)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5537', N'Sidra Khalid', N'sidra.khalid@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5538', N'Mohammad Irtaza', N'irtaza.syed@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5564', N'Husnain Haidar', N'husnain.haidar@nu.edu.pk', 309, N'1', N'', N'', NULL, N'', N'', NULL, N'', 43)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5566', N'Akhtar Abbas', N'akhtar.abbas@nu.edu.pk', 309, N'1', N'', N'', NULL, N'', N'', NULL, N'', 43)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5577', N'Zain Ullah Khattak', N'zain.khattak@nu.edu.pk', 308, N'1', N'', N'', NULL, N'', N'', NULL, N'', 51)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5578', N'Shafaq Mahmood', N'shafaq.malik@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 17)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5579', N'Muhammad Basit', N'm.basit@nu.edu.pk', 310, N'1', N'', N'', NULL, N'', N'', NULL, N'', 55)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5580', N'Junaid Sheikh', N'junaid.sheikh@nu.edu.pk', 312, N'1', N'', N'', NULL, N'', N'', NULL, N'', 51)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5582', N'Amir Rehman', N'amir.rehman@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 22)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5600', N'Muhammad Bin Zubair', N'm.zubair@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 24)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5602', N'Ahmed Nawaz', N'ahmed.nawaz@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5603', N'Naeem Rehmat', N'naeem.rehmat@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5604', N'Umer Sufyan', N'umer.sufyan@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5615', N'Haider Ali', N'haider.ali@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5616', N'Adnan Shoaib', N'adnan.shoaib@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5617', N'Imad Rahim', N'imad.rahim@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5619', N'Rashad Ramzan', N'rashad.ramzan@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 5)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5620', N'Muhammad Jafar', N'muhammad.jafar@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5642', N'Omer Ishaq', N'umer.ishaq@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5643', N'Kifayat Ullah Khan', N'kifayat.alizai@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5645', N'Zoya Khalid', N'zoya.khalid@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 8)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5677', N'Neelofar Niazi', N'neelofar.niazi@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 17)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5678', N'Aqeel Sarfraz', N'aqeel.sarfraz@nu.edu.pk', 314, N'1', N'', N'', NULL, N'', N'', NULL, N'', 10)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5687', N'Shams Farooq', N'shams.farooq@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5688', N'Usman Kaisser Mughal', N'usman.kaisser@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5689', N'Naveed Ahmad', N'naveed.ahmad@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5690', N'Shujaat Hussain Kausar', N'shujaat.hussain@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5691', N'Uzma Bibi', N'uzma.bibi@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5692', N'Syed M.Saad Salman', N'saad.salman@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5693', N'Bilal Khalid Dar', N'bilal.khalid@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5694', N'Shehr Bano', N'shehr.bano@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5695', N'Kainat Iqbal', N'kainat.iqbal@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5696', N'Hassan Khalid', N'h.khalid@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 11)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5704', N'Madiha Umar', N'madiha.umar@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5723', N'Humera Sabir', N'humera.sabir@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 13)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5724', N'Muhammad Arshad Islam', N'muhammad.islam@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5745', N'Sajid Sarwar', N'sajad.sarwar@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 57)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5746', N'Aqeel Shahzad', N'sqeel.shahzad@nu.edu.pk', 302, N'1', N'', N'', NULL, N'', N'', NULL, N'', 57)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5755', N'Tehmina Sarwar', N'tehmina.sarwar@nu.edu.pk', 309, N'1', N'', N'', NULL, N'', N'', NULL, N'', 35)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5774', N'Abdul Qadoos', N'abdul.qadoos@nu.edu.pk', 303, N'1', N'', N'', NULL, N'', N'', NULL, N'', 22)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'5778', N'Arsalan kaleem', N'arslan.kaleem@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 26)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'9046', N'Sahibzada Hussain Farooq', N'hussain.farooq@nu.edu.pk', 307, N'1', N'', N'', NULL, N'', N'', NULL, N'', NULL)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'9053', N'Ghulam Moin ud Din', N'ghulam.moin@nu.edu.pk', 309, N'1', N'', N'', NULL, N'', N'', NULL, N'', 43)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'9062', N'Zohaib Zafar Iqbal', N'zohaib.iqbal@nu.edu.pk', 301, N'1', N'', N'', NULL, N'', N'', NULL, N'', 7)
INSERT [dbo].[Employee] ([Emp_ID], [Name], [Email], [Dept_ID], [Status], [Username], [Password], [Created_date], [Created_By], [Modified_By], [Modified_Date], [ResetCode], [Designation_ID]) VALUES (N'9063', N'Salman Ahmed', N'salman.ahmad@nu.edu.pk', 304, N'1', N'', N'', NULL, N'', N'', NULL, N'', 26)
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000001', 100, N'Store', N'1')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000002', 100, N'Store', N'1')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000003', 101, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000004', 102, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000005', 103, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000006', 104, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000007', 105, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000008', 107, N'Store', N'1')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000009', 102, N'Store', N'1')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000010', 108, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000011', 106, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000012', 109, N'Store', N'1')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000013', 104, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000014', 110, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000015', 111, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000016', 101, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000017', 111, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000018', 112, N'Server Room', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000019', 113, N'Store', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000020', 114, N'Server Room', N'2')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000021', 104, N'Server Room', N'1')
INSERT [dbo].[Inventory_Available] ([Inventory_No], [PID], [Placement], [Status]) VALUES (N'ISB0000022', 110, N'Server Room', N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (100, 1, N'Dell-330', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (101, 1, N'Dell-390', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (102, 3, N'Dell-3550', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (103, 5, N'26NM', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (104, 6, N'Dell', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (105, 7, N'Apple', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (106, 3, N'Dell-3350', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (107, 8, N'Laptop', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (108, 9, N'Dell', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (109, 2, N'White', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (110, 7, N'Dell', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (111, 4, N'Dell', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (112, 10, N'Crimping', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (113, 11, N'SATA 500GB', NULL, N'1')
INSERT [dbo].[Products] ([PID], [Cat_ID], [Model_Name], [Image], [Status]) VALUES (114, 2, N'Black', NULL, N'1')
SET IDENTITY_INSERT [dbo].[Sales_Issue] ON 

INSERT [dbo].[Sales_Issue] ([Issued_ID], [Emp_ID], [Comments], [Placement], [Created_Date], [Modify_Date], [Modify_By], [Created_By], [Status]) VALUES (1, N'4821', NULL, N'Kohsar Lab', CAST(N'2020-11-06 10:48:34.057' AS DateTime), NULL, NULL, N'System', N'1')
INSERT [dbo].[Sales_Issue] ([Issued_ID], [Emp_ID], [Comments], [Placement], [Created_Date], [Modify_Date], [Modify_By], [Created_By], [Status]) VALUES (2, N'5182', N'Received by Asif', N'Server room', CAST(N'2020-11-10 14:53:26.230' AS DateTime), CAST(N'2020-11-11 10:45:42.670' AS DateTime), N'm.asif', N'System', N'0')
INSERT [dbo].[Sales_Issue] ([Issued_ID], [Emp_ID], [Comments], [Placement], [Created_Date], [Modify_Date], [Modify_By], [Created_By], [Status]) VALUES (3, N'4446', NULL, N'Server room', CAST(N'2020-11-10 15:09:57.350' AS DateTime), NULL, NULL, N'System', N'1')
INSERT [dbo].[Sales_Issue] ([Issued_ID], [Emp_ID], [Comments], [Placement], [Created_Date], [Modify_Date], [Modify_By], [Created_By], [Status]) VALUES (4, N'5600', NULL, N'Server Room', CAST(N'2020-11-11 08:22:39.243' AS DateTime), NULL, NULL, N'System', N'1')
INSERT [dbo].[Sales_Issue] ([Issued_ID], [Emp_ID], [Comments], [Placement], [Created_Date], [Modify_Date], [Modify_By], [Created_By], [Status]) VALUES (5, N'5044', NULL, N'Potohar Lab', CAST(N'2020-11-11 08:29:19.060' AS DateTime), NULL, NULL, N'System', N'1')
INSERT [dbo].[Sales_Issue] ([Issued_ID], [Emp_ID], [Comments], [Placement], [Created_Date], [Modify_Date], [Modify_By], [Created_By], [Status]) VALUES (6, N'5294', NULL, N'BBA FYP Lab', CAST(N'2020-11-11 08:47:55.887' AS DateTime), NULL, NULL, N'System', N'1')
SET IDENTITY_INSERT [dbo].[Sales_Issue] OFF
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000003', 5, 1, N'8GB RAM, HDD 500GB', N'Store', N'system', N'1', CAST(N'2020-11-11 08:31:00.030' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000004', 2, 1, N'Core i5, 16GB RAM, 1TB HD', N'Server Room', N'system', N'1', CAST(N'2020-11-11 08:46:45.343' AS DateTime), N'Received', NULL, NULL, N'N')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000005', 2, 1, NULL, N'Store', N'system', N'1', CAST(N'2020-11-10 14:57:45.480' AS DateTime), N'Received', NULL, NULL, N'N')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000006', 2, 1, NULL, N'Store', N'system', N'1', CAST(N'2020-11-10 15:02:10.720' AS DateTime), N'Received', CAST(N'2020-11-10 15:02:58.773' AS DateTime), N'asif', N'N')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000007', 2, 1, NULL, N'Store', N'system', N'1', CAST(N'2020-11-10 15:02:34.473' AS DateTime), N'Received', NULL, NULL, N'N')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000010', 3, 1, N'', N'Store', N'system', N'1', CAST(N'2020-11-10 16:37:53.210' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000011', 3, 1, N'Core i5 16GB RAM, Bag,   Charger', N'Store', N'system', N'1', CAST(N'2020-11-10 16:36:44.307' AS DateTime), NULL, CAST(N'2020-11-10 16:37:14.673' AS DateTime), N'asif', N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000013', 4, 1, N'', N'Server Room', N'system', N'1', CAST(N'2020-11-11 08:59:15.287' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000014', 4, 1, N'', N'Server Room', N'system', N'1', CAST(N'2020-11-11 08:59:21.437' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000015', 5, 1, N'', N'Store', N'system', N'1', CAST(N'2020-11-11 08:31:20.083' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000016', 1, 1, N'', N'Store', N'system', N'1', CAST(N'2020-11-11 10:37:03.950' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000017', 1, 1, N'', N'Store', N'system', N'1', CAST(N'2020-11-11 10:37:12.063' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000018', 6, 1, N'', N'Server Room', N'system', N'1', CAST(N'2020-11-11 08:53:58.890' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000019', 6, 1, N'', N'Server Room', N'system', N'1', CAST(N'2020-11-11 08:54:09.023' AS DateTime), NULL, NULL, NULL, N'Y')
INSERT [dbo].[Sales_Issue_Details] ([Inventory_No], [Issued_ID], [SerialNo], [Description], [Issued_From], [Issued_By], [Issue_Type], [Issued_Date], [Comments], [Modify_Date], [Modify_By], [Status]) VALUES (N'ISB0000020', 4, 1, N'', N'Server Room', N'system', N'1', CAST(N'2020-11-11 08:59:08.230' AS DateTime), NULL, NULL, NULL, N'Y')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Category__737584F68DACCDCF]    Script Date: 1/22/2021 10:11:13 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UQ__Category__737584F68DACCDCF] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Departme__737584F69422B169]    Script Date: 1/22/2021 10:11:13 AM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [UQ__Departme__737584F69422B169] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[Department] ([Dept_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Designation] FOREIGN KEY([Designation_ID])
REFERENCES [dbo].[Designation] ([Designation_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Designation]
GO
ALTER TABLE [dbo].[Inventory_Available]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Available_Products] FOREIGN KEY([PID])
REFERENCES [dbo].[Products] ([PID])
GO
ALTER TABLE [dbo].[Inventory_Available] CHECK CONSTRAINT [FK_Inventory_Available_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_Products_Cat_ID] FOREIGN KEY([Cat_ID])
REFERENCES [dbo].[Category] ([Cat_ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_Products_Cat_ID]
GO
ALTER TABLE [dbo].[Sales_Issue]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Issue_Employee] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[Sales_Issue] CHECK CONSTRAINT [FK_Sales_Issue_Employee]
GO
ALTER TABLE [dbo].[Sales_Issue_Details]  WITH CHECK ADD  CONSTRAINT [fk_Sales_Details_Issued_ID1] FOREIGN KEY([Issued_ID])
REFERENCES [dbo].[Sales_Issue] ([Issued_ID])
GO
ALTER TABLE [dbo].[Sales_Issue_Details] CHECK CONSTRAINT [fk_Sales_Details_Issued_ID1]
GO
ALTER TABLE [dbo].[Sales_Issue_Details]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Issue_Details_Inventory_Available] FOREIGN KEY([Inventory_No])
REFERENCES [dbo].[Inventory_Available] ([Inventory_No])
GO
ALTER TABLE [dbo].[Sales_Issue_Details] CHECK CONSTRAINT [FK_Sales_Issue_Details_Inventory_Available]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[26] 2[15] 3) )"
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
         Begin Table = "Employee"
            Begin Extent = 
               Top = 3
               Left = 307
               Bottom = 133
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sales_Issue"
            Begin Extent = 
               Top = 0
               Left = 666
               Bottom = 130
               Right = 836
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sales_Issue_Details"
            Begin Extent = 
               Top = 0
               Left = 896
               Bottom = 130
               Right = 1066
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 19
               Left = 16
               Bottom = 115
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 242
               Left = 888
               Bottom = 372
               Right = 1058
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 282
               Left = 1098
               Bottom = 378
               Right = 1268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inventory_Available"
            Begin Extent = 
               Top = 100
               Left = 1098
               Bottom = 230
               Right = 1268
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_SalesDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Designation"
            Begin Extent = 
               Top = 153
               Left = 522
               Bottom = 266
               Right = 702
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
         Column = 2085
         Alias = 2895
         Table = 1515
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_SalesDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_SalesDetails'
GO
