USE [CRM_DB]
GO
/****** Object:  UserDefinedTableType [dbo].[CSV_SampleUploadedData]    Script Date: 9/17/2024 4:35:36 PM ******/
CREATE TYPE [dbo].[CSV_SampleUploadedData] AS TABLE(
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Customer_Address1] [varchar](500) NULL,
	[Customer_City] [varchar](20) NOT NULL,
	[Customer_State] [varchar](20) NOT NULL,
	[Customer_Zipcode] [int] NOT NULL,
	[Customer_Phone] [bigint] NOT NULL,
	[Customer_Email] [varchar](100) NOT NULL,
	[Customer_Type] [varchar](20) NOT NULL,
	[OptIn] [varchar](10) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[Decile] [bigint] NULL,
	[Tenure] [varchar](10) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CSVSampleUploadedData]    Script Date: 9/17/2024 4:35:36 PM ******/
CREATE TYPE [dbo].[CSVSampleUploadedData] AS TABLE(
	[Campaign_ID] [bigint] NOT NULL,
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Customer_Address1] [varchar](500) NULL,
	[Customer_City] [varchar](20) NOT NULL,
	[Customer_State] [varchar](20) NOT NULL,
	[Customer_Zipcode] [int] NOT NULL,
	[Customer_Phone] [bigint] NOT NULL,
	[Customer_Email] [varchar](100) NOT NULL,
	[Customer_Type] [varchar](20) NOT NULL,
	[OptIn] [varchar](10) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[Decile] [bigint] NULL,
	[Tenure] [varchar](10) NULL
)
GO
/****** Object:  Table [dbo].[Agent_Master]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent_Master](
	[Agent_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[UserType] [varchar](20) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Agent_Master] PRIMARY KEY CLUSTERED 
(
	[Agent_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppErrorLog]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppErrorLog](
	[SessionGUID] [uniqueidentifier] NOT NULL,
	[AppUrl] [varchar](500) NULL,
	[ExceptionArea] [varchar](100) NOT NULL,
	[ExceptionMsg] [nvarchar](max) NOT NULL,
	[ExceptionDetail] [varchar](max) NULL,
	[AppName] [varchar](50) NOT NULL,
	[ServerName] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment_Reminder]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment_Reminder](
	[Appointment_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Appointment_Datetime] [datetime] NULL,
	[Campaign_ID] [bigint] NULL,
	[Campaign_Type] [varchar](100) NULL,
	[Interval] [int] NULL,
	[Reminder_Datetime] [datetime] NULL,
	[Send_Reminder] [bit] NULL,
	[Reminder_Type] [varchar](10) NULL,
	[Customer_ID] [bigint] NULL,
	[Agent_ID] [bigint] NULL,
	[Campaign_Name] [varchar](500) NULL,
	[Campaign_Recurrence_Type] [varchar](20) NULL,
	[Campaign_Recurrence_Pattern] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment_Reminder_bkup]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment_Reminder_bkup](
	[Appointment_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Appointment_Datetime] [datetime] NULL,
	[Campaign_ID] [bigint] NULL,
	[Campaign_Type] [varchar](100) NULL,
	[Interval] [int] NULL,
	[Reminder_Datetime] [datetime] NULL,
	[Customer_ID] [bigint] NULL,
	[Agent_ID] [bigint] NULL,
	[Campaign_Name] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment_Reminder_Campaign_Trans]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment_Reminder_Campaign_Trans](
	[Appointment_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Appointment_Datetime] [datetime] NULL,
	[Campaign_ID] [bigint] NULL,
	[Campaign_Type] [varchar](100) NULL,
	[Interval] [int] NULL,
	[Reminder_Datetime] [datetime] NULL,
	[Customer_ID] [bigint] NULL,
	[Agent_ID] [bigint] NULL,
	[Campaign_Name] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Call_Details]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Call_Details](
	[Call_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Agent_Name] [varchar](50) NULL,
	[Agent_ID] [int] NULL,
	[Call_DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Call_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Call_Interactions]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Call_Interactions](
	[CallInteraction_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustLead_ID] [bigint] NOT NULL,
	[Contact_ID] [float] NULL,
	[CustDetail_ID] [bigint] NOT NULL,
	[AgentMaster_ID] [bigint] NOT NULL,
	[AgentName] [varchar](50) NULL,
	[InteractionDate] [datetime] NOT NULL,
	[InteractionDuration] [time](7) NOT NULL,
	[PrevIssueType] [varchar](50) NULL,
	[IssueType] [varchar](50) NULL,
	[PrevSubIssueID] [varchar](50) NULL,
	[SubIssueID] [varchar](50) NULL,
	[DispositionID] [bigint] NULL,
	[DispositionCode] [varchar](50) NULL,
	[PrevCaseStatusID] [varchar](50) NULL,
	[CaseStatusID] [varchar](50) NULL,
	[CaseStatusCode] [varchar](50) NULL,
	[PrevTierID] [varchar](50) NULL,
	[TierID] [varchar](50) NULL,
	[TeleInteractionID] [varchar](50) NULL,
	[PlanId] [bigint] NULL,
	[PlanName] [varchar](100) NULL,
	[Product] [varchar](50) NULL,
	[ContractNumber] [varchar](20) NULL,
	[PBP_Number] [varchar](20) NULL,
	[Notify] [varchar](50) NULL,
	[Priority] [varchar](50) NULL,
	[ImpactID] [varchar](50) NULL,
	[UrgencyID] [varchar](50) NULL,
	[ContactTypeID] [varchar](50) NULL,
	[Campaign_ID] [float] NULL,
	[ScheduledCallback_ID] [bigint] NULL,
	[Notes] [varchar](1000) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [float] NULL,
	[Zip] [varchar](20) NULL,
	[ZipCode] [varchar](10) NULL,
	[WebExOffered] [varchar](50) NULL,
	[WebExConsent] [varchar](50) NULL,
	[WebExMethod] [varchar](50) NULL,
 CONSTRAINT [PK_Call_Interactions] PRIMARY KEY CLUSTERED 
(
	[CallInteraction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Call_Scoring_Details]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Call_Scoring_Details](
	[Call_Score_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Call_ID] [bigint] NULL,
	[Question_ID] [tinyint] NULL,
	[Answer] [varchar](10) NULL,
	[Score] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Call_Score_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_BasicDetails]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_BasicDetails](
	[Campaign_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Campaign_Name] [varchar](100) NULL,
	[Campaign_Type] [varchar](50) NULL,
	[Wave] [varchar](10) NULL,
	[Start_Date] [date] NULL,
	[Project_Owner] [varchar](50) NULL,
	[Stakeholder] [varchar](500) NULL,
	[Sample_Selection] [varchar](10) NULL,
	[Customer_ID] [varchar](50) NULL,
	[Customer_Name] [varchar](100) NULL,
	[Customer_Phone] [bigint] NULL,
	[Customer_Email] [varchar](50) NULL,
	[Agent_ID] [bigint] NULL,
	[Campaign_Recurrence_Type] [varchar](20) NULL,
	[Campaign_Recurrence_Pattern] [varchar](500) NULL,
	[Campaign_Brand] [varchar](20) NULL,
	[Project_Owner_MailIds] [varchar](500) NULL,
	[Stakeholder_MailIds] [varchar](500) NULL,
	[expirydate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_BasicDetails_bkup]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_BasicDetails_bkup](
	[Campaign_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Campaign_Name] [varchar](100) NULL,
	[Campaign_Type] [varchar](50) NULL,
	[Wave] [varchar](10) NULL,
	[Start_Date] [date] NULL,
	[Project_Owner] [varchar](50) NULL,
	[Stakeholder] [varchar](500) NULL,
	[Sample_Selection] [varchar](10) NULL,
	[Customer_ID] [varchar](50) NULL,
	[Customer_Name] [varchar](100) NULL,
	[Customer_Phone] [bigint] NULL,
	[Customer_Email] [varchar](50) NULL,
	[Agent_ID] [bigint] NULL,
	[Campaign_Recurrence_Type] [varchar](20) NULL,
	[Campaign_Recurrence_Pattern] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Customers]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Customers](
	[Campaign_ID] [bigint] NOT NULL,
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Customer_Address1] [varchar](500) NULL,
	[Customer_City] [varchar](20) NOT NULL,
	[Customer_State] [varchar](20) NOT NULL,
	[Customer_Zipcode] [int] NOT NULL,
	[Customer_Phone] [bigint] NOT NULL,
	[Customer_Email] [varchar](100) NOT NULL,
	[Customer_Type] [varchar](20) NOT NULL,
	[OptIn] [varchar](20) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[Decile] [varchar](10) NULL,
	[Tenure] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Details]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Campaign_id] [nvarchar](50) NOT NULL,
	[Source_tfn] [nvarchar](10) NULL,
	[Source_campaign] [varchar](50) NULL,
	[Source_mediachannel] [varchar](50) NULL,
	[Source_Affiliate] [varchar](50) NULL,
	[Launch_date] [date] NULL,
	[End_date] [date] NULL,
 CONSTRAINT [PK_Campaign_Details] PRIMARY KEY CLUSTERED 
(
	[Campaign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Filter]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Filter](
	[CampFilter_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Campaign_ID] [bigint] NOT NULL,
	[Sample_Selection] [varchar](20) NOT NULL,
	[Customer_TableName] [varchar](200) NULL,
	[Criteria_State] [varchar](500) NULL,
	[Criteria_Product] [varchar](200) NULL,
	[Criteria_Decile] [varchar](200) NULL,
	[Criteria_Tenure] [varchar](200) NULL,
	[Criteria_TargetVolume] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Filter_bkup]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Filter_bkup](
	[CampFilter_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Campaign_ID] [bigint] NOT NULL,
	[Sample_Selection] [varchar](20) NOT NULL,
	[Customer_TableName] [varchar](200) NULL,
	[Criteria_State] [varchar](500) NULL,
	[Criteria_Product] [varchar](200) NULL,
	[Criteria_Decile] [varchar](200) NULL,
	[Criteria_Tenure] [varchar](200) NULL,
	[Criteria_TargetVolume] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Result]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Result](
	[Campaign_ID] [bigint] NOT NULL,
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Customer_Address1] [varchar](500) NULL,
	[Customer_City] [varchar](20) NOT NULL,
	[Customer_State] [varchar](20) NOT NULL,
	[Customer_Zipcode] [int] NOT NULL,
	[Customer_Phone] [bigint] NOT NULL,
	[Customer_Email] [varchar](100) NOT NULL,
	[Customer_Type] [varchar](20) NOT NULL,
	[OptIn] [varchar](20) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[Decile] [varchar](10) NULL,
	[Tenure] [varchar](20) NULL,
	[Updated_On] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_Result_bkup]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_Result_bkup](
	[Campaign_ID] [bigint] NOT NULL,
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Customer_Address1] [varchar](500) NULL,
	[Customer_City] [varchar](20) NOT NULL,
	[Customer_State] [varchar](20) NOT NULL,
	[Customer_Zipcode] [int] NOT NULL,
	[Customer_Phone] [bigint] NOT NULL,
	[Customer_Email] [varchar](100) NOT NULL,
	[Customer_Type] [varchar](20) NOT NULL,
	[OptIn] [varchar](20) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[Decile] [varchar](10) NULL,
	[Tenure] [varchar](20) NULL,
	[Updated_On] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_SampleUploadedData]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_SampleUploadedData](
	[CampFilter_ID] [bigint] NULL,
	[Campaign_ID] [bigint] NOT NULL,
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Customer_Address1] [varchar](500) NULL,
	[Customer_City] [varchar](20) NOT NULL,
	[Customer_State] [varchar](20) NOT NULL,
	[Customer_Zipcode] [int] NOT NULL,
	[Customer_Phone] [bigint] NOT NULL,
	[Customer_Email] [varchar](100) NOT NULL,
	[Customer_Type] [varchar](20) NOT NULL,
	[OptIn] [varchar](20) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[Decile] [bigint] NULL,
	[Tenure] [varchar](10) NULL,
	[Uploaded_On] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign_SampleUploadedData_bkup]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign_SampleUploadedData_bkup](
	[CampFilter_ID] [bigint] NULL,
	[Campaign_ID] [bigint] NOT NULL,
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Customer_Address1] [varchar](500) NULL,
	[Customer_City] [varchar](20) NOT NULL,
	[Customer_State] [varchar](20) NOT NULL,
	[Customer_Zipcode] [int] NOT NULL,
	[Customer_Phone] [bigint] NOT NULL,
	[Customer_Email] [varchar](100) NOT NULL,
	[Customer_Type] [varchar](20) NOT NULL,
	[OptIn] [varchar](20) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[Decile] [bigint] NULL,
	[Tenure] [varchar](10) NULL,
	[Uploaded_On] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CRM_LookupMaster]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CRM_LookupMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataGroup] [varchar](50) NULL,
	[CodeVal] [varchar](50) NULL,
	[TxtVal] [varchar](100) NULL,
	[ModuleName] [varchar](100) NULL,
	[FieldName] [varchar](100) NULL,
	[SortOrder] [int] NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Details]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Details](
	[CustDetail_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[BrandID] [bigint] NULL,
	[RecordType_ID] [int] NULL,
	[MasterCustomer_ID] [bigint] NULL,
	[Session_ID] [varchar](50) NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Phone] [bigint] NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Shared] [tinyint] NULL,
	[Address1] [varchar](200) NULL,
	[Address2] [varchar](200) NULL,
	[Phone2] [float] NULL,
	[City] [varchar](200) NOT NULL,
	[State] [varchar](200) NOT NULL,
	[Zip] [varchar](25) NOT NULL,
	[Gender] [varchar](50) NULL,
	[DOB] [varchar](10) NOT NULL,
	[Salutation] [varchar](25) NULL,
	[MiddleName] [varchar](50) NULL,
	[Suffix] [varchar](25) NULL,
	[ContactPreference] [varchar](25) NULL,
	[Country] [varchar](50) NOT NULL,
	[RAPPORT_Family] [text] NULL,
	[RAPPORT_Travel] [text] NULL,
	[RAPPORT_Hobbies] [text] NULL,
	[RAPPORT_Military] [text] NULL,
	[RAPPORT_Pets] [text] NULL,
	[RAPPORT_Weather] [text] NULL,
	[RAPPORT_Political] [text] NULL,
	[RAPPORT_Important_Date] [text] NULL,
	[RAPPORT_Health_Info] [text] NULL,
	[Smoker] [varchar](10) NULL,
	[Fips] [varchar](25) NULL,
	[PartA_EffectiveDate] [date] NULL,
	[PartB_EffectiveDate] [date] NULL,
	[ContactPreference_Text] [int] NULL,
	[ContactPreference_Phone] [int] NULL,
	[ContactPreference_Email] [int] NULL,
	[ContactPreference_No_OptIN] [int] NULL,
	[Medicare_Number] [varchar](25) NULL,
	[Campaign_ID] [bigint] NULL,
	[RecipientID] [bigint] NULL,
	[Optout] [varchar](10) NULL,
	[ReferralID] [int] NULL,
	[Text_OptIN] [int] NULL,
	[Email_OptIN] [int] NULL,
	[Phone_OptIN] [int] NULL,
	[LastAgent_ID] [float] NULL,
	[Medicaid_Number] [varchar](50) NULL,
	[RepName] [varchar](200) NULL,
	[Rep_Phone] [varchar](200) NULL,
	[Rep_Relationship] [varchar](200) NULL,
 CONSTRAINT [PK_Customer_Details] PRIMARY KEY CLUSTERED 
(
	[CustDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Leads]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Leads](
	[CustLead_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[BrandID] [varchar](50) NULL,
	[CustDetail_ID] [bigint] NOT NULL,
	[ContactID] [bigint] NULL,
	[Source_TFN] [bigint] NULL,
	[AgentMaster_ID] [bigint] NULL,
	[AgentName] [varchar](100) NULL,
	[PreIssueType] [int] NULL,
	[IssueType] [int] NULL,
	[PreIssueID] [int] NULL,
	[IssueID] [int] NULL,
	[PreIssueSubID] [int] NULL,
	[SubIssueID] [int] NULL,
	[PrevCaseStatusID] [int] NULL,
	[CaseStatusID] [int] NULL,
	[CaseStatusCode] [varchar](20) NULL,
	[CreatedDate] [varchar](20) NULL,
	[LastUpdate] [varchar](20) NULL,
	[PrevTier] [varchar](10) NULL,
	[Notes] [nvarchar](1000) NULL,
	[Tier] [int] NULL,
	[AssignedAgent_ID] [float] NULL,
	[PriorityID] [int] NULL,
	[ClassificationID] [int] NULL,
	[Urgency] [int] NULL,
	[ImpactID] [int] NULL,
	[CaseType] [int] NULL,
	[RuleTicker] [nvarchar](50) NULL,
	[ExternalID] [varchar](250) NULL,
	[Session_ID] [varchar](100) NULL,
	[EnrolledMedicareAB] [varchar](25) NULL,
	[MedicareCVG6mt] [varchar](25) NULL,
	[MedicareCVG6MT_Date] [varchar](20) NULL,
	[PIMA] [varchar](25) NULL,
	[PIMS] [varchar](25) NULL,
	[PIPDP] [varchar](25) NULL,
	[PIDVH] [varchar](25) NULL,
	[PICHAS] [varchar](25) NULL,
	[PIHIIP] [int] NULL,
	[MedicareBasics] [varchar](25) NULL,
	[MAMS_Difference] [varchar](25) NULL,
	[SOAMA] [varchar](25) NULL,
	[SOAMS] [varchar](25) NULL,
	[SOAPDP] [varchar](25) NULL,
	[SOADVH] [varchar](25) NULL,
	[SOACHAS] [varchar](25) NULL,
	[SOAHIIP] [varchar](25) NULL,
	[SOAConsent] [varchar](25) NULL,
	[MedicaidAssistiance] [varchar](50) NULL,
	[RecentCoverageChange] [varchar](25) NULL,
	[MedicaidLosingDate] [varchar](20) NULL,
	[ExtraHelporLIS] [varchar](25) NULL,
	[RecentChanges] [varchar](25) NULL,
	[MostExpensivePrescription] [varchar](25) NULL,
	[RecentlyLostCoverage] [varchar](25) NULL,
	[RecentlyMoved] [varchar](25) NULL,
	[PlanningToMove] [varchar](25) NULL,
	[LostCoverageDate] [date] NULL,
	[DateMoved] [date] NULL,
	[PlannedMoveDate] [date] NULL,
	[CurrentCoverageType] [varchar](20) NULL,
	[MSCarrier] [varchar](50) NULL,
	[MSPlanType] [varchar](15) NULL,
	[MSCurrentPremium] [varchar](20) NULL,
	[AdditionalPD_Premium] [varchar](20) NULL,
	[CurrentCoverageTenure] [varchar](20) NULL,
	[CurrentCoveragePremiumIncrease] [varchar](25) NULL,
	[MSSinceBeginning] [varchar](50) NULL,
	[PreviousCarrier] [varchar](50) NULL,
	[HouseHold_MedicareEligible] [varchar](25) NULL,
	[MS_PlanChangePreference] [varchar](200) NULL,
	[HealthCondition] [varchar](250) NULL,
	[DiabetesCondition] [varchar](200) NULL,
	[HealthConditionPendingServices] [varchar](200) NULL,
	[HealthConditionResultDate] [varchar](20) NULL,
	[NumberOfDoctorVisits] [int] NULL,
	[MA_Carrier] [varchar](50) NULL,
	[MA_PlanType] [varchar](50) NULL,
	[SpecialistWoReferral] [varchar](25) NULL,
	[ReferralIssues] [varchar](25) NULL,
	[SVCOON] [varchar](25) NULL,
	[OONCOST] [varchar](20) NULL,
	[CurrentMA_Premium] [varchar](20) NULL,
	[PCPCOPAY] [varchar](20) NULL,
	[SpecialistCoPay] [varchar](20) NULL,
	[InsCardAccess] [varchar](25) NULL,
	[MOOP] [varchar](20) NULL,
	[InPatientCost] [varchar](20) NULL,
	[InPatientCoPayDays] [int] NULL,
	[HasDeductible] [varchar](25) NULL,
	[MADeductible] [varchar](25) NULL,
	[MA_AddtionalBenefits] [varchar](200) NULL,
	[DentalType] [varchar](20) NULL,
	[MA_PlanChangePreference] [varchar](200) NULL,
	[MA_DrugCovered] [varchar](25) NULL,
	[MA_ProviderNotAccepted] [varchar](25) NULL,
	[MAOONProvider] [varchar](200) NULL,
	[GroupPlanType] [varchar](20) NULL,
	[LosingGroupCoverage] [varchar](25) NULL,
	[LosingGroupCoverageDate] [date] NULL,
	[LeavingGroupCoverage] [varchar](50) NULL,
	[LeavingGroupCoverageDate] [date] NULL,
	[ReEnrollingGroupCoverage] [varchar](25) NULL,
	[GroupBenefits] [varchar](200) NULL,
	[GroupContinueBenefits] [varchar](25) NULL,
	[GroupCoverageDependents] [varchar](25) NULL,
	[DependentsMedicareEligible] [varchar](25) NULL,
	[GroupDependentKeep] [varchar](25) NULL,
	[GroupDependentsInterseted] [varchar](25) NULL,
 CONSTRAINT [PK_Customer_Leads] PRIMARY KEY CLUSTERED 
(
	[CustLead_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Quotation]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Quotation](
	[CustQuote_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustLead_ID] [bigint] NULL,
	[Carrier] [varchar](50) NULL,
	[CopayBase_Riders] [varchar](50) NULL,
	[Coverage_Amount] [varchar](20) NULL,
	[Effective_Date] [varchar](10) NULL,
	[Info_ProviderMethod] [varchar](20) NULL,
	[LocationSpecified_Options] [varchar](200) NULL,
	[Plan_ID] [bigint] NULL,
	[Plan_Name] [varchar](200) NULL,
	[Quoted_PlanType] [varchar](20) NULL,
	[Quoted_PolicyType] [varchar](20) NULL,
	[Quoted_Rate] [varchar](20) NULL,
	[Quotation_Date] [datetime] NULL,
	[Riders] [varchar](2000) NULL,
	[SNP] [varchar](20) NULL,
	[CustDetail_ID] [int] NULL,
	[Date_Created] [varchar](10) NULL,
	[Enrolled] [tinyint] NULL,
	[CallInteraction_ID] [bigint] NULL,
	[Tenant_ID] [int] NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_Customer_Quotation] PRIMARY KEY CLUSTERED 
(
	[CustQuote_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Table]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Table](
	[Campaign_ID] [bigint] NOT NULL,
	[Customer_ID] [varchar](50) NULL,
	[Customer_name] [varchar](100) NULL,
	[Address1] [varchar](max) NULL,
	[Customer_email] [varchar](50) NULL,
	[Customer_phone] [bigint] NULL,
	[Customer_State] [varchar](max) NULL,
	[CITY] [varchar](50) NULL,
	[Customer_Type] [varchar](20) NULL,
	[Product] [varchar](50) NULL,
	[Decile] [varchar](50) NULL,
	[Tenure] [varchar](50) NULL,
	[OptIn] [varchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email_Template]    Script Date: 9/17/2024 4:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email_Template](
	[Template_ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Template_Content] [varchar](max) NULL,
	[Campaign_Type] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Template_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailDetailsForCampaignCustomer]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailDetailsForCampaignCustomer](
	[Campaign_ID] [int] NOT NULL,
	[Customer_ID] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[Customer_Address1] [varchar](500) NULL,
	[Customer_City] [varchar](20) NOT NULL,
	[Customer_State] [varchar](20) NOT NULL,
	[Customer_Zipcode] [int] NOT NULL,
	[Customer_Phone] [bigint] NOT NULL,
	[Customer_Email] [varchar](100) NOT NULL,
	[Customer_Type] [varchar](20) NOT NULL,
	[OptIn] [varchar](20) NOT NULL,
	[Product] [varchar](10) NOT NULL,
	[Decile] [varchar](10) NULL,
	[Tenure] [varchar](20) NULL,
	[CustomerTypeText] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_Details]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_Details](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Pwd] [varchar](50) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginUsers]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](100) NOT NULL,
	[Pwd] [varchar](20) NOT NULL,
	[User_Type] [varchar](20) NULL,
	[Agent_ID] [bigint] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanMaster]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PlanName] [varchar](100) NOT NULL,
	[Product] [varchar](50) NOT NULL,
	[ContractNumber] [varchar](20) NULL,
	[PBPNumber] [varchar](20) NULL,
	[PlanType] [varchar](100) NULL,
	[PolicyType] [varchar](20) NULL,
	[Carrier] [varchar](100) NULL,
	[Rate] [decimal](18, 2) NULL,
	[Coverage] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PlanMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Master]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Master](
	[Question_ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Question_Name] [varchar](5) NULL,
	[Question_Description] [varchar](1000) NULL,
	[MaxScore] [bit] NULL,
	[QuestionCategory_ID] [tinyint] NULL,
	[QuestionType_ID] [tinyint] NULL,
	[Points] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionCategory_Master]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionCategory_Master](
	[QuestionCategory_ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[QuestionCategory_Name] [varchar](100) NULL,
	[QuestionCategory_Points] [int] NULL,
	[QuestionCategory_Percentage] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType_Master]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType_Master](
	[QuestionType_ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[QuestionType_Options] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Sale_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustLead_ID] [bigint] NULL,
	[Plan_ID] [bigint] NULL,
	[PlanType] [varchar](20) NULL,
	[HICN_MBI] [varchar](20) NULL,
	[ContractNumber] [varchar](20) NULL,
	[PBPNumber] [varchar](20) NULL,
	[Confirmation_Number] [varchar](20) NULL,
	[PolicyNumber] [varchar](20) NULL,
	[CustDetail_ID] [int] NULL,
	[SubmitStatus] [varchar](10) NULL,
	[IssueStatus] [varchar](10) NULL,
	[CustQuote_ID] [int] NULL,
	[CallInteraction_ID] [int] NULL,
	[Carrier] [varchar](50) NULL,
	[SourceOfSale] [varchar](100) NULL,
	[TypeOfSale] [varchar](50) NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Sale_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scheduled_Callbacks]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scheduled_Callbacks](
	[ScheduledCallback_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[BrandID] [bigint] NULL,
	[AppointmentTypeID] [int] NULL,
	[Appointment_Date] [datetime] NULL,
	[Appointment_DateString] [varchar](50) NULL,
	[Callback_Date] [datetime] NULL,
	[Callback_DateString] [varchar](50) NULL,
	[Callback_Text] [varchar](2000) NULL,
	[Callback_Time] [time](7) NULL,
	[CallbackTimeOption] [varchar](20) NULL,
	[Send_Reminder] [bit] NULL,
	[Reminder_Type] [varchar](10) NULL,
	[CustLead_ID] [bigint] NULL,
	[CallInteraction_ID] [bigint] NULL,
	[Priority] [int] NULL,
	[AgentType] [int] NULL,
	[Completion_Time] [time](7) NULL,
	[Completion_Agent] [bigint] NULL,
	[Active] [tinyint] NULL,
	[CallbackTime2] [varchar](20) NULL,
	[Category] [varchar](300) NULL,
	[AgentMaster_ID] [bigint] NULL,
	[CallbackNumber] [float] NULL,
	[Dispostion_ID] [varchar](200) NULL,
 CONSTRAINT [PK_Scheduled_Callbacks] PRIMARY KEY CLUSTERED 
(
	[ScheduledCallback_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Details]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Details](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[HASH] [nvarchar](max) NOT NULL,
	[SALT] [varbinary](512) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipCityStateListForUS]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCityStateListForUS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ZipCodes] [varchar](50) NULL,
	[ZipRange_From] [int] NOT NULL,
	[ZipRange_To] [int] NOT NULL,
	[CapitalCity] [varchar](50) NOT NULL,
	[State_Short] [varchar](10) NOT NULL,
	[State_Full] [varchar](100) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ZipCityStateListForUS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Call_Interactions]  WITH CHECK ADD  CONSTRAINT [FK_Call_Interactions_Customer_Details] FOREIGN KEY([CustDetail_ID])
REFERENCES [dbo].[Customer_Details] ([CustDetail_ID])
GO
ALTER TABLE [dbo].[Call_Interactions] CHECK CONSTRAINT [FK_Call_Interactions_Customer_Details]
GO
ALTER TABLE [dbo].[Call_Interactions]  WITH CHECK ADD  CONSTRAINT [FK_Call_Interactions_Customer_Leads] FOREIGN KEY([CustLead_ID])
REFERENCES [dbo].[Customer_Leads] ([CustLead_ID])
GO
ALTER TABLE [dbo].[Call_Interactions] CHECK CONSTRAINT [FK_Call_Interactions_Customer_Leads]
GO
ALTER TABLE [dbo].[Call_Scoring_Details]  WITH CHECK ADD FOREIGN KEY([Call_ID])
REFERENCES [dbo].[Call_Details] ([Call_ID])
GO
ALTER TABLE [dbo].[Customer_Leads]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Leads_Customer_Details] FOREIGN KEY([CustDetail_ID])
REFERENCES [dbo].[Customer_Details] ([CustDetail_ID])
GO
ALTER TABLE [dbo].[Customer_Leads] CHECK CONSTRAINT [FK_Customer_Leads_Customer_Details]
GO
/****** Object:  StoredProcedure [dbo].[FireDynaSQL]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[FireDynaSQL]
(
	@dynaSQL nvarchar(max)
)
As
Begin
	Print @dynaSQL;
	Exec sp_executesql @dynaSQL;
End
GO
/****** Object:  StoredProcedure [dbo].[uspCheckUserCred]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[uspCheckUserCred] 'Ryan12', '12312';
--exec [dbo].[uspCheckUserCred] 'RCooper1', 'Abc@123!';
CREATE PROC [dbo].[uspCheckUserCred]
(
	@pUserId varchar(100),
	@pPwd varchar(20) 
)
As
Begin
	Declare @status bit;
	Declare @description varchar(50);
	Declare @agentId bigint;
	Declare @firstName varchar(100), @middleName varchar(50), @lastName varchar(50), @emailId varchar(50), @userType varchar(20), @active bit;
	--Select @firstName = '', @middleName = '', @lastName = '';

	Select @agentId=Agent_ID, @userType=User_Type from [dbo].[LoginUsers] Where UserId=@pUserId And [Pwd]=@pPwd;

	If Exists (Select 1 from [dbo].[LoginUsers] Where UserId=@pUserId And [Pwd]=@pPwd)
	Begin
		Set @status = 1; 
		Set @description = 'User validated';
		If (@agentId > 0)
		Begin
			Select @firstName = FirstName, @middleName = MiddleName, @lastName = LastName, @emailId = Email, @active = [Active] From dbo.Agent_Master Where Agent_ID=@agentId;
		End
	End
	Else
	Begin
		Set @status = 0; 
		Set @description = 'UserId and/or Password not correct';
	End

	Select @status As [Status], @description As [Description], @firstName As FirstName, @middleName As MiddleName, @lastName As LastName, @emailId As EmailId, 
	@userType As UserType, @agentId as Agent_ID, @active as [Active];
End

GO
/****** Object:  StoredProcedure [dbo].[uspFetchCampaignBasicDetails]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec [dbo].[uspFetchCampaignBasicDetails] 1
CREATE Procedure [dbo].[uspFetchCampaignBasicDetails] 
(
	@Campaign_ID bigint
)
As
Begin
	If Exists(Select 1 from dbo.Campaign_BasicDetails where Campaign_ID=@Campaign_ID)
	Begin
		Select Campaign_ID,Campaign_Name,Campaign_Type,Campaign_Brand,Wave,[Start_Date],Project_Owner,Stakeholder,Sample_Selection,Campaign_Recurrence_Type,Campaign_Recurrence_Pattern, expirydate  
		from dbo.Campaign_BasicDetails where Campaign_ID=@Campaign_ID
	End
End

GO
/****** Object:  StoredProcedure [dbo].[uspFetchCampaignFilter]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[uspFetchCampaignFilter]--35,'customer_list'
(
	@Campaign_ID bigint,
	@Type varchar(20)
)
As
Begin	
	--If Exists(Select 1 from dbo.Campaign_Filter where Campaign_ID=@Campaign_ID)
	--Begin		
	
	if(@Type='customer_list')--Customer List
	begin
		Declare @Customer_TableName varchar(200)='dbo.Campaign_Customers',@sql varchar(max),@Sample_Selection varchar(20),@Criteria_State varchar(200),@Criteria_Product varchar(200),@Criteria_Decile varchar(200), @Criteria_Tenure varchar(200), @where varchar(max)

		
		Select @Sample_Selection=Sample_Selection  from dbo.Campaign_BasicDetails where campaign_ID=@Campaign_ID

		Set @where=' Where 1=1'--c1.campaign_ID='+ CAST( @Campaign_ID as varchar(20))

		--print @Sample_Selection
		if(@Sample_Selection='SS002')
		Begin		
			Set @Customer_TableName='dbo.Campaign_SampleUploadedData'
			Set @where= @where+' and c2.campaign_ID='+ CAST( @Campaign_ID as varchar(20))
		End
		else
		Begin
		
		--Select @Customer_TableName=Customer_TableName,@Criteria_State=Criteria_State,@Criteria_Product=Criteria_Product,@Criteria_Decile=Criteria_Decile,@Criteria_Tenure=Criteria_Tenure  from dbo.Campaign_Filter where campaign_ID=@Campaign_ID

		select @Criteria_State=Criteria_State, 
		@Customer_TableName=lk.TxtVal,
		@Criteria_Tenure=(select ','+lk.TxtVal from dbo.CRM_LookupMaster as lk
			   where DataGroup='CMPGNTNRE' and ','+cf.Criteria_Tenure+',' like '%,'+lk.CodeVal+',%'
			   for xml path(''), type).value('substring(text()[1], 2)', 'varchar(max)'),
			   @Criteria_Decile=(select ','+lk.TxtVal from dbo.CRM_LookupMaster as lk
			   where DataGroup='CMPGNDECILE' and ','+cf.Criteria_Decile+',' like '%,'+lk.CodeVal+',%'
			   for xml path(''), type).value('substring(text()[1], 2)', 'varchar(max)'), 
				@Criteria_Product=(select ','+lk.TxtVal from dbo.CRM_LookupMaster as lk
			   where DataGroup='CMPGNPRD' and ','+cf.Criteria_Product+',' like '%,'+lk.CodeVal+',%'
			   for xml path(''), type).value('substring(text()[1], 2)', 'varchar(max)') 
		from dbo.Campaign_Filter as cf 
		left join dbo.CRM_LookupMaster lk on cf.Customer_TableName=lk.CodeVal and lk.DataGroup='CAMPAIGNTBLNM' 
		where Campaign_ID=@Campaign_ID

		
				if(@Criteria_State<>'' and @Criteria_State is not Null)
				Begin	
					--set @where= @where+' and Customer_State like (''%'+@Criteria_State+'%'')'
					set @where= @where+' and replace(replace(substring(Customer_State,len(Customer_State)-3,4),''('',''''),'')'','''') in(select [value] from string_split('''+@Criteria_State+''','',''))'
				end

				if(@Criteria_Product<>'' and @Criteria_Product is not Null)
				Begin	
					set @where= @where+' and Product in(select [value] from string_split('''+@Criteria_Product+''','',''))'
				end
		
				if(@Criteria_Decile<>'' and @Criteria_Decile is not Null)
				Begin	
					set @where= @where+' and Decile in(select [value] from string_split('''+@Criteria_Decile+''','',''))'			
				end

				if(@Criteria_Tenure<>'' and @Criteria_Tenure is not Null)
				Begin	
					set @where= @where+' and Tenure in(select [value] from string_split('''+@Criteria_Tenure+''','',''))'
				end
		end

		--print(@where)

		Set @sql= 'Select '+CAST(@Campaign_ID as varchar(10))+' as [Campaign_ID], [Customer_ID], [Customer_Name], [Customer_Address1], [Customer_City], [Customer_State], [Customer_Zipcode], [Customer_Phone], [Customer_Email], [Customer_Type], [OptIn], [Product], [Decile],  [Tenure],Customer_Type as CustomerTypeText from  '+ @Customer_TableName+ ' c2  '+ @where--inner join dbo.CRM_LookupMaster c3 on c2.customer_type=c3.CodeVal and c3.DataGroup=''CUSTTYPE''  inner join dbo.CRM_LookupMaster c4 on c2.Tenure=c4.CodeVal and c4.DataGroup=''CMPGNTNRE'' '
		
		print(@sql)
		
		Exec(@sql)

		end
	else if(@Type='edit_filter_criteria')--Filter criteria
	begin
			Select [CampFilter_ID], [Campaign_ID], [Sample_Selection], [Customer_TableName], [Criteria_State], [Criteria_Product], [Criteria_Decile],  [Criteria_Tenure], Criteria_TargetVolume as TargetVolume	
		  from dbo.Campaign_Filter  where campaign_ID=@Campaign_ID
	end		
	else 
	begin		
		select CampFilter_ID, Campaign_ID, Sample_Selection,Criteria_State, cf.Criteria_TargetVolume as TargetVolume,lk.TxtVal as Customer_TableName,
		(select ','+lk.TxtVal from dbo.CRM_LookupMaster as lk
			   where DataGroup='CMPGNTNRE' and ','+cf.Criteria_Tenure+',' like '%,'+lk.CodeVal+',%'
			   for xml path(''), type).value('substring(text()[1], 2)', 'varchar(max)') as Criteria_Tenure,
			   (select ','+lk.TxtVal from dbo.CRM_LookupMaster as lk
			   where DataGroup='CMPGNDECILE' and ','+cf.Criteria_Decile+',' like '%,'+lk.CodeVal+',%'
			   for xml path(''), type).value('substring(text()[1], 2)', 'varchar(max)') as Criteria_Decile,
				(select ','+lk.TxtVal from dbo.CRM_LookupMaster as lk
			   where DataGroup='CMPGNPRD' and ','+cf.Criteria_Product+',' like '%,'+lk.CodeVal+',%'
			   for xml path(''), type).value('substring(text()[1], 2)', 'varchar(max)') 
			   as Criteria_Product
		from dbo.Campaign_Filter as cf 
		left join dbo.CRM_LookupMaster lk on cf.Customer_TableName=lk.CodeVal and lk.DataGroup='CAMPAIGNTBLNM' 
		where Campaign_ID=@Campaign_ID
	end
	--End
End

GO
/****** Object:  StoredProcedure [dbo].[uspFetchCustomerDetailsByCustDetailID]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspFetchCustomerDetailsByCustDetailID 2;
CREATE Procedure [dbo].[uspFetchCustomerDetailsByCustDetailID]
(
	@pCustDetailID bigint
)
As
Begin
	Select *, (B.LastName + ', ' + B.MiddleName + ' ' + B.FirstName) As LastAgent_Name  From dbo.Customer_Details A
	Inner Join dbo.Agent_Master B
	On A.LastAgent_ID = B.Agent_ID
	Where A.CustDetail_ID = @pCustDetailID;
End
GO
/****** Object:  StoredProcedure [dbo].[uspFetchEmailTemplate]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[uspFetchEmailTemplate] 
(
	@Campaign_Type varchar(10)
)
As
Begin
	
	If Exists(Select 1 from dbo.Email_Template where Campaign_Type=@Campaign_Type)
	Begin
		Select Template_Content
		from dbo.Email_Template where Campaign_Type=@Campaign_Type
	End
End
GO
/****** Object:  StoredProcedure [dbo].[uspFetchInteractionsForLead]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspFetchInteractionsForLead 2
--exec dbo.uspFetchInteractionsForLead 15
--exec dbo.uspFetchInteractionsForLead 53
CREATE Procedure [dbo].[uspFetchInteractionsForLead]
(
	@pCustLeadID bigint,
	@pLimit int=5,
	@pStart int=0
)
As
Begin
	Declare @sqlQry nvarchar(1000);
	Set @sqlQry = 
	'Select TotalRecords=COUNT(CallInteraction_ID) OVER(),* From dbo.Call_Interactions Where CustLead_ID=' + CAST(@pCustLeadID as varchar(5)) + ' Order By CallInteraction_ID Desc ' + 
	'Offset ' + CAST(@pStart As varchar(5)) + ' Rows Fetch Next ' + CAST(@pLimit As varchar(5)) + ' Rows Only';
	Print @sqlQry;    
	EXECUTE sp_executesql @sqlQry;
End

--Select * From dbo.CRM_LookupMaster
--Select * From dbo.Customer_Leads Order By CustLead_ID Desc
--Select * From dbo.Call_Interactions Order By CallInteraction_ID Desc
GO
/****** Object:  StoredProcedure [dbo].[uspFetchLeadByLeadId]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspFetchLeadByLeadId 6
--exec dbo.uspFetchLeadByLeadId 20
CREATE Procedure [dbo].[uspFetchLeadByLeadId]
(
	@pCustLeadID bigint
)
As
Begin
	--Select A.CustLead_ID, B.FirstName As CustomerFirstName, B.MiddleName As CustomerMiddleName, B.LastName As CustomerLastName, B.Zip, 
	--A.BrandID, A.CustDetail_ID, A.ContactID, A.Source_TFN, A.AgentMaster_ID, A.AgentName, A.PreIssueType, A.IssueType, A.PreIssueID, A.IssueID, A.PreIssueSubID, A.SubIssueID,
	--A.PrevCaseStatusID, A.CaseStatusID, C.TxtVal As [CaseStatusCode], A.CreatedDate, A.LastUpdate, A.PrevTier, A.Notes, A.Tier, A.AssignedAgent_ID, 
	--A.PriorityID, A.ClassificationID, A.Urgency, A.ImpactID, A.CaseType, A.RuleTicker, A.Session_ID, A.EnrolledMedicareAB, A.MedicareCVG6mt, A.MedicareCVG6MT_Date
	--From dbo.Customer_Leads A
	--Inner Join dbo.Customer_Details B
	--On A.CustDetail_ID = B.CustDetail_ID 
	--And A.CustLead_ID=@pCustLeadID--;
	--Inner Join dbo.CRM_LookupMaster C
	--On A.CaseStatusCode = C.CodeVal
	--And C.DataGroup = 'OpenClosed'
	Select A.CustLead_ID, B.FirstName As CustomerFirstName, B.MiddleName As CustomerMiddleName, B.LastName As CustomerLastName, B.Zip As CustomerAddressZip, 
	A.BrandID, A.CustDetail_ID, A.ContactID, A.Source_TFN, A.AgentMaster_ID, A.AgentName, A.PreIssueType, A.IssueType, A.PreIssueID, A.IssueID, A.PreIssueSubID, A.SubIssueID,
	A.PrevCaseStatusID, A.CaseStatusID, A.CaseStatusCode, C.TxtVal As CaseStatusText, 
	A.CreatedDate, A.LastUpdate, A.PrevTier, A.Notes, A.Tier, A.AssignedAgent_ID, 
	A.PriorityID, A.ClassificationID, A.Urgency, A.ImpactID, A.CaseType, A.RuleTicker, A.Session_ID, A.EnrolledMedicareAB, A.MedicareCVG6mt, A.MedicareCVG6MT_Date
	From dbo.Customer_Leads A
	Inner Join dbo.Customer_Details B
	On A.CustDetail_ID = B.CustDetail_ID 
	And A.CustLead_ID=@pCustLeadID--;
	Inner Join dbo.CRM_LookupMaster C
	On A.CaseStatusCode = C.CodeVal
	And C.DataGroup = 'OpenClosed';
End
GO
/****** Object:  StoredProcedure [dbo].[uspFetchLeadsAndInteractionsForCustomer]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext uspFetchLeadsAndInteractionsForCustomer

--exec dbo.uspFetchLeadsAndInteractionsForCustomer 2, 5, 0
--exec dbo.uspFetchLeadsAndInteractionsForCustomer 3, 5, 0
CREATE Procedure [dbo].[uspFetchLeadsAndInteractionsForCustomer]
(
	@pCustDetailID bigint,
	@pLimit int,
	@pStart int
)
As
Begin
	Create Table dbo.#tblLeadAndInteractions(CustLead_ID bigint, CaseCreatedDate datetime, CaseLastUpdated datetime, CaseStatusCode varchar(10), CallInteractionCount int);

	Insert Into dbo.#tblLeadAndInteractions 
	Select A.CustLead_ID, A.CreatedDate As CaseCreatedDate, A.LastUpdate As CaseLastUpdated, A.CaseStatusCode, NULL
	From dbo.Customer_Leads A 
	Where A.CustDetail_ID = @pCustDetailID;

	--Select * From dbo.#tblLeadAndInteractions;

	Create Table dbo.#tblInteractionCountByLead(CustLead_ID bigint, CallInteractionCount int);

	Insert Into dbo.#tblInteractionCountByLead
	Select C.CustLead_ID, COUNT(B.CallInteraction_ID) As CallInteractionCount
	From dbo.#tblLeadAndInteractions C
	Left Join dbo.Call_Interactions B
	On C.CustLead_ID = B.CustLead_ID 
	Group By C.CustLead_ID;

	Update A1
	Set A1.CallInteractionCount = A2.CallInteractionCount 
	From dbo.#tblLeadAndInteractions A1
	Inner Join dbo.#tblInteractionCountByLead A2
	On A1.CustLead_ID = A2.CustLead_ID;

	--Select * From dbo.#tblInteractionCountByLead;
	--IF EXISTS(Select 1 From dbo.#tblInteractionCountByLead)
	--Begin
	--	Update A1
	--	Set A1.CallInteractionCount = A2.CallInteractionCount 
	--	From dbo.#tblLeadAndInteractions A1
	--	Inner Join dbo.#tblInteractionCountByLead A2
	--	On A1.CustLead_ID = A2.CustLead_ID;
	--End
	--Else
	--Begin
	--	Update A1
	--	Set A1.CallInteractionCount = 0 
	--	From dbo.#tblLeadAndInteractions A1
	--End

	--Select * From dbo.#tblInteractionCountByLead; 
	--Select 1,CallInteractionCount From dbo.#tblInteractionCountByLead; 
	--Where CallInteractionCount IS NULL;

	--IF EXISTS(Select 1 From dbo.#tblInteractionCountByLead Where CallInteractionCount IS NULL)
	--Begin
	--	Update dbo.#tblLeadAndInteractions
	--	Set CallInteractionCount = 0
	--	Where CallInteractionCount Is Null;
	--End

	Select CustDetail_ID, FirstName, LastName, Zip From dbo.Customer_Details Where CustDetail_ID=@pCustDetailID;

	Declare @sqlQry nvarchar(1000);

	Set @sqlQry = 
	'Select TotalCount=COUNT(CustLead_ID) OVER(),* From dbo.#tblLeadAndInteractions ' + 
	'Order By CaseCreatedDate Desc, CaseLastUpdated Desc ' + 
	'Offset ' + CAST(@pStart As varchar(5)) + ' Rows Fetch Next ' + CAST(@pLimit As varchar(5)) + ' Rows Only';
	Print @sqlQry;    
	EXECUTE sp_executesql @sqlQry;

	Set @sqlQry = 
	'Select TotalCount=COUNT(B.CustLead_ID) OVER(),B.CustLead_ID, B.CallInteraction_ID ' +
	'From dbo.Call_Interactions B ' + 
	'Inner Join dbo.#tblLeadAndInteractions C ' + 
	'On B.CustLead_ID = C.CustLead_ID ' + 
	'Order By C.CustLead_ID Desc, CallInteraction_ID Desc ' + 
	'Offset ' + CAST(@pStart As varchar(5)) + ' Rows Fetch Next ' + CAST(@pLimit As varchar(5)) + ' Rows Only';
	Print @sqlQry;    
	EXECUTE sp_executesql @sqlQry;
	
	Drop Table dbo.#tblLeadAndInteractions;
	Drop Table dbo.#tblInteractionCountByLead;
End
GO
/****** Object:  StoredProcedure [dbo].[uspFetchLeadsByCustIds]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspFetchLeadsByCustIds '1,2,3', 1, '1'
CREATE Procedure [dbo].[uspFetchLeadsByCustIds]
(
	@pCustDetail_IDs varchar(100),
	@pShowOpenCasesOnly bit NULL,
	@pAgentIDs varchar(100) NULL
)
As
Begin
	Declare @sqlQry nvarchar(1000);
	Set @sqlQry = 'Select A.*,B.Source_tfn as Source_TFN_Number,B.Source_Campaign From dbo.Customer_Leads A ' +
	'Inner Join dbo.Campaign_Details B On ' + 
	'A.Source_TFN=B.Campaign_id ' + 
	'Where A.CustDetail_ID In ' + '(' + @pCustDetail_IDs + ')';
	If (@pShowOpenCasesOnly IS NOT NULL)
	Begin
		If (@pShowOpenCasesOnly=1)
		Begin
			Set @sqlQry += ' And A.CaseStatusCode=''OC001''';
		End
	End
	if (@pAgentIDs IS NOT NULL)
	Begin
		Set @sqlQry += ' And A.AgentMaster_ID In ' + '(' + @pAgentIDs  + ')';
	End
	print @sqlQry;
	EXECUTE sp_executesql @sqlQry;
End
GO
/****** Object:  StoredProcedure [dbo].[uspFetchPlanDetailsByQuoteID]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspFetchPlanDetailsByQuoteID 1
CREATE Procedure [dbo].[uspFetchPlanDetailsByQuoteID]
(
	@pQuoteID bigint
)
As
Begin
	Select A.Plan_ID, A.Plan_Name, A.Quoted_PlanType As Plan_Type, A.Carrier, B.ContractNumber, B.PBPNumber From dbo.Customer_Quotation A
	Inner Join dbo.PlanMaster B
	On A.Plan_ID=B.Id
	And A.CustQuote_ID = @pQuoteID;
End
GO
/****** Object:  StoredProcedure [dbo].[uspFetchPlans]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspFetchPlans NULL, NULL, NULL, NULL, NULL, NULL, NULL;
--exec dbo.uspFetchPlans 'Id, PlanName', NULL, NULL, NULL, NULL, NULL, NULL;
--exec dbo.uspFetchPlans 'Id, PlanName', -1, NULL, NULL, NULL, NULL, NULL;
--exec dbo.uspFetchPlans 'Id, PlanName, Product, ContractNumber, PBPNumber', 17, NULL, NULL, NULL, NULL, NULL;
 Create Procedure [dbo].[uspFetchPlans]
 (
	@pColumnNames varchar(100) NULL,
	@pPlanID int NULL,
	@pPlanIDs varchar(50),
	@pPlanName varchar(100) NULL,
	@pProduct varchar(20) NULL,
	@pContractNumber varchar(20) NULL,
	@pPBPnumber varchar(20) NULL
 )
 As
 Begin
	Declare @sqlStatement nvarchar(4000), @whereClause nvarchar(500);
	Set @whereClause = '';

	Set @sqlStatement = 'Select * From dbo.PlanMaster';
	IF (@pColumnNames IS NOT NULL)
	Begin
		Set @sqlStatement = 'Select ' + @pColumnNames + ' From dbo.PlanMaster';
	End
	
	IF (@pPlanID IS NOT NULL And @pPlanID > -1)
	Begin
		Set @whereClause += ' Id=' + Cast(@pPlanID as varchar);
	End
	Else IF (@pPlanIDs IS NOT NULL And LTRIM(RTRIM(@pPlanIDs)) <> '')
	Begin
		Set @whereClause += ' Id In (' + @pPlanIDs + ')';
	End
	
	IF (@pPlanName IS NOT NULL And LTRIM(RTRIM(@pPlanName)) <> '')
	Begin
		IF (@whereClause IS NOT NULL OR @whereClause <> '')
		Begin
			Set @whereClause += ' And ';
		End
		Set @whereClause += ' PlanName like ''%' + @pPlanName + '%''';
	End

	IF (@pProduct IS NOT NULL And LTRIM(RTRIM(@pProduct)) <> '')
	Begin
		IF (@whereClause IS NOT NULL OR @whereClause <> '')
		Begin
			Set @whereClause += ' And ';
		End
		Set @whereClause += ' Product like ''%' + @pProduct + '%''';
	End

	IF (@pContractNumber IS NOT NULL And LTRIM(RTRIM(@pContractNumber)) <> '')
	Begin
		IF (@whereClause IS NOT NULL OR @whereClause <> '')
		Begin
			Set @whereClause += ' And ';
		End
		Set @whereClause += ' ContractNumber like ''%' + @pContractNumber + '%''';
	End

	IF (@pPBPnumber IS NOT NULL And LTRIM(RTRIM(@pPBPnumber)) <> '')
	Begin
		IF (@whereClause IS NOT NULL OR @whereClause <> '')
		Begin
			Set @whereClause += ' And ';
		End
		Set @whereClause += ' PBPNumber like ''%' + @pPBPnumber + '%''';
	End
	print @whereClause;
	IF (@whereClause IS NOT NULL And LTRIM(RTRIM(@whereClause)) <> '')
	Begin
		Set @sqlStatement += ' Where' + @whereClause;
	End

	Print @sqlStatement;

	EXECUTE sp_executesql @sqlStatement;
 End

GO
/****** Object:  StoredProcedure [dbo].[uspFetchQuoteDetailByQuoteId]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspFetchQuoteDetailByQuoteId 1
Create Procedure [dbo].[uspFetchQuoteDetailByQuoteId]
(
	@pCustQuoteID bigint
)
As
Begin
	Select * From dbo.Customer_Quotation Where CustQuote_ID=@pCustQuoteID;
End
GO
/****** Object:  StoredProcedure [dbo].[uspGetAgentInfo]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec dbo.uspGetAgentInfo 1, NULL;
--Exec dbo.uspGetAgentInfo NULL, 'Agent_ID=2';
--Exec dbo.uspGetAgentInfo NULL, NULL;
CREATE Procedure [dbo].[uspGetAgentInfo]
(
	@pAgentID varchar(20) NULL,
	@pWhere varchar(1000) NULL
)
As
Begin
	If (@pAgentID IS NOT NULL AND TRIM(@pAgentID)<>'')
	Begin
		Select * From dbo.Agent_Master Where Agent_ID=@pAgentID;
	End
	Else If (@pWhere IS NOT NULL AND TRIM(@pWhere)<>'')
	Begin
		Declare @pSQL nvarchar(max);
		Set @pSQL = 'Select * From dbo.Agent_Master Where ' + @pWhere;
		EXECUTE sp_executesql @pSQL;
	End
	Else
	Begin
		Select * From dbo.Agent_Master;
	End
End

GO
/****** Object:  StoredProcedure [dbo].[uspGetCallbackData]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext uspGetCallbackData

/*
Declare @searchParam Xml;
Set @searchParam = 
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustDtlSrchPrm1</ParamGroup><ParamCode>C001</ParamCode><ParamVal>9988776655</ParamVal></SearchParams></ArrayOfSearchParams>';
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustDtlSrchPrm3</ParamGroup><ParamCode>C007</ParamCode><ParamVal>3</ParamVal></SearchParams></ArrayOfSearchParams>';
--exec [dbo].[uspGetTableData] 'MdlCde2TblNme', 'M001', NULL, 10, NULL, 0, @searchParam, 0
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm1</ParamGroup><ParamCode>CL001</ParamCode><ParamVal>3</ParamVal></SearchParams></ArrayOfSearchParams>';
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm1</ParamGroup><ParamCode>CL001</ParamCode><ParamVal>3,4,5</ParamVal></SearchParams></ArrayOfSearchParams>';
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm1</ParamGroup><ParamCode>CL002</ParamCode><ParamVal>1</ParamVal></SearchParams></ArrayOfSearchParams>'
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CallInterctnSrchPrm1</ParamGroup><ParamCode>C001</ParamCode><ParamVal>2</ParamVal></SearchParams></ArrayOfSearchParams>'
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CallInterctnSrchPrm2</ParamGroup><ParamCode>C002</ParamCode><ParamVal>4</ParamVal></SearchParams></ArrayOfSearchParams>'
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm1</ParamGroup><ParamCode>CL002</ParamCode><ParamVal>4</ParamVal></SearchParams></ArrayOfSearchParams>'
--'<ArrayOfSearchParams><SearchParams><ParamGroup>SchedlclbckPrm3</ParamGroup><ParamCode>SC006</ParamCode><ParamVal>1</ParamVal></SearchParams></ArrayOfSearchParams>';
--exec [dbo].[uspGetCallbackData] NULL, 10, NULL, 0, @searchParam, 0;
'<ArrayOfSearchParams><SearchParams><ParamGroup>SchedlclbckPrm3</ParamGroup><ParamCode>SC006</ParamCode><ParamField>AgentMaster_ID</ParamField><ParamVal>1</ParamVal></SearchParams><SearchParams><ParamGroup>SchedlclbckPrm2</ParamGroup><ParamCode>SC005</ParamCode><ParamVal>61</ParamVal></SearchParams></ArrayOfSearchParams>';
exec [dbo].[uspGetCallbackData] NULL, 10, NULL, 0, @searchParam, 0;
*/
CREATE Procedure [dbo].[uspGetCallbackData] 
	@pOrderColumn  int = NULL,      
	@pLimit  int,      
	@pOrderDir  varchar(20) = NULL,      
	@pStart  int,      
	@pSearchKey Xml,    
	@pNeedPaging bit = 0
as       
BEGIN 
	--Set @limit = 1;
	Declare @columnForCount varchar(50), @orderByColumns varchar(200);

	Declare @tableName varchar(100);
	Set @tableName = '';

	Select @tableName = FieldName From dbo.CRM_LookupMaster 
	Where DataGroup='MdlCde2TblNme' And CodeVal='M004';

	Set @columnForCount = 'A.ScheduledCallback_ID';
	Set @orderByColumns = 'A.ScheduledCallback_ID Desc';

	Declare @to as int = @pStart+@pLimit;
	Declare @sqlStatement as nvarchar(4000);

	If (@pNeedPaging = 1)
	Begin
		Set @sqlStatement =     
		'Select TotalCount = COUNT(c.' + @columnForCount + ') OVER()' --, c.* from dbo.[' + @tableName + '] c ';
	End
	Else
	Begin
		Set @sqlStatement = 'Select ';
	End

	Set @sqlStatement += 
	'D.FirstName As CustomerFirstName, D.MiddleName As CustomerMiddleName, D.LastName As CustomerLastName, D.Zip As CustomerAddressZip, 
	D.Medicare_Number As CustomerMedicareNumber, B.PlanName, C.CustLead_ID, D.CustDetail_ID, A.*  
	From dbo.Scheduled_Callbacks A
	Inner Join dbo.Call_Interactions B
	On A.CallInteraction_ID=B.CallInteraction_ID
	Inner Join dbo.Customer_Leads C
	On B.CustLead_ID=C.CustLead_ID
	And C.CaseStatusCode=''OC001''
	Inner Join dbo.Customer_Details D
	On C.CustDetail_ID=D.CustDetail_ID '

	Create Table dbo.#tblSearchParams
	(
		ParamGroup varchar(50),
		ParamCode varchar(50),
		ParamField varchar(50),
		ParamVal varchar(100),
		FinalParam varchar(100)
	);
	Insert Into dbo.#tblSearchParams
	Select 
		cast(colx.query('data(ParamGroup) ') as varchar) As ParamGroup,
		cast(colx.query('data(ParamCode) ') as varchar) As ParamCode,
		NULL as ParamField,
		cast(colx.query('data(ParamVal) ') as varchar) As ParamVal,
		NULL as FinalParam
	From @pSearchKey.nodes('ArrayOfSearchParams/SearchParams') as Tabx(colx);

	Update t_SP 
	Set ParamField = FieldName
	From dbo.#tblSearchParams t_SP
	Inner Join dbo.CRM_LookupMaster C_LM
	On t_SP.ParamGroup = C_LM.DataGroup
	And t_SP.ParamCode = C_LM.CodeVal

	IF EXISTS(Select 1 From dbo.#tblSearchParams Where ParamGroup In ('SchedlclbckPrm1','SchedlclbckPrm2','SchedlclbckPrm3') And ParamCode In ('SC001','SC002','SC005','SC006'))
	Begin
		Update dbo.#tblSearchParams
        Set FinalParam = 'A.' + ParamField  + '>=' + '''' + ParamVal   + '''' where ParamGroup='SchedlclbckPrm1' And ParamCode='SC001';

		Update dbo.#tblSearchParams
        Set FinalParam = 'A.' + ParamField + '<=' + '''' + ParamVal + '''' where ParamGroup='SchedlclbckPrm1' And ParamCode='SC002';

		Update dbo.#tblSearchParams
        Set FinalParam = 'A.' + ParamField + '=' + ParamVal where ParamGroup='SchedlclbckPrm3' And ParamCode='SC006';

		Update dbo.#tblSearchParams
        Set FinalParam = 'A.' + ParamField + '=' + ParamVal where ParamGroup='SchedlclbckPrm2' And ParamCode='SC005';
	End
	Else
	Begin
		Update dbo.#tblSearchParams
		Set FinalParam = 'A.' + ParamField + '=' + '''' + ParamVal + '''';
	End

	--Select * From dbo.#tblSearchParams;

	Declare @where nVarchar(1000);
	Select @where = coalesce(@where + ' And ', '') +  convert(varchar(50), FinalParam)
	from dbo.#tblSearchParams;
	--order by col

	IF (LTRIM(RTRIM(@where)) <> '')    
	Begin    
		Set @sqlStatement += (' Where (' + @where + ')');    
	End    

	Set @sqlStatement += ' order by ' + @orderByColumns + ' ';

	IF (@pLimit > 0) 
	Begin    
		Set @sqlStatement += ' OFFSET ' + CAST(@pStart As varchar(5)) + ' ROWS FETCH NEXT ' + CAST(@pLimit As varchar(5)) + ' ROWS ONLY';
	End    

	Print @sqlStatement;    

	Drop Table dbo.#tblSearchParams;

	EXECUTE sp_executesql @sqlStatement    
End 
GO
/****** Object:  StoredProcedure [dbo].[uspGetCallInteractionData]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
--EXEC [dbo].[uspGetCallInteractionData] 'abc','de',null
 
CREATE procedure [dbo].[uspGetCallInteractionData] 
      @pFirstName varchar(100),
      @pLastName varchar(100),
      @pDOB date      
As       
BEGIN 
      SELECT CD.CustDetail_ID
      ,CD.FirstName
      ,CD.LastName
      ,CD.DOB
      FROM Customer_Details CD
      join Customer_Leads CL
      ON CD.CustDetail_ID = CL.CustDetail_ID
      join Call_Interactions CI 
      ON CL.CustLead_ID = CI.CustLead_ID
      WHERE 
      (CD.FirstName like '%' +@pFirstName + '%' OR @pFirstName is null )
      AND (CD.LastName like '%' +@pLastName + '%' OR @pLastName is null) 
      AND (CD.DOB = @pDOB OR @pDOB is null)
End 

GO
/****** Object:  StoredProcedure [dbo].[uspGetCampaignConfiguration]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec uspGetCampaignConfiguration 'Benefits Overview'

 CREATE Procedure [dbo].[uspGetCampaignConfiguration]
 (
	@Campaign_Name varchar(100)
 )
 As
 Begin

  Select Appointment_ID, cr.Phone as Customer_Phone,
  (cr.FirstName+' '+ cr.MiddleName+' '+ cr.LastName) as Customer_Name,
  ar.Appointment_Datetime as Appointment_Schedule,
  ar.Reminder_Datetime as Reminder_Schedule,
  COALESCE(cr.Email,'') as Email_ID,
  COALESCE(CR.ContactPreference_Email,0) AS Email,
  COALESCE(cr.ContactPreference_Text,0) AS SMS
  from dbo.Appointment_Reminder  ar inner join dbo.Customer_Details
   cr on ar.Customer_ID=cr.CustDetail_ID
   where Campaign_Name=@Campaign_Name
 End
 
GO
/****** Object:  StoredProcedure [dbo].[uspGetEmailForCampaignCustomer]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspGetEmailForCampaignCustomer 'CT001', 1;
CREATE Procedure [dbo].[uspGetEmailForCampaignCustomer]
(
	@pCampaignType varchar(10),
	@pCampaignId int
)
As
Begin
	Select A.Template_Content As MailBody,C.TxtVal As Brand from dbo.Email_Template A
	Inner Join dbo.Campaign_BasicDetails B
	On A.Campaign_Type=B.Campaign_Type
	Inner Join dbo.CRM_LookupMaster C
	On B.Campaign_Brand=C.CodeVal
	And C.DataGroup='CMPGNBRANDS'
	where A.Campaign_Type=@pCampaignType And B.Campaign_ID=@pCampaignId;
	--Select * From dbo.Campaign_BasicDetails A
	--Inner Join dbo.CRM_LookupMaster B
	--On A.Campaign_Type=B.CodeVal
	--And B.DataGroup='CMPGNTYP'
	--Inner Join dbo.CRM_LookupMaster C
	--On A.Sample_Selection=C.CodeVal
	--And C.DataGroup='CMPGNSMPLSEL'
	
	--Where A.Campaign_ID=@pCampaignId;
End
GO
/****** Object:  StoredProcedure [dbo].[uspGetInteractionByInteractionId]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspGetInteractionByInteractionId 7
CREATE Procedure [dbo].[uspGetInteractionByInteractionId]
(
	@pCallInteractionID bigint
)
As
Begin
	Select B.PlanName As PlanNameFull,A.CallInteraction_ID,A.CustLead_ID,A.Contact_ID,A.CustDetail_ID,A.AgentMaster_ID,A.AgentName,A.InteractionDate,
	A.InteractionDuration,A.PrevIssueType,A.IssueType,A.PrevSubIssueID,A.SubIssueID,A.DispositionID,A.DispositionCode,A.PrevCaseStatusID,A.CaseStatusID,C.TxtVal As CaseStatusCode, --A.CaseStatusCode, 
	A.PrevTierID,A.TierID,A.TeleInteractionID,A.PlanId,A.PlanName,A.Product,A.ContractNumber,A.PBP_Number,A.Notify,A.[Priority],A.ImpactID,A.UrgencyID,
	A.ContactTypeID,A.ScheduledCallback_ID,A.Notes,A.FirstName,A.LastName,A.Phone,A.Zip,A.ZipCode,A.WebExOffered,A.WebExConsent,A.WebExMethod 
	From dbo.Call_Interactions A
	Inner Join dbo.PlanMaster B
	On Cast(A.PlanId as int) = B.Id
	Inner Join dbo.CRM_LookupMaster C
	On A.CaseStatusCode=C.CodeVal
	And C.DataGroup='OpenClosed'
	Where CallInteraction_ID = @pCallInteractionID;
End
GO
/****** Object:  StoredProcedure [dbo].[uspGetLandingPageStatsForAgent]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspGetLandingPageStatsForAgent 1
CREATE Procedure [dbo].[uspGetLandingPageStatsForAgent]
(
	@pAgentID bigint
)
As
Begin
	Declare @totalCalls float, @totalCalls_YTD float, @totalCalls_MTD float, @totalCalls_Last7days float, @totalCalls_Last3days float, @totalCalls_Today float, 
	@salesCalls float, @salesCalls_YTD float, @salesCalls_MTD float, @salesCalls_Last7days float, @salesCalls_Last3days float, @salesCalls_Today float, 
	@ma_YTD float, @ma_MTD float, @ma_Last7days float, @ma_Last3days float, @ma_Today float,
	@ms_YTD float, @ms_MTD float, @ms_Last7days float, @ms_Last3days float, @ms_Today float,
	@pdp_YTD float, @pdp_MTD float, @pdp_Last7days float, @pdp_Last3days float, @pdp_Today float,
	@anc_YTD float, @anc_MTD float, @anc_Last7days float, @anc_Last3days float, @anc_Today float;

	Select @totalCalls=Count(CallInteraction_ID) From dbo.Call_Interactions A Where AgentMaster_ID=@pAgentID;
	Select @salesCalls=Count(Sale_ID) From dbo.Sales A
	Inner Join dbo.Call_Interactions B
	On A.CallInteraction_ID=B.CallInteraction_ID
	And B.AgentMaster_ID=@pAgentID;

	--print Cast(@salesCalls as float)/Cast(@totalCalls as float);

	Select @totalCalls as Total_Submissions, @salesCalls as Calls_Handled, 
	(Case When @salesCalls=0 OR @totalCalls=0 Then 0 Else @salesCalls/@totalCalls*100 End) as Conversion_Rate;

	--YTD stats
	Select @totalCalls_YTD=Count(CallInteraction_ID) From dbo.Call_Interactions A Where AgentMaster_ID=@pAgentID And Year(InteractionDate)=Year(GetDate());

	Select @salesCalls_YTD=Count(Sale_ID) From dbo.Sales A
	Inner Join dbo.Call_Interactions B
	On A.CallInteraction_ID=B.CallInteraction_ID
	And B.AgentMaster_ID=@pAgentID
	And Year(B.InteractionDate)=Year(GetDate());

	Select @ma_YTD=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MA'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Year(C.InteractionDate)=Year(GetDate());
	
	Select @ms_YTD=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MS'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Year(C.InteractionDate)=Year(GetDate());

	Select @pdp_YTD=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='PDP'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Year(C.InteractionDate)=Year(GetDate());

	Select @anc_YTD=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='ANC'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Year(C.InteractionDate)=Year(GetDate());

	Select @totalCalls_YTD as Total_Submissions_YTD, @salesCalls_YTD as Calls_Handled_YTD, 
	(Case When @salesCalls_YTD=0 OR @totalCalls_YTD=0 Then 0 Else @salesCalls_YTD/@totalCalls_YTD*100 End) as Conversion_Rate_YTD,
	@ma_YTD as MA_YTD, @ms_YTD as MS_YTD, @pdp_YTD as PDP_YTD, @anc_YTD as ANC_YTD;

	--MTD stats
	Select @totalCalls_MTD=Count(CallInteraction_ID) From dbo.Call_Interactions A 
	Where AgentMaster_ID=@pAgentID And Year(InteractionDate)=Year(GetDate()) And Month(InteractionDate)=Month(GetDate());

	Select @salesCalls_MTD=Count(Sale_ID) From dbo.Sales A
	Inner Join dbo.Call_Interactions B
	On A.CallInteraction_ID=B.CallInteraction_ID
	And B.AgentMaster_ID=@pAgentID
	And Year(B.InteractionDate)=Year(GetDate())
	And Month(B.InteractionDate)=Month(GetDate());

	Select @ma_MTD=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MA'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Year(C.InteractionDate)=Year(GetDate())
	And Month(C.InteractionDate)=Month(GetDate());
	
	Select @ms_MTD=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MS'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Year(C.InteractionDate)=Year(GetDate())
	And Month(C.InteractionDate)=Month(GetDate());

	Select @pdp_MTD=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='PDP'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Year(C.InteractionDate)=Year(GetDate())
	And Month(C.InteractionDate)=Month(GetDate());

	Select @anc_MTD=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='ANC'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Year(C.InteractionDate)=Year(GetDate())
	And Month(C.InteractionDate)=Month(GetDate());

	Select @totalCalls_MTD as Total_Submissions_MTD, @salesCalls_MTD as Calls_Handled_MTD, 
	(Case When @salesCalls_MTD=0 OR @totalCalls_MTD=0 Then 0 Else @salesCalls_MTD/@totalCalls_MTD*100 End) as Conversion_Rate_MTD,
	@ma_MTD as MA_MTD, @ms_MTD as MS_MTD, @pdp_MTD as PDP_MTD, @anc_MTD as ANC_MTD;

	Declare @todayDate date;
	Set @todayDate=Cast(GetDate() as date);

	--Last 7 days stats
	Declare @start_Last7Days date, @end_Last7Days date;
	Select @start_Last7Days=DateAdd(DAY, -7, @todayDate), @end_Last7Days=@todayDate;

	Select @totalCalls_Last7days=Count(CallInteraction_ID) From dbo.Call_Interactions A 
	Where AgentMaster_ID=@pAgentID And (Cast(InteractionDate as date)>=@start_Last7Days And Cast(InteractionDate as date)<=@end_Last7Days);

	Select @salesCalls_Last7Days=Count(Sale_ID) From dbo.Sales A
	Inner Join dbo.Call_Interactions B
	On A.CallInteraction_ID=B.CallInteraction_ID
	And B.AgentMaster_ID=@pAgentID
	And (Cast(B.InteractionDate as date)>=@start_Last7Days And Cast(B.InteractionDate as date)<=@end_Last7Days);

	Select @ma_Last7days=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MA'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And (Cast(C.InteractionDate as date)>=@start_Last7Days And Cast(C.InteractionDate as date)<=@end_Last7Days);
	
	Select @ms_Last7days=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MS'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And (Cast(C.InteractionDate as date)>=@start_Last7Days And Cast(C.InteractionDate as date)<=@end_Last7Days);

	Select @pdp_Last7days=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='PDP'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And (Cast(C.InteractionDate as date)>=@start_Last7Days And Cast(C.InteractionDate as date)<=@end_Last7Days);

	Select @anc_Last7days=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='ANC'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And (Cast(C.InteractionDate as date)>=@start_Last7Days And Cast(C.InteractionDate as date)<=@end_Last7Days);

	Select @totalCalls_Last7days as Total_Submissions_Last7Days, @salesCalls_Last7days as Calls_Handled_Last7Days, 
	(Case When @salesCalls_Last7days=0 OR @totalCalls_Last7days=0 Then 0 Else @salesCalls_Last7days/@totalCalls_Last7days*100 End) as Conversion_Rate_Last7Days, 
	@ma_Last7days as MA_Last7days, @ms_Last7days as MS_Last7days, @pdp_Last7days as PDP_Last7days, @anc_Last7days as ANC_Last7days;

	--Last 3 days stats
	Declare @start_Last3Days date, @end_Last3Days date;
	Select @start_Last3Days=DateAdd(DAY, -3, @todayDate), @end_Last3Days=@todayDate;

	Select @totalCalls_Last3Days=Count(CallInteraction_ID) From dbo.Call_Interactions A 
	Where AgentMaster_ID=@pAgentID And (Cast(InteractionDate as date)>=@start_Last3Days And Cast(InteractionDate as date)<=@end_Last3Days);

	Select @salesCalls_Last3Days=Count(Sale_ID) From dbo.Sales A
	Inner Join dbo.Call_Interactions B
	On A.CallInteraction_ID=B.CallInteraction_ID
	And B.AgentMaster_ID=@pAgentID
	And (Cast(B.InteractionDate as date)>=@start_Last3Days And Cast(B.InteractionDate as date)<=@end_Last3Days);

	Select @ma_Last3days=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MA'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And (Cast(C.InteractionDate as date)>=@start_Last3days And Cast(C.InteractionDate as date)<=@end_Last3days);
	
	Select @ms_Last3days=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MS'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And (Cast(C.InteractionDate as date)>=@start_Last3days And Cast(C.InteractionDate as date)<=@end_Last3days);

	Select @pdp_Last3days=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='PDP'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And (Cast(C.InteractionDate as date)>=@start_Last3days And Cast(C.InteractionDate as date)<=@end_Last3days);

	Select @anc_Last3days=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='ANC'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And (Cast(C.InteractionDate as date)>=@start_Last3days And Cast(C.InteractionDate as date)<=@end_Last3days);

	Select @totalCalls_Last3Days as Total_Submissions_Last3Days, @salesCalls_Last3Days as Calls_Handled_Last3Days, 
	(Case When @salesCalls_Last3Days=0 OR @totalCalls_Last3Days=0 Then 0 Else @salesCalls_Last3Days/@totalCalls_Last3Days*100 End) as Conversion_Rate_Last3Days,
	@ma_Last3days as MA_Last3days, @ms_Last3days as MS_Last3days, @pdp_Last3days as PDP_Last3days, @anc_Last3days as ANC_Last3days;

	--Today stats
	Select @totalCalls_Today=Count(CallInteraction_ID) From dbo.Call_Interactions A 
	Where AgentMaster_ID=@pAgentID And Cast(InteractionDate as date)=@todayDate;

	Select @salesCalls_Today=Count(Sale_ID) From dbo.Sales A
	Inner Join dbo.Call_Interactions B
	On A.CallInteraction_ID=B.CallInteraction_ID
	And B.AgentMaster_ID=@pAgentID
	And Cast(B.InteractionDate as date)=@todayDate;

	Select @ma_Today=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MA'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Cast(C.InteractionDate as date)=@todayDate;
	
	Select @ms_Today=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='MS'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Cast(C.InteractionDate as date)=@todayDate;

	Select @pdp_Today=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='PDP'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Cast(C.InteractionDate as date)=@todayDate;

	Select @anc_Today=Count(A.CustQuote_ID)
	From dbo.Customer_Quotation A
	Inner Join dbo.Sales B
	On A.CustQuote_ID=B.CustQuote_ID
	And A.Quoted_PolicyType='ANC'
	Inner Join dbo.Call_Interactions C
	On A.CallInteraction_ID=C.CallInteraction_ID
	And C.AgentMaster_ID=@pAgentID
	And Cast(C.InteractionDate as date)=@todayDate;

	Select @totalCalls_Today as Total_Submissions_Today, @salesCalls_Today as Calls_Handled_Today, 
	(Case When @salesCalls_Today=0 OR @totalCalls_Today=0 Then 0 Else @salesCalls_Today/@totalCalls_Today*100 End) as Conversion_Rate_Today,
	@ma_Today as MA_Today, @ms_Today as MS_Today, @pdp_Today as PDP_Today, @anc_Today as ANC_Today;
End
GO
/****** Object:  StoredProcedure [dbo].[uspGetLeads]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspGetLeads 'OC001'
CREATE Procedure [dbo].[uspGetLeads]
(
	@pCaseStatus varchar(10)
)
As
Begin
	Declare @sqlStatement as nvarchar(4000);
	Set @sqlStatement =     
	'Select TotalCount = COUNT(c.CustLead_ID) OVER(), d.FirstName as CustomerFirstName, d.MiddleName as CustomerMiddleName, d.LastName as CustomerLastName,'+ 
	'd.City as CustomerCity, d.State as CustomerState, d.Zip as CustomerAddressZip, ' + 
	'e.Source_campaign, ' + 
	'c.* from dbo.[Customer_Leads] c ' + 
	'Inner Join dbo.Customer_Details d ' + 
	'On c.CustDetail_ID=d.CustDetail_ID ' + 
	'Inner Join dbo.Campaign_Details e ' + 
	'On c.Source_TFN=e.Campaign_id ';
	
	Set @sqlStatement += ' Where c.CaseStatusCode=''' + @pCaseStatus + '''';

	Set @sqlStatement += ' Order By c.CreatedDate Desc';

	Set @sqlStatement += ' Offset 0 Rows Fetch Next 10 Rows Only';

	Print @sqlStatement;    
	EXECUTE sp_executesql @sqlStatement    
End
GO
/****** Object:  StoredProcedure [dbo].[uspGetLookupData]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[uspGetLookupData] 'MdlCde2TblNme', NULL, NULL, NULL, NULL, 1, 0
--exec [dbo].[uspGetLookupData] 'MdlCde2TblNme', NULL, NULL, NULL, NULL, 1, 1
--exec [dbo].[uspGetLookupData] 'MdlCde2TblNme', 'M001', NULL, NULL, NULL, 1, 0
--exec [dbo].[uspGetLookupData] 'CustDtlSrchPrm1', NULL, NULL, NULL, NULL, 1, 0
--exec [dbo].[uspGetLookupData] 'CustDtlSrchPrm2', NULL, NULL, NULL, NULL, 1, 0
--exec [dbo].[uspGetLookupData] 'Gender', NULL, NULL, NULL, NULL, 1, 0
CREATE Procedure [dbo].[uspGetLookupData]
(
	@pDataGroup varchar(50) NULL,
	@pCodeVal varchar(50) NULL,
	@pTxtVal varchar(100) NULL,
	@pModuleName varchar(100) NULL,
	@pFieldName varchar(100) NULL,
	@pActive bit NULL,
	@pSortData bit NULL
)
As
Begin
	Declare @sql nvarchar(1000);
	Set @sql = 'Select * From dbo.[CRM_LookupMaster]';

	Declare @where varchar(500);
	If (@pDataGroup IS NOT NULL AND LTRIM(RTRIM(@pDataGroup)) <> '')
	Begin
		Set @where = ' DataGroup Like ''%' + @pDataGroup + '%''';
	End
	If (@pCodeVal IS NOT NULL AND LTRIM(RTRIM(@pCodeVal)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' CodeVal Like ''%' + @pCodeVal + '%''';
	End
	If (@pTxtVal IS NOT NULL AND LTRIM(RTRIM(@pTxtVal)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' TxtVal Like ''%' + @pTxtVal + '%''';
	End
	If (@pModuleName IS NOT NULL AND LTRIM(RTRIM(@pModuleName)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' ModuleName Like ''%' + @pModuleName + '%''';
	End
	If (@pFieldName IS NOT NULL AND LTRIM(RTRIM(@pFieldName)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' FieldName Like ''%' + @pFieldName + '%''';
	End
	If (@pActive IS NOT NULL AND LTRIM(RTRIM(@pActive)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' Active=' + Cast(@pActive As varchar(10));
	End

	If (LTRIM(RTRIM(@where)) <> '')
	Begin
		Set @sql += ' Where' + @where;
	End

	If (@pSortData IS NOT NULL And LTRIM(RTRIM(@pSortData)) <> '' And @pSortData = 1)
	Begin
		Set @sql += ' Order By SortOrder';
	End

	Print @sql;

	EXECUTE sp_executesql @sql;
End

GO
/****** Object:  StoredProcedure [dbo].[uspGetLookupDataCustomerTable]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[uspGetLookupDataCustomerTable] 'CAMPAIGNTBLNM', NULL, NULL, NULL, NULL, 1, 0
CREATE Procedure [dbo].[uspGetLookupDataCustomerTable]
(
	@pDataGroup varchar(50) NULL,
	@pCodeVal varchar(50) NULL,
	@pTxtVal varchar(100) NULL,
	@pModuleName varchar(100) NULL,
	@pFieldName varchar(100) NULL,
	@pActive bit NULL,
	@pSortData bit NULL
)
As
Begin
	Declare @sql nvarchar(1000);
	Set @sql = 'Select * From dbo.[CRM_LookupMaster]';

	Declare @where varchar(500);
	If (@pDataGroup IS NOT NULL AND LTRIM(RTRIM(@pDataGroup)) <> '')
	Begin
		Set @where = ' DataGroup ='''+ @pDataGroup +''''
	End
	If (@pCodeVal IS NOT NULL AND LTRIM(RTRIM(@pCodeVal)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' CodeVal Like ''%' + @pCodeVal + '%''';
	End
	If (@pTxtVal IS NOT NULL AND LTRIM(RTRIM(@pTxtVal)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' TxtVal Like ''%' + @pTxtVal + '%''';
	End
	If (@pModuleName IS NOT NULL AND LTRIM(RTRIM(@pModuleName)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' ModuleName Like ''%' + @pModuleName + '%''';
	End
	If (@pFieldName IS NOT NULL AND LTRIM(RTRIM(@pFieldName)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' FieldName Like ''%' + @pFieldName + '%''';
	End
	If (@pActive IS NOT NULL AND LTRIM(RTRIM(@pActive)) <> '')
	Begin
		If (LTRIM(RTRIM(@where)) <> '')
		Begin
			Set @where += ' And';
		End
		Set @where += ' Active=' + Cast(@pActive As varchar(10));
	End

	If (LTRIM(RTRIM(@where)) <> '')
	Begin
		Set @sql += ' Where' + @where;
	End

	If (@pSortData IS NOT NULL And LTRIM(RTRIM(@pSortData)) <> '' And @pSortData = 1)
	Begin
		Set @sql += ' Order By SortOrder';
	End

	Print @sql;

	EXECUTE sp_executesql @sql;
End

GO
/****** Object:  StoredProcedure [dbo].[uspGetScheduledRecords]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec dbo.uspGetScheduledRecords null,null,null,null,'SRT001',null,10,null,0,1;
--Exec dbo.uspGetScheduledRecords null,null,null,null,'SRT002',null,10,null,0,1;
CREATE Procedure [dbo].[uspGetScheduledRecords]
(
	@pAppointmentDate_From date NULL,
	@pAppointmentDate_To date NULL,
	@pReminderDate_From date NULL,
	@pReminderDate_To date NULL,
	@pRecordType varchar(20),
	@pOrderColumn varchar(10) NULL,
	@pLimit int NULL,
	@pOrderDir varchar(10) NULL,
	@pStart int NULL,
	@pNeedPaging int NULL
)
As
Begin
	Declare @sqlQuery NVarchar(4000), @sqlColumns Varchar(500), @sqlWhere Varchar(1000), @sqlOrderBy Varchar(100), @tableName varchar(50), @sqlColumnForRowCount varchar(50);
	Select @sqlQuery = '', @sqlColumns = '', @sqlWhere = '', @sqlOrderBy = '', @sqlColumnForRowCount = '';
	Declare @projectOwnerUser varchar(100)='', @stakeholderUsers varchar(500)='';
	Declare @dropTempTable nvarchar(100)='DROP TABLE IF EXISTS dbo.##ScheduledRecords;';
	Declare @prefixToSqlQuery nvarchar(100)='Select * Into dbo.##ScheduledRecords From ';

	Declare @to as int = @pStart+@pLimit;

	Set @sqlColumns='c.*,(D.LastName + '', '' + D.FirstName) As Agent_Name';
	If (@pRecordType = 'SRT002')
	Begin
		Set @tableName='dbo.Scheduled_Callbacks';
		--Set @sqlColumns += ',(Cast(Cast(Callback_Date as date) as varchar) + '' '' + Cast(Cast(Callback_Time as time) as varchar)) As Callback_DateTime,(F.LastName + '', '' + F.FirstName) As Customer_Name,F.Phone As Customer_Phone,F.Email As Customer_Email,I.TxtVal As Reminder_Type ';
		Set @sqlColumns += ',(Cast(Cast(Callback_Date as date) as varchar) + '' '' + Cast(Cast(Callback_Time as time) as varchar)) As Callback_DateTime,(F.LastName + '', '' + F.FirstName) As Customer_Name,F.Phone As Customer_Phone,F.Email As Customer_Email,I.TxtVal As Reminder_Type_Txt ';
		Set @sqlColumnForRowCount = 'c.ScheduledCallback_ID';
	End
	Else If (@pRecordType = 'SRT001')
	Begin
		Set @tableName='dbo.Appointment_Reminder';
		Set @sqlColumns += ',E.TxtVal As Campaign_Type_String ';
		Set @sqlColumnForRowCount = 'c.Appointment_ID';
	End

	If (@pNeedPaging = 1)
	Begin
		Set @sqlQuery += 
		'Select TotalCount = COUNT(' + @sqlColumnForRowCount + ') OVER(), ' + @sqlColumns + 
		' From ' + @tableName + ' c ';
	End
	Else
	Begin
		Set @sqlQuery += 
		'Select ' + @sqlColumns + 
		' From ' + @tableName + ' c ';
	End

	If (@pRecordType = 'SRT002')
	Begin
		Set @sqlQuery += 
		'Inner Join dbo.Agent_Master D on c.AgentMaster_ID=D.Agent_ID ' + 
		'Inner Join dbo.Customer_Leads E On c.CustLead_ID=E.CustLead_ID ' + 
		--'Inner Join dbo.Call_Interactions G On E.CustLead_ID=G.CustLead_ID And G.CaseStatusCode=''OC001'' ' + 
		--'Inner Join dbo.PlanMaster H On G.PlanID=H.Id ' + 
		'Inner Join dbo.Customer_Details F on E.CustDetail_ID=F.CustDetail_ID ' + 
		'Inner Join dbo.CRM_LookupMaster I on F.ContactPreference=I.CodeVal And I.DataGroup=''ContactPref'' ';
		--Print '';
		Set @sqlOrderBy = ' Order By c.Callback_Date Desc, Callback_Time Desc';
	End
	Else If (@pRecordType = 'SRT001')
	Begin
		Set @sqlQuery += 
		'Inner Join dbo.Agent_Master D on c.Agent_ID=D.Agent_ID ' + 
		'Inner Join dbo.CRM_LookupMaster E On c.Campaign_Type=E.CodeVal And E.DataGroup=''CMPGNTYP'' ';
		Set @sqlOrderBy = ' Order By c.Reminder_Datetime Desc';
	End
	
	Declare @pAppointDateFrom_string varchar(100), @pAppointmentDateTo_string varchar(100);
	Select @pAppointDateFrom_string=TRIM(Cast(@pAppointmentDate_From As varchar)), @pAppointmentDateTo_string=TRIM(Cast(@pAppointmentDate_To As Varchar));
	If (@pAppointmentDate_From IS NOT NULL And @pAppointDateFrom_string <> '')
	Begin
		Set
			@sqlWhere += ' Appointment_Datetime>=' + Cast(@pAppointmentDate_From as Varchar);
	End
	If (@pAppointmentDate_To IS NOT NULL And @pAppointmentDateTo_string <> '')
	Begin
		If (TRIM(@sqlQuery) <> '')
		Begin
			Set
				@sqlWhere += ' And '
		End
		Set
			@sqlWhere += ' Appointment_Datetime<=' + Cast(@pAppointmentDate_To as Varchar);
	End

	If (Trim(@sqlWhere) <> '')
	Begin
		Set 
			@sqlQuery += @sqlWhere;
	End

	Set @sqlQuery += @sqlOrderBy;

	IF (@pLimit > 0) 
	Begin    
		Set @sqlQuery += ' OFFSET ' + CAST(@pStart As varchar(5)) + ' ROWS FETCH NEXT ' + CAST(@pLimit As varchar(5)) + ' ROWS ONLY';
	End 

	Set @sqlQuery = CONCAT(@prefixToSqlQuery, ' (', @sqlQuery, ') A');

	Print @dropTempTable;
	Print @sqlQuery;

	exec sp_executesql @dropTempTable;
	exec sp_executesql @sqlQuery;

	If (@pRecordType = 'SRT002')
	Begin
		--Declare @tempSql varchar(100)='Select * From dbo.#ScheduledRecords';
		--Exec(@tempSql); 
		Select * From dbo.##ScheduledRecords;
	End
	Else If (@pRecordType = 'SRT001')
	Begin
		Drop Table If Exists dbo.#NonLoggedInUsers;
		Select * Into dbo.#NonLoggedInUsers From
		(
		Select 1 As ID, G.Campaign_ID, G.Campaign_Type, (LastName + ', ' + FirstName) As UserName, UserType From dbo.Agent_Master F
		Inner Join Campaign_BasicDetails G On (F.Agent_ID=Cast(G.Project_Owner as bigint) OR F.Agent_ID IN (Select * From STRING_SPLIT(G.Stakeholder, ',')))
		Where F.UserType='Project Owner') A;

		--Select * From dbo.#NonLoggedInUsers;

		Insert Into dbo.#NonLoggedInUsers
		Select 2 As ID, G.Campaign_ID, G.Campaign_Type, (LastName + ', ' + FirstName) As UserName, UserType From dbo.Agent_Master F
		Inner Join Campaign_BasicDetails G On (F.Agent_ID=Cast(G.Project_Owner as bigint) OR F.Agent_ID IN (Select * From STRING_SPLIT(G.Stakeholder, ',')))
		Where F.UserType='Stakeholder';

		--Select * From dbo.#NonLoggedInUsers;

		Drop Table If Exists dbo.#CampaignOwners;
		Select * Into dbo.#CampaignOwners 
		From 
		(Select Campaign_ID, Campaign_Type, UserType, 
		STUFF((SELECT ', ' + ('(' + CAST(UserName AS VARCHAR(100)) + ')') [text()]
				FROM #NonLoggedInUsers 
				WHERE ID = t.ID And Campaign_ID=t.Campaign_ID 
				FOR XML PATH(''), TYPE)
			.value('.','NVARCHAR(MAX)'),1,2,'') UserNames
		From dbo.#NonLoggedInUsers t
		Group By ID, Campaign_ID, Campaign_Type, UserType) A;

		--Select * From dbo.#CampaignOwners;

		Drop Table If Exists dbo.#CampaignOwnerAndStakeholders;
		Select * Into dbo.#CampaignOwnerAndStakeholders
		From
		(
			Select Campaign_ID, Campaign_Type, 
			Max(Case When UserType='Project Owner' Then UserNames End) As Project_Owner,
			Max(Case When UserType='Stakeholder' Then UserNames End) As Stakeholder
			From dbo.#CampaignOwners
			Group By Campaign_ID, Campaign_Type
		) A;
		
		Select A.*, B.Project_Owner, B.Stakeholder 
		From dbo.##ScheduledRecords A
		Inner Join dbo.#CampaignOwnerAndStakeholders B
		On A.Campaign_ID=B.Campaign_ID;
		--And B.UserNames IS NOT NULL;
	End
End



GO
/****** Object:  StoredProcedure [dbo].[uspGetStateInfo]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[uspGetStateInfo]
As
Begin
	Select State_short, State_Full From dbo.ZipCityStateListForUS 
	order by State_Short asc
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetTableData]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext uspGetTableData



/*
Declare @searchParam Xml;
Set @searchParam = 
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustDtlSrchPrm1</ParamGroup><ParamCode>C001</ParamCode><ParamVal>9988776655</ParamVal></SearchParams></ArrayOfSearchParams>';
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustDtlSrchPrm3</ParamGroup><ParamCode>C007</ParamCode><ParamVal>3</ParamVal></SearchParams></ArrayOfSearchParams>';
--exec [dbo].[uspGetTableData] 'MdlCde2TblNme', 'M001', NULL, 10, NULL, 0, @searchParam, 0
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm1</ParamGroup><ParamCode>CL001</ParamCode><ParamVal>3</ParamVal></SearchParams></ArrayOfSearchParams>';
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm1</ParamGroup><ParamCode>CL001</ParamCode><ParamVal>3,4,5</ParamVal></SearchParams></ArrayOfSearchParams>';
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm1</ParamGroup><ParamCode>CL002</ParamCode><ParamVal>1</ParamVal></SearchParams></ArrayOfSearchParams>'
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CallInterctnSrchPrm1</ParamGroup><ParamCode>C001</ParamCode><ParamVal>2</ParamVal></SearchParams></ArrayOfSearchParams>'
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CallInterctnSrchPrm2</ParamGroup><ParamCode>C002</ParamCode><ParamVal>4</ParamVal></SearchParams></ArrayOfSearchParams>'
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm1</ParamGroup><ParamCode>CL002</ParamCode><ParamVal>4</ParamVal></SearchParams></ArrayOfSearchParams>'
--'<ArrayOfSearchParams><SearchParams><ParamGroup>CustDtlSrchPrm1</ParamGroup><ParamCode>C001</ParamCode><ParamVal>9</ParamVal></SearchParams><SearchParams><ParamGroup>CustDtlSrchPrm2</ParamGroup><ParamCode>C003</ParamCode><ParamVal>A</ParamVal></SearchParams><SearchParams><ParamGroup>CustDtlSrchPrm2</ParamGroup><ParamCode>C004</ParamCode><ParamVal>b</ParamVal></SearchParams><SearchParams><ParamGroup>CustDtlSrchPrm2</ParamGroup><ParamCode>C005</ParamCode><ParamVal>2022-10-03</ParamVal></SearchParams></ArrayOfSearchParams>';
'<ArrayOfSearchParams><SearchParams><ParamGroup>CustLdSrchPrm2</ParamGroup><ParamCode>CL003</ParamCode><ParamVal>OC001</ParamVal></SearchParams></ArrayOfSearchParams>'
exec [dbo].[uspGetTableData] 'MdlCde2TblNme', 'M002', NULL, 10, NULL, 0, @searchParam, 0;
*/
CREATE procedure [dbo].[uspGetTableData] 
	@pGroup varchar(100),
	@pCode varchar(100),
	@pOrderColumn  int = NULL,      
	@pLimit  int,      
	@pOrderDir  varchar(20) = NULL,      
	@pStart  int,      
	@pSearchKey Xml,    
	@pNeedPaging bit = 0
as       
BEGIN 
	--Set @limit = 1;
	Declare @columnForCount varchar(50), @orderByColumns varchar(200);

	Declare @tableName varchar(100);
	Set @tableName = '';

	Select @tableName = FieldName From dbo.CRM_LookupMaster 
	Where DataGroup=@pGroup And CodeVal=@pCode;

	IF ((lower(@tableName) = 'customer_details'))
	Begin

		Set @columnForCount = 'CustDetail_ID';
		Set @orderByColumns = 'c.CustDetail_ID Desc';
	End
	Else IF ((lower(@tableName) = 'customer_leads'))
	Begin

		Set @columnForCount = 'CustLead_ID';
		Set @orderByColumns = 'c.CustLead_ID Desc';
	End
	Else IF ((lower(@tableName) = 'call_interactions'))
	Begin

		Set @columnForCount = 'CallInteraction_ID';
		Set @orderByColumns = 'c.CallInteraction_ID Desc';
	End
	ELSE IF ((lower(@tableName) = 'scheduled_callbacks'))
	Begin

		Set @columnForCount = 'ScheduledCallback_ID';
		Set @orderByColumns = 'c.ScheduledCallback_ID Desc';
	End
	ELSE IF ((lower(@tableName) = 'campaign_details'))
	Begin

		Set @columnForCount = 'Campaign_ID';
		Set @orderByColumns = 'c.Campaign_ID Desc';
	End

	Declare @to as int = @pStart+@pLimit;
	Declare @sqlStatement as nvarchar(4000);

	If (@pNeedPaging = 1)
	Begin
		Set @sqlStatement =     
		'Select TotalCount = COUNT(c.' + @columnForCount + ') OVER(), c.* from dbo.[' + @tableName + '] c ';
	End
	Else
	Begin
		Set @sqlStatement = 'Select c.* from dbo.[' + @tableName + '] c ';
	End

	Create Table dbo.#tblSearchParams
	(
		ParamGroup varchar(50),
		ParamCode varchar(50),
		ParamField varchar(50),
		ParamVal varchar(100),
		FinalParam varchar(100)
	);
	Insert Into dbo.#tblSearchParams
	Select 
		cast(colx.query('data(ParamGroup) ') as varchar) As ParamGroup,
		cast(colx.query('data(ParamCode) ') as varchar) As ParamCode,
		NULL as ParamField,
		cast(colx.query('data(ParamVal) ') as varchar) As ParamVal,
		NULL as FinalParam
	From @pSearchKey.nodes('ArrayOfSearchParams/SearchParams') as Tabx(colx);

	Update t_SP 
	Set ParamField = FieldName
	From dbo.#tblSearchParams t_SP
	Inner Join dbo.CRM_LookupMaster C_LM
	On t_SP.ParamGroup = C_LM.DataGroup
	And t_SP.ParamCode = C_LM.CodeVal

	--Select * From dbo.#tblSearchParams;

	IF ((lower(@tableName) = 'customer_leads'))
	Begin
		Update dbo.#tblSearchParams
		Set FinalParam = ParamField + 
		--'=' + 
		(Case When ParamField = 'CustDetail_ID' Then ' In ' + '(' + ParamVal + ')' Else '=' + ('''' + ParamVal + '''') End); --+ 
		--'''' + ParamVal + '''';
	End
	ELSE IF ((lower(@tableName) = 'scheduled_callbacks'))
	Begin

		Update dbo.#tblSearchParams
        Set FinalParam = ParamField  + '>=' + '''' + ParamVal   + '''' where ParamCode='SC001';

		Update dbo.#tblSearchParams
        Set FinalParam = ParamField + '<=' + '''' + ParamVal + '''' where ParamCode='SC002';
	End
	Else
	Begin
		Update dbo.#tblSearchParams
		Set FinalParam = ParamField + '=' + '''' + ParamVal + '''';
	End

	--Select * From dbo.#tblSearchParams;

	Declare @where nVarchar(1000);
	Select @where = coalesce(@where + ' And ', '') +  convert(varchar(50), FinalParam)
	from dbo.#tblSearchParams;
	--order by col

	IF (LTRIM(RTRIM(@where)) <> '')    
	Begin    
		Set @sqlStatement += (' Where (' + @where + ')');    
	End    

	Set @sqlStatement += ' order by ' + @orderByColumns + ' ';

	IF (@pLimit > 0) 
	Begin    
		Set @sqlStatement += ' OFFSET ' + CAST(@pStart As varchar(5)) + ' ROWS FETCH NEXT ' + CAST(@pLimit As varchar(5)) + ' ROWS ONLY';
	End    

	Print @sqlStatement;    

	Drop Table dbo.#tblSearchParams;

	EXECUTE sp_executesql @sqlStatement    
End 


GO
/****** Object:  StoredProcedure [dbo].[uspGetZipInfo]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspGetZipInfo 11111, 0
--exec dbo.uspGetZipInfo 11111, 1
--5
--exec dbo.uspGetZipInfo 35999, 1
CREATE Procedure [dbo].[uspGetZipInfo]
(
	@pZipCode bigint NULL,
	@pTopOneResult bit NULL
)
As
Begin
	IF (@pZipCode IS NOT NULL)
	Begin
		IF (@pTopOneResult = 1)
		Begin
			Select Top 1 * From dbo.ZipCityStateListForUS Where @pZipCode Between ZipRange_From And ZipRange_To;
		End
		Else
		Begin
			Select * From dbo.ZipCityStateListForUS Where @pZipCode Between ZipRange_From And ZipRange_To;
		End
	End
	Else
	Begin
		IF (@pTopOneResult = 1)
		Begin
			Select Top 1 * From dbo.ZipCityStateListForUS;
		End
		Else
		Begin
			Select * From dbo.ZipCityStateListForUS;
		End
	End
End

GO
/****** Object:  StoredProcedure [dbo].[uspLogAppError]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[uspLogAppError] 

(@pSessionGUID Uniqueidentifier,

@pAppUrl Varchar(500),

@pExceptionArea Varchar(50),

@pExceptionMsg Nvarchar(MAX),

@pExceptionDetail Varchar(MAX),

@pAppName Varchar(50),

@pServerName Varchar(50)=NULL,

@pCreatedBy Varchar(100))

As

Begin

	Insert Into [dbo].[AppErrorLog](SessionGUID,AppUrl,ExceptionArea,ExceptionMsg,ExceptionDetail,AppName,ServerName,CreatedBy,CreatedOn)

	Values(@pSessionGUID,@pAppUrl,@pExceptionArea,@pExceptionMsg,@pExceptionDetail,@pAppName,@pServerName,@pCreatedBy,GETDATE());

End




GO
/****** Object:  StoredProcedure [dbo].[uspSaveCallInteraction]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Select * From dbo.Customer_Details;
--exec [dbo].[uspSaveCallInteraction] '<CallInteractions><CallInteraction_ID>3</CallInteraction_ID><CustLead_ID>2</CustLead_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentName>Chris</AgentName><InteractionDate>2022-12-01T10:24:45.2838815Z</InteractionDate><InteractionDateString>2022-12-01 10:24:45</InteractionDateString><InteractionDuration /><InteractionDurationString>00:03:37</InteractionDurationString><IssueCode>D001</IssueCode><IssueID>0</IssueID><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><TeleInteractionID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetails_ID>0</CustDetails_ID><FirstName>Abc</FirstName><LastName>Def</LastName><Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Zip>24801</Zip></CallInteractions>'
--exec [dbo].[uspSaveCallInteraction] '<CallInteractions><CallInteraction_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustLead_ID>0</CustLead_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentName>Cooper, Ryan </AgentName><InteractionDate>2022-12-22T12:45:35.0644902Z</InteractionDate><InteractionDateString>2022-12-22 12:45:35</InteractionDateString><InteractionDuration /><InteractionDurationString>00:01:31</InteractionDurationString><IssueCode>D001</IssueCode><IssueID>0</IssueID><PlanName>2</PlanName><Product>HMO</Product><ContractNumber>321</ContractNumber><PBP_Number>332</PBP_Number><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><TeleInteractionID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetails_ID>0</CustDetails_ID><Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CallInteractions>'
--exec [dbo].[uspSaveCallInteraction] '<CallInteractions><CallInteraction_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustLead_ID>6</CustLead_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentName>Cooper, Ryan </AgentName><InteractionDate>2022-12-22T20:29:31.2072323+05:30</InteractionDate><InteractionDateString>2022-12-22 20:29:31</InteractionDateString><InteractionDuration /><InteractionDurationString>00:00:23</InteractionDurationString><IssueCode>D001</IssueCode><IssueID>0</IssueID><PlanName>2</PlanName><Product>HMO</Product><ContractNumber>321</ContractNumber><PBP_Number>332</PBP_Number><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><TeleInteractionID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>24</CustDetail_ID><Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CallInteractions>'
--exec [dbo].[uspSaveCallInteraction] '<CallInteractions><CallInteraction_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustLead_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentName>Cooper, Ryan Reynolds</AgentName><InteractionDate>0001-01-01T00:00:00</InteractionDate><InteractionDateString>0001-01-01 00:00:00</InteractionDateString><InteractionDuration /><InteractionDurationString>14:45:44</InteractionDurationString><IssueCode>DS001</IssueCode><IssueID>0</IssueID><PlanName>3</PlanName><Product>HMO-POS</Product><ContractNumber>BACD4123EF5</ContractNumber><PBP_Number>B1A2C3D4E5F</PBP_Number><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><TeleInteractionID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>0</CustDetail_ID><Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CallInteractions>'
--exec [dbo].[uspSaveCallInteraction] '<CallInteractions><CallInteraction_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustLead_ID>1</CustLead_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentName>Cooper, Ryan Reynolds</AgentName><InteractionDate>2023-01-12T15:09:05.0947557+05:30</InteractionDate><InteractionDateString>2023-01-12 15:09:05</InteractionDateString><InteractionDuration /><InteractionDurationString>00:00:25</InteractionDurationString><IssueCode>DS001</IssueCode><IssueID>0</IssueID><PlanName>4</PlanName><Product>HMO-POS</Product><ContractNumber>BCDA4213FE5</ContractNumber><PBP_Number>C1A2B3D4E5F</PBP_Number><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><TeleInteractionID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>1</CustDetail_ID><Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CallInteractions>'
--exec [dbo].[uspSaveCallInteraction] '<CallInteractions><CallInteraction_ID>78</CallInteraction_ID><CustLead_ID>3</CustLead_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentName>Cooper, Ryan Reynolds</AgentName><InteractionDate>2023-02-27T22:58:21</InteractionDate><InteractionDateString>2023-02-27 22:58:21</InteractionDateString><InteractionDuration /><InteractionDurationString>22:45:45</InteractionDurationString><IssueCode>D004</IssueCode><IssueID>0</IssueID><PlanID>2</PlanID><PlanName /><Product>PPO</Product><ContractNumber>DCBA4321FE5</ContractNumber><PBP_Number>A5B4C3D2E1F</PBP_Number><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><TeleInteractionID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>2</CustDetail_ID><Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CallInteractions>'
CREATE Procedure [dbo].[uspSaveCallInteraction]
(
	@pCallInteraction Xml
)
As
Begin
	Begin Try
		Begin Tran;

		--print cast(@pCustLead as nvarchar(4000));

		Create Table dbo.#tblCallInteraction
		(
			CallInteraction_ID bigint NULL,
			CustLead_ID bigint NULL, 
			Contact_ID bigint NULL, 
			AgentMaster_ID bigint NULL, 
			AgentName varchar(50) NULL,
			InteractionDate datetime NULL, 
			InteractionDuration time NULL,
			PrevIssueType varchar(10) NULL, 
			IssueType varchar(10) NULL, 
			PrevSubIssueID varchar(10) NULL, 
			SubIssueID varchar(10) NULL, 
			DispositionID bigint NULL, 
			DispositionCode varchar(10) NULL, 
			PlanId varchar(20) NULL,
			PlanName varchar(50) NULL, 
			Product varchar(50) NULL,
			ContractNumber varchar(50) NULL,
			PBP_Number varchar(50) NULL, 
			PrevCaseStatusID varchar(10) NULL, 
			CaseStatusID int NULL, 
			CaseStatusCode varchar(10) NULL,
			PrevTierID varchar(10) NULL, 
			TierID varchar(50) NULL,
			TeleInteractionID bigint NULL, 
			ScheduledCallback_ID bigint NULL, 
			Notify varchar(50) NULL, 
			[Priority] varchar(50) NULL, 
			ImpactID varchar(50) NULL, 
			UrgencyID varchar(50) NULL, 
			ContactTypeID varchar(50) NULL, 
			Campaign_ID bigint NULL, 
			CustDetail_ID bigint NULL,
			FirstName varchar(50) NULL, 
			LastName varchar(50) NULL, 
			Phone float NULL, 
			Zip varchar(20) NULL,
			Notes varchar(1000) NULL
		);

		--Select 
		--	Cast(Cast(colx.query('data(InteractionDurationString)') as Varchar) As time) 
		--From @pCallInteraction.nodes('CallInteractions') as Tabx(colx);

		Declare @callInteractionId bigint, @custLeadId bigint, @custDetail_ID bigint, @caseStatusID bigint;
		Declare @strCallInteraction_ID varchar(10), @strCustLead_ID varchar(10), @strAgentMaster_ID varchar(10), @strInteractionDate varchar(25), 
		@strInteractionDuration varchar(20),@strPrevIssueType varchar(10), @strPrevSubIssueID varchar(10), @strPrevCaseStatusID varchar(10), @strPrevTierID varchar(10), 
		@strTierID varchar(10), @strPlanId varchar(20), 
		@strTeleInteractionID varchar(10), @strScheduleCallback_ID varchar(10), @strIssueID varchar(10), @strIssueCode varchar(10), @strSubIssueID varchar(10), 
		@strContactTypeID varchar(10), 
		@caseStatusCode varchar(10), @strUrgencyID varchar(10), @strImpactID varchar(10), @strAssignedAgent_ID varchar(10), @strPriorityID varchar(10), 
		@strCampaign_ID varchar(10), @strCustDetail_ID varchar(10);
		Select 
			@strCallInteraction_ID = cast(colx.query('data(CallInteraction_ID)') as varchar), 
			@strCustLead_ID = cast(colx.query('data(CustLead_ID)') as varchar), 
			@strAgentMaster_ID = cast(colx.query('data(AgentMaster_ID)') as varchar), 
			@strInteractionDate = cast(colx.query('data(InteractionDateString)') as varchar(35)), 
			@strPrevIssueType = cast(colx.query('data(PrevissueType)') as varchar), 
			@strPrevSubIssueID = cast(colx.query('data(PrevSubIssueID)') as varchar), 
			@strSubIssueID = cast(colx.query('data(SubIssueID)') as varchar), 
			@strIssueID = cast(colx.query('data(IssueID)') as varchar), 
			@strIssueCode = cast(colx.query('data(IssueCode)') as varchar), 
			@strPrevCaseStatusID = cast(colx.query('data(PrevCaseStatusID)') as varchar), 
			@strPrevTierID = cast(colx.query('data(PrevTierID)') as varchar), 
			@strTierID = cast(colx.query('data(TierID)') as varchar), 
			@strPlanId = cast(colx.query('data(PlanID)') as varchar), 
			@strTeleInteractionID = cast(colx.query('data(TeleInteractionID)') as varchar), 
			@strScheduleCallback_ID = cast(colx.query('data(ScheduleCallback_ID)') as varchar), 
			@strImpactID = cast(colx.query('data(ImpactID)') as varchar), 
			@strUrgencyID = cast(colx.query('data(UrgencyID)') as varchar), 
			@strContactTypeID = cast(colx.query('data(ContactTypeID)') as varchar), 
			@strCampaign_ID = cast(colx.query('data(Campaign_ID)') as varchar), 
			@strCustDetail_ID = cast(colx.query('data(CustDetail_ID)') as varchar)--, 
		From @pCallInteraction.nodes('CallInteractions') as Tabx(colx);

		--Select @strCustLeadId + '|' + @strCustDetailID;
		--Select cast(colx.query('data(CustLead_Id) ') as varchar) From @pCustLead.nodes('CustomerLeads') as Tabx(colx);
		--Select 
		--	(Case When (@strCallInteraction_ID = '' OR @strCallInteraction_ID IS NULL) Then NULL Else @strCallInteraction_ID End) As CallInteraction_ID, 
		--	(Case When (@strCustLead_ID = '' OR @strCustLead_ID IS NULL) Then NULL Else @strCustLead_ID End) As CustLead_ID, 
		--	NULL as Contact_ID,
		--	(Case When (@strAgentMaster_ID = '' OR @strAgentMaster_ID IS NULL) Then NULL Else @strAgentMaster_ID End) As AgentMaster_ID, 
		--	cast(colx.query('data(AgentName)') as varchar) As AgentName, 
		--	cast(cast(colx.query('data(InteractionDateString)') as varchar) as datetime) As InteractionDate,
		--	cast(cast(colx.query('data(InteractionDurationString)') as varchar) as time) As InteractionDuration,
		--	(Case When (@strPrevissueType = '' OR @strPrevissueType IS NULL) Then NULL Else @strPrevissueType End) As PrevissueType, 
		--	cast(colx.query('data(IssueType)') as varchar) As IssueType, 
		--	(Case When (@strPrevSubIssueID = '' OR @strPrevSubIssueID IS NULL) Then NULL Else @strPrevSubIssueID End) As PrevSubIssueID, 
		--	(Case When (@strSubIssueID = '' OR @strSubIssueID IS NULL) Then NULL Else @strSubIssueID End) As SubIssueID, 
		--	(Case When (@strIssueID = '' OR @strIssueID IS NULL) Then NULL Else @strIssueID End) As DispositionID, 
		--	cast(colx.query('data(DispositionCode)') as varchar) As DispositionCode,
		--	cast(colx.query('data(PlanName)') as varchar) As PlanName,
		--	cast(colx.query('data(Product)') as varchar) As Product,
		--	cast(colx.query('data(ContractNumber)') as varchar) As ContractNumber,
		--	cast(colx.query('data(PBP_Number)') as varchar) As PBP_Number,
		--	(Case When (@strPrevCaseStatusID = '' OR @strPrevCaseStatusID IS NULL) Then NULL Else @strPrevCaseStatusID End) As PrevCaseStatusID, 
		--	cast(colx.query('data(CaseStatusID)') as varchar) As CaseStatusID,
		--	cast(colx.query('data(CaseStatusCode)') as varchar) As CaseStatusCode,
		--	(Case When (@strPrevTierID = '' OR @strPrevTierID IS NULL) Then NULL Else @strPrevTierID End) As PrevTierID, 
		--	(Case When (@strTierID = '' OR @strTierID IS NULL) Then NULL Else @strTierID End) As TierID, 
		--	(Case When (@strTeleInteractionID = '' OR @strTeleInteractionID IS NULL) Then NULL Else @strTeleInteractionID End) As TeleInteractionID, 
		--	(Case When (@strScheduleCallback_ID = '' OR @strScheduleCallback_ID IS NULL) Then NULL Else @strScheduleCallback_ID End) As ScheduleCallback_ID, 
		--	cast(colx.query('data(Notify)') as varchar) As Notify,
		--	cast(colx.query('data(Priority)') as varchar) As [Priority],
		--	(Case When (@strImpactID = '' OR @strImpactID IS NULL) Then NULL Else @strImpactID End) As ImpactID, 
		--	(Case When (@strUrgencyID = '' OR @strUrgencyID IS NULL) Then NULL Else @strUrgencyID End) As UrgencyID, 
		--	(Case When (@strContactTypeID = '' OR @strContactTypeID IS NULL) Then NULL Else @strContactTypeID End) As ContactTypeID, 
		--	(Case When (@strCampaign_ID = '' OR @strCampaign_ID IS NULL) Then NULL Else @strCampaign_ID End) As Campaign_ID, 
		--	(Case When (@strCustDetail_ID = '' OR @strCustDetail_ID IS NULL) Then NULL Else @strCustDetail_ID End) As CustDetails_ID, 
		--	cast(colx.query('data(FirstName)') as varchar) As FirstName,
		--	cast(colx.query('data(LastName)') as varchar) As LastName,
		--	cast(colx.query('data(Phone)') as varchar) As Phone,
		--	cast(colx.query('data(Zip)') as varchar) As Zip,
		--	cast(colx.query('data(Notes)') as varchar) As Notes 
		--From @pCallInteraction.nodes('CallInteractions') as Tabx(colx);

		Insert into dbo.#tblCallInteraction(
		CallInteraction_ID,CustLead_ID,Contact_ID,AgentMaster_ID,AgentName,InteractionDate,InteractionDuration,
		PrevIssueType,IssueType,PrevSubIssueID,SubIssueID,DispositionID,DispositionCode,
		PlanId,PlanName,Product,
		ContractNumber,PBP_Number,PrevCaseStatusID,CaseStatusID,CaseStatusCode,PrevTierID,TierID,TeleInteractionID,ScheduledCallback_ID,Notify,[Priority],ImpactID,
		UrgencyID,ContactTypeID,Campaign_ID,CustDetail_ID,FirstName,LastName,Phone,Zip,Notes
		)
		Select 
			(Case When (@strCallInteraction_ID = '' OR @strCallInteraction_ID IS NULL) Then NULL Else @strCallInteraction_ID End) As CallInteraction_ID, 
			(Case When (@strCustLead_ID = '' OR @strCustLead_ID IS NULL) Then NULL Else @strCustLead_ID End) As CustLead_ID, 
			NULL as Contact_ID,
			(Case When (@strAgentMaster_ID = '' OR @strAgentMaster_ID IS NULL) Then NULL Else @strAgentMaster_ID End) As AgentMaster_ID, 
			cast(colx.query('data(AgentName)') as varchar) As AgentName, 
			cast(cast(colx.query('data(InteractionDateString)') as varchar) as datetime) As InteractionDate,
			cast(cast(colx.query('data(InteractionDurationString)') as varchar) as time) As InteractionDuration,
			(Case When (@strPrevissueType = '' OR @strPrevissueType IS NULL) Then NULL Else @strPrevissueType End) As PrevissueType, 
			cast(colx.query('data(IssueType)') as varchar) As IssueType, 
			(Case When (@strPrevSubIssueID = '' OR @strPrevSubIssueID IS NULL) Then NULL Else @strPrevSubIssueID End) As PrevSubIssueID, 
			(Case When (@strSubIssueID = '' OR @strSubIssueID IS NULL) Then NULL Else @strSubIssueID End) As SubIssueID, 
			(Case When (@strIssueID = '' OR @strIssueID IS NULL) Then NULL Else @strIssueID End) As DispositionID, 
			cast(colx.query('data(IssueCode)') as varchar) As DispositionCode,
			(Case When (@strPlanId = '' OR @strPlanId IS NULL) Then NULL Else @strPlanId End) As PlanId, 
			--cast(colx.query('data(PlanName)') as varchar) As PlanName,
			NULL as PlanName,
			cast(colx.query('data(Product)') as varchar) As Product,
			cast(colx.query('data(ContractNumber)') as varchar) As ContractNumber,
			cast(colx.query('data(PBP_Number)') as varchar) As PBP_Number,
			(Case When (@strPrevCaseStatusID = '' OR @strPrevCaseStatusID IS NULL) Then NULL Else @strPrevCaseStatusID End) As PrevCaseStatusID, 
			cast(colx.query('data(CaseStatusID)') as varchar) As CaseStatusID,
			cast(colx.query('data(CaseStatusCode)') as varchar) As CaseStatusCode,
			(Case When (@strPrevTierID = '' OR @strPrevTierID IS NULL) Then NULL Else @strPrevTierID End) As PrevTierID, 
			(Case When (@strTierID = '' OR @strTierID IS NULL) Then NULL Else @strTierID End) As TierID, 
			(Case When (@strTeleInteractionID = '' OR @strTeleInteractionID IS NULL) Then NULL Else @strTeleInteractionID End) As TeleInteractionID, 
			(Case When (@strScheduleCallback_ID = '' OR @strScheduleCallback_ID IS NULL) Then NULL Else @strScheduleCallback_ID End) As ScheduleCallback_ID, 
			cast(colx.query('data(Notify)') as varchar) As Notify,
			cast(colx.query('data(Priority)') as varchar) As [Priority],
			(Case When (@strImpactID = '' OR @strImpactID IS NULL) Then NULL Else @strImpactID End) As ImpactID, 
			(Case When (@strUrgencyID = '' OR @strUrgencyID IS NULL) Then NULL Else @strUrgencyID End) As UrgencyID, 
			(Case When (@strContactTypeID = '' OR @strContactTypeID IS NULL) Then NULL Else @strContactTypeID End) As ContactTypeID, 
			(Case When (@strCampaign_ID = '' OR @strCampaign_ID IS NULL) Then NULL Else @strCampaign_ID End) As Campaign_ID, 
			(Case When (@strCustDetail_ID = '' OR @strCustDetail_ID IS NULL) Then NULL Else @strCustDetail_ID End) As CustDetails_ID, 
			cast(colx.query('data(FirstName)') as varchar) As FirstName,
			cast(colx.query('data(LastName)') as varchar) As LastName,
			cast(colx.query('data(Phone)') as varchar) As Phone,
			cast(colx.query('data(Zip)') as varchar) As Zip,
			cast(colx.query('data(Notes)') as varchar) As Notes 
		From @pCallInteraction.nodes('CallInteractions') as Tabx(colx);

		Declare @caseStatus_OpenValue varchar(10), @caseStatus_ClosedValue varchar(10), @planName varchar(100);
		Select
			@caseStatus_OpenValue = CodeVal
		From dbo.CRM_LookupMaster Where DataGroup='OpenClosed' And TxtVal='Open';
		Select
			@caseStatus_ClosedValue = CodeVal
		From dbo.CRM_LookupMaster Where DataGroup='OpenClosed' And TxtVal='Closed';
		Select 
			@planName = A.PlanName
		From dbo.PlanMaster A
		Inner Join dbo.#tblCallInteraction B
		On A.Id = B.PlanId;

		Update dbo.#tblCallInteraction
		Set CaseStatusID = (Case When CaseStatusCode=@caseStatus_OpenValue Then 1 When CaseStatusCode=@caseStatus_ClosedValue Then 0 End),
		PlanName = @planName;

		--Select * From dbo.#tblCallInteraction;

		Select
			@callInteractionId = CallInteraction_ID, 
			@custLeadId = CustLead_ID,
			@custDetail_ID = CustDetail_ID,
			@caseStatusID = CaseStatusID,
			@caseStatusCode = CaseStatusCode
		From
			dbo.#tblCallInteraction;

		--Print Cast(@custLeadId as Varchar);
		--Print Cast(@custDetail_ID as Varchar);
		--Print Cast(@caseStatusID as Varchar);

		Declare @rowCount int;
		If Exists(Select 1 From dbo.#tblCallInteraction Where CallInteraction_ID Is Not NULL)
		Begin
			If Not Exists(Select 1 From dbo.Call_Interactions Where CallInteraction_ID = @callInteractionId)
			Begin
				Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Call Interaction not found' As 'Description';
			End
			--Else If Exists (Select 1 From dbo.Call_Interactions Where CallInteraction_ID <> @callInteractionId And CustLead_ID = @custLeadId And CaseStatusCode = @caseStatusCode And @caseStatusCode = @caseStatus_OpenValue)
			--Begin
			--	--TODO: error
			--	Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Duplicate Case Status for same Customer' As 'Description';
			--End
			--Else If Exists (Select 1 From dbo.Customer_Details Where CustDetail_ID Not In (Select CustDetail_ID From dbo.#tblCustDetails) And Medicare_Number In (Select Medicare_Number From dbo.#tblCustDetails Where Medicare_Number Is Not Null And Medicare_Number <> ''))
			--Begin
			--	--TODO: error
			--	Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Duplicate Medicare number' As 'Description';
			--End
			Else
			Begin
				Update A
				Set 
					--A.CustLead_ID=B.CustLead_ID, 
					--A.AgentMaster_ID=B.AgentMaster_ID, 
					--A.AgentName=B.AgentName, 
					A.InteractionDate=B.InteractionDate, 
					A.InteractionDuration=B.InteractionDuration,
					--A.PrevIssueType=B.PrevIssueType, 
					--A.IssueType=B.IssueType, 
					--A.PrevSubIssueID=B.PrevSubIssueID, 
					--A.SubIssueID=B.SubIssueID, 
					A.DispositionID=B.DispositionID, 
					A.DispositionCode=B.DispositionCode, 
					A.Product=B.Product, 
					A.PlanId=B.PlanId,
					A.PlanName=B.PlanName, 
					A.ContractNumber=B.ContractNumber, 
					A.PBP_Number=B.PBP_Number, 
					--A.PrevCaseStatusID=B.PrevCaseStatusID, 
					--A.CaseStatusID=B.CaseStatusID, 
					--A.PrevTierID=B.PrevTierID, 
					--A.TierID=B.TierID, 
					A.TeleInteractionID=B.TeleInteractionID, 
					A.ScheduledCallback_ID=B.ScheduledCallback_ID, 
					A.Notify=B.Notify, 
					A.[Priority]=B.[Priority], 
					--A.ImpactID=B.ImpactID, 
					--A.UrgencyID=B.UrgencyID, 
					A.ContactTypeID=B.ContactTypeID, 
					--A.Campaign_ID=B.Campaign_ID, 
					--A.CustDetail_ID=B.CustDetail_ID, 
					--A.FirstName=B.FirstName, 
					--A.LastName=B.LastName, 
					--A.Phone=B.Phone, 
					--A.Zip=B.Zip, 
					A.Notes=B.Notes
				From dbo.Call_Interactions A
				Inner Join dbo.#tblCallInteraction B
				On A.CallInteraction_ID = B.CallInteraction_ID;

				Set @rowCount = @@ROWCOUNT;

				IF (@strIssueCode = 'D004') --Issue-code/Disposition D003 means Not-interested
				Begin
					Update A
					Set A.CaseStatusCode = @caseStatus_ClosedValue
					From dbo.Customer_Leads A
					Inner Join dbo.#tblCallInteraction B
					On A.CustLead_ID = B.CustLead_ID;
				End

				Select @rowCount As [RowCount], 'Update Success' As [Status], @callInteractionId As [Description], @custLeadId As CustLead_ID;
			End
		End
		Else
		Begin
			--If Exists (Select 1 From dbo.Call_Interactions Where CustDetail_ID = @custDetail_ID And CaseStatusCode = @caseStatus_OpenValue And @caseStatusCode = @caseStatus_OpenValue)
			--Begin
			--	--TODO: error
			--	Select -1 As 'RowCount', 'Insert Failure' As 'Status', 'Cannot have more than 1 open case for the Customer' As 'Description';
			--End
			--Else If Exists (Select 1 From dbo.Customer_Leads Where Medicare_Number In (Select Medicare_Number From dbo.#tblCustDetails Where Medicare_Number Is Not Null And Medicare_Number <> ''))
			--Begin
			--	--TODO: error
			--	Select -1 As 'RowCount', 'Insert Failure' As 'Status', 'Duplicate Medicare number' As 'Description';
			--End
			--Else
			Begin
				Declare @newCallInteractionId bigint;
				--Select @newCallInteractionId = (Case When CallInteraction_ID IS NULL Then 1 Else CallInteraction_ID End) from dbo.Call_Interactions Order By CallInteraction_ID Desc;
				--Set @newCallInteractionId = @newCallInteractionId + 1;
				Select @newCallInteractionId = (Coalesce(MAX(CallInteraction_ID),0) + 1) from dbo.Call_Interactions;
				--Print @newCallInteractionId;

				--Select * From dbo.#tblCallInteraction A;
				--Select	
				--@newCallInteractionId,A.CustLead_ID,NULL,B.AgentMaster_ID,B.AgentName,A.InteractionDate,A.InteractionDuration,B.PreIssueType,B.IssueType,B.PreIssueSubID,
				--B.SubIssueID,A.DispositionID,A.DispositionCode,A.PlanName,A.Product,A.ContractNumber,A.PBP_Number,B.PrevCaseStatusID,B.CaseStatusID,B.CaseStatusCode,B.PrevTier,B.Tier,
				--A.TeleInteractionID,A.ScheduledCallback_ID,A.Notify,B.[PriorityID],B.ImpactID,
				--B.Urgency,A.ContactTypeID,A.Campaign_ID,B.CustDetail_ID,C.FirstName,C.LastName,C.Phone,C.Zip,A.Notes
				--From dbo.#tblCallInteraction A
				--Inner Join dbo.Customer_Leads B
				--On A.CustLead_ID=B.CustLead_ID
				--Inner Join dbo.Customer_Details C
				--On B.CustDetail_ID=C.CustDetail_ID;

				Declare @status varchar(15), @description varchar(50);
				
				Set Identity_Insert dbo.Call_Interactions On;

				Insert into dbo.Call_Interactions(
				CallInteraction_ID,CustLead_ID,Contact_ID,AgentMaster_ID,AgentName,InteractionDate,InteractionDuration,PrevIssueType,IssueType,PrevSubIssueID,SubIssueID,
				DispositionID,DispositionCode,PlanId,PlanName,Product,
				ContractNumber,PBP_Number,PrevCaseStatusID,CaseStatusID,CaseStatusCode,PrevTierID,TierID,TeleInteractionID,ScheduledCallback_ID,Notify,[Priority],ImpactID,
				UrgencyID,ContactTypeID,
				Campaign_ID,CustDetail_ID,FirstName,LastName,Phone,Zip,Notes)
				Select	
				@newCallInteractionId,A.CustLead_ID,NULL,B.AgentMaster_ID,B.AgentName,A.InteractionDate,A.InteractionDuration,B.PreIssueType,B.IssueType,B.PreIssueSubID,
				B.SubIssueID,A.DispositionID,A.DispositionCode,A.PlanId,A.PlanName,A.Product,A.ContractNumber,A.PBP_Number,B.PrevCaseStatusID,B.CaseStatusID,B.CaseStatusCode,
				B.PrevTier,B.Tier,
				A.TeleInteractionID,A.ScheduledCallback_ID,A.Notify,B.[PriorityID],B.ImpactID,
				B.Urgency,A.ContactTypeID,A.Campaign_ID,B.CustDetail_ID,C.FirstName,C.LastName,C.Phone,C.Zip,A.Notes
				From dbo.#tblCallInteraction A
				Inner Join dbo.Customer_Leads B
				On A.CustLead_ID=B.CustLead_ID
				Inner Join dbo.Customer_Details C
				On B.CustDetail_ID=C.CustDetail_ID;

				Set @rowCount = @@ROWCOUNT;

				Set Identity_Insert dbo.Call_Interactions Off;

				IF (@strIssueCode = 'D004') --Issue-code/Disposition D004 means Not-interested
				Begin
					Update A
					Set A.CaseStatusCode = @caseStatus_ClosedValue
					From dbo.Customer_Leads A
					Inner Join dbo.#tblCallInteraction B
					On A.CustLead_ID = B.CustLead_ID;
				End

				--Insert into dbo.Call_Interactions(
				--CustLead_ID, AgentMaster_ID, PrevIssueType, IssueType, PrevSubIssueID, SubIssueID, PrevCaseStatusID, CaseStatusID, 
				--PrevTierID, TierID, Urgency, ImpactID) 
				--Select 
				--@newCustLeadId, AgentMaster_ID, PreIssueType, IssueType, PreSubIssueID, SubIssueID, PreCaseStatusID, CaseStatusID, 
				--PreTierID, TierID, Urgency, ImpactID
				--From dbo.#tblCustLead;
				If (@rowCount > 0)
				Begin
					Select @status = 'Add Success', @description = @newCallInteractionId;--@newCallInteractionId;
				End
				Else If (@rowCount = 0)
				Begin
					Select @status = 'Add Failure', @description = 'Record was not added';
				End

				Select @rowCount As [RowCount], @status As [Status], @description As [Description], @custLeadId As CustLead_ID;
			End
		End

		Drop Table dbo.#tblCallInteraction;

		-- since IMPLICIT TRANSACTION is ON by default to a COMMIT for the above DROP statement
		Commit Tran; 
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )

		--Begin

		Rollback Tran;

		--End
		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10)
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End

GO
/****** Object:  StoredProcedure [dbo].[uspSaveCampaignBasicDetails]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[uspSaveCampaignBasicDetails] '<CampaignBasicDetails><Campaign_ID>36</Campaign_ID><Campaign_Name>test 25</Campaign_Name><Campaign_Type>CT001</Campaign_Type><Wave>WA001</Wave><Campaign_Recurrence_Type>CRT005</Campaign_Recurrence_Type><Campaign_Recurrence_Pattern>Year:1|CalendarMonth:CRM001|Day:23</Campaign_Recurrence_Pattern><Start_Date>2023-10-23T00:00:00</Start_Date><Start_Date_string>2023-10-23</Start_Date_string><Project_Owner>abc@test.com</Project_Owner><Stakeholder>xyz@test.com</Stakeholder><Sample_Selection>SS001</Sample_Selection><Agent_ID>1</Agent_ID></CampaignBasicDetails>'
CREATE Procedure [dbo].[uspSaveCampaignBasicDetails]
(
	@pCampaignBasicDetails Xml
)
As
Begin
	Begin Try
		Begin Tran;

		Declare @campaign_ID bigint,
		@Campaign_Name [varchar](100) ,
		@Campaign_Type [varchar](50) ,
		@Campaign_Brand [varchar](20) ,
		@Campaign_Recurrence_Type varchar(20),
		@Campaign_Recurrence_Pattern varchar(500),
		@Wave [varchar](10) ,
		@Start_Date [date] ,
		@Project_Owner [varchar](50) ,
		@Stakeholder [varchar](500) ,
		@Sample_Selection [varchar](10) ,	
		@Agent_ID [bigint],
		@ExpiryDate [date];

		select @campaign_ID=cast( cast(colx.query('data(Campaign_ID) ') as varchar)as bigint),
			@Campaign_Name=cast(colx.query('data(Campaign_Name) ') as varchar),
			@Campaign_Type=cast(colx.query('data(Campaign_Type) ') as varchar),
			@Campaign_Brand=cast(colx.query('data(Campaign_Brand) ') as varchar),
			@Campaign_Recurrence_Type=cast(colx.query('data(Campaign_Recurrence_Type) ') as varchar),
			@Campaign_Recurrence_Pattern=cast(colx.query('data(Campaign_Recurrence_Pattern) ') as varchar(500)),
			@Wave=cast(colx.query('data(Wave) ') as varchar) ,
			@Start_Date=cast(cast(colx.query('data(Start_Date) ') as varchar) as date),
			@Project_Owner=cast(colx.query('data(Project_Owner) ') as varchar) ,
			@Stakeholder=cast(colx.query('data(Stakeholder) ') as varchar) ,
			@Sample_Selection=cast(colx.query('data(Sample_Selection) ') as varchar),
			@ExpiryDate=cast(cast(colx.query('data(ExpiryDate) ') as varchar) as date),
			@Agent_ID=cast( cast(colx.query('data(Agent_ID) ') as varchar)as bigint)
			From @pCampaignBasicDetails.nodes('CampaignBasicDetails') as Tabx(colx);

		if(@campaign_ID=0)--insertion
		begin
			Select @campaign_ID = (Coalesce(MAX(Campaign_ID), 0) + 1) From dbo.Campaign_BasicDetails;		
			Set Identity_Insert dbo.Campaign_BasicDetails ON;

			Insert into dbo.Campaign_BasicDetails(Campaign_ID,Campaign_Name,Campaign_Type,Campaign_Brand,Wave,[Start_Date],Project_Owner,Stakeholder,Sample_Selection,Agent_ID,Campaign_Recurrence_Type,Campaign_Recurrence_Pattern,ExpiryDate) 
			values(@campaign_ID,@Campaign_Name,@Campaign_Type,@Campaign_Brand,@Wave,@Start_Date,@Project_Owner,@Stakeholder,@Sample_Selection,@Agent_ID,@Campaign_Recurrence_Type,@Campaign_Recurrence_Pattern,@ExpiryDate);
			--select @campaign_ID,
			--cast(colx.query('data(Campaign_Name) ') as varchar) as Campaign_Name,
			--cast(colx.query('data(Campaign_Type) ') as varchar) as Campaign_Type,
			--cast(colx.query('data(Wave) ') as varchar) as Wave,
			--cast(cast(colx.query('data(Start_Date) ') as varchar) as date)as [Start_Date],
			--cast(colx.query('data(Project_Owner) ') as varchar) as Project_Owner,
			--cast(colx.query('data(Stakeholder) ') as varchar) as Stakeholder,
			-- cast(colx.query('data(Sample_Selection) ') as varchar)as Sample_Selection,
			--cast( cast(colx.query('data(Agent_ID) ') as varchar)as bigint)as Agent_ID
			--From @pCampaignBasicDetails.nodes('CampaignBasicDetails') as Tabx(colx);
				
			Set Identity_Insert dbo.Campaign_BasicDetails OFF;
			Select @@ROWCOUNT As [RowCount], 'Add Success' As [Status], ('Campaign_ID:' + CAST(@campaign_ID As varchar)) As [Description];	
		end
		else--updation
		begin
			Update dbo.Campaign_BasicDetails set Campaign_Name=@Campaign_Name,Campaign_Type=@Campaign_Type,Campaign_Brand=@Campaign_Brand,Wave=@Wave,[Start_Date]=@Start_Date,Project_Owner=@Project_Owner,
			Stakeholder=@Stakeholder,Campaign_Recurrence_Type=@Campaign_Recurrence_Type,Campaign_Recurrence_Pattern=@Campaign_Recurrence_Pattern --,Sample_Selection=@Sample_Selection
			,ExpiryDate=@ExpiryDate where Campaign_ID=@campaign_ID
			Select @@ROWCOUNT As [RowCount], 'Update Success' As [Status], ('Campaign_ID:' + CAST(@campaign_ID As varchar)) As [Description];	
		end
		Commit Tran; 
	End Try
	Begin Catch
		--Print XACT_STATE();

		--IF (XACT_STATE() = -1 )

		--Begin

		Rollback Tran;

		--End
		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10);
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[uspSaveCampaignCustomerList]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext [uspSaveCampaignCustomerList]
--exec [dbo].[uspSaveCampaignCustomerList] 1
CREATE Procedure [dbo].[uspSaveCampaignCustomerList] 
(
	@CampaignId bigint
)
As
Begin
	Begin Try
		Begin Tran;

		Declare @Customer_TableName varchar(200)='dbo.Campaign_Customers',@Sample_Selection varchar(20),@Criteria_State varchar(200),@Criteria_Product varchar(200),
				@Criteria_Decile varchar(200), @Criteria_Tenure varchar(200), @where varchar(max);
		Declare @Campaign_Recurrence_Type varchar(20), @Campaign_Recurrence_Pattern varchar(500);
		
		Set @where = ' Where 1=1 ';
		
		Select @Campaign_Recurrence_Type=Campaign_Recurrence_Type,@Campaign_Recurrence_Pattern=Campaign_Recurrence_Pattern From dbo.Campaign_BasicDetails 
		Where Campaign_ID=@CampaignId;

		Select @Customer_TableName=B.TxtVal,@Criteria_State=A.Criteria_State --,@Criteria_Product=A.Criteria_Product,@Criteria_Decile=A.Criteria_Decile,@Criteria_Tenure=A.Criteria_Tenure  
		from dbo.Campaign_Filter A 
		Inner Join dbo.CRM_LookupMaster B
		On A.Customer_TableName=B.CodeVal
		And B.DataGroup='CAMPAIGNTBLNM'
		where campaign_ID=@CampaignId;
		
		Select @Criteria_Product=B.TxtVal
		from dbo.Campaign_Filter A 
		Inner Join dbo.CRM_LookupMaster B
		On A.Criteria_Product=B.CodeVal
		And B.DataGroup='CMPGNPRD'
		where campaign_ID=@CampaignId;

		Select @Criteria_Decile=B.TxtVal
		from dbo.Campaign_Filter A 
		Inner Join dbo.CRM_LookupMaster B
		On A.Criteria_Decile=B.CodeVal
		And B.DataGroup='CMPGNDECILE'
		where campaign_ID=@CampaignId;

		Select @Criteria_Tenure=B.TxtVal  
		from dbo.Campaign_Filter A 
		Inner Join dbo.CRM_LookupMaster B
		On A.Criteria_Tenure=B.CodeVal
		And B.DataGroup='CMPGNTNRE'
		where campaign_ID=@CampaignId;

		if(@Criteria_State<>'' and @Criteria_State is not Null)
		Begin						
			Set @where = @where + ' and replace(replace(substring(Customer_State,len(Customer_State)-3,4),''('',''''),'')'','''') in(select [value] from string_split(''' + 
						 @Criteria_State+''','',''))';
		end

		if(@Criteria_Product<>'' and @Criteria_Product is not Null)
		Begin	
			Set @where = @where+' and Product in('''+@Criteria_Product+''')';
		end
		
		if(@Criteria_Decile<>'' and @Criteria_Decile is not Null)
		Begin	
			Set @where = @where+' and Decile in('''+@Criteria_Decile+''')';
		end

		if(@Criteria_Tenure<>'' and @Criteria_Tenure is not Null)
		Begin	
			Set @where = @where+' and Tenure in('''+ @Criteria_Tenure+''')';
		end		
		
		Declare @currentDateTime varchar(50);
		Set @currentDateTime = Format(GetDate(), 'yyyy-MM-dd HH:mm:ss');
		Print @currentDateTime;

		Declare @sql nvarchar(max)='';
		Set @sql = 
			'Insert into dbo.Campaign_Result  select '+ CAST(@CampaignId as varchar(20)) +' as [Campaign_ID], [Customer_ID], [Customer_Name], [Customer_Address1], ' + 
			'[Customer_City], [Customer_State], [Customer_Zipcode], [Customer_Phone], [Customer_Email], ' + 
			'[Customer_Type], [OptIn], [Product], [Decile], [Tenure], ''' + @currentDateTime + ''' as Updated_On from  '+ @Customer_TableName + @where;

		Print @sql;
		
		--Exec(@sql);
		EXECUTE sp_executesql @sql;

		--Print 1;
		
		Declare @campaignName varchar(100), @campaignType varchar(50), @interval int, @agentID bigint;
		Declare @intervalCodeVal varchar(10); 
		Select @intervalCodeVal=Wave From dbo.Campaign_BasicDetails;
		Select @interval=Cast(TxtVal as int) From CRM_LookupMaster Where DataGroup='CMPGNWAV' And CodeVal=@intervalCodeVal;

		--Print @intervalCodeVal + ' ' + Cast(@interval as varchar(20));

		--Print 2;

		Select @campaignName=Campaign_Name,@campaignType=Campaign_Type,@agentID=Agent_ID From dbo.Campaign_BasicDetails Where Campaign_ID=@CampaignId;

		--Print 3;

		Set @sql = 
		CONCAT(N'Insert Into dbo.Appointment_Reminder(Appointment_Datetime,Campaign_ID,Campaign_Name,Campaign_Type,Interval,Reminder_Datetime,Customer_ID,Agent_ID,', 
			'Campaign_Recurrence_Type,Campaign_Recurrence_Pattern)', ' Select Top 1 ''' + @currentDateTime + ''' As Appointment_Datetime,', 
			CAST( +@CampaignId as varchar(20)) ,' as [Campaign_ID], ''' + @campaignName + ''' as [Campaign_Name], ''' + @campaignType + 
			''' As Campaign_Type, NULL As [Interval], ''', @currentDateTime, ''' As Reminder_DateTime, NULL, ', Cast(@agentID as varchar(20)), 
			' as Agent_ID, ''', @Campaign_Recurrence_Type, ''' as Campaign_Recurrence_Type, ''', @Campaign_Recurrence_Pattern, ''' as Campaign_Recurrence_Pattern', 
			'  from  ', @Customer_TableName + @where);
			--getdate() as Updated_On

		--Print 4;
		
		Print @sql;

		--Print 5;

		--Exec(@sql);
		EXECUTE sp_executesql @sql;
		
		Set @sql = '';

		Set @sql = 
			--'Insert Into dbo.Appointment_Reminder_Campaign_Trans(Appointment_Datetime,Campaign_ID,Campaign_Name,Campaign_Type,Interval,Reminder_Datetime,' + 
			--'Customer_ID,Agent_ID) ' + 
			--'Select ''' + @currentDateTime + ''' As Appointment_Datetime,'+ CAST( +@CampaignId as varchar(20)) +' as [Campaign_ID], ''' + @campaignName + 
			--''' as [Campaign_Name], ''' + @campaignType + ''' As Campaign_Type, ' + CAST( +@interval as varchar(20)) + ' As [Interval], ''' + @currentDateTime + 
			--''' As Reminder_DateTime, Customer_ID, ' + Cast(@agentID as varchar(20)) + ' as Agent_ID' + 
			--'  from  ' + @Customer_TableName + @where;
			CONCAT(N'Insert Into dbo.Appointment_Reminder_Campaign_Trans(Appointment_Datetime,Campaign_ID,Campaign_Name,Campaign_Type,Interval,Reminder_Datetime,',  
			'Customer_ID,Agent_ID) ', 'Select ''', @currentDateTime, ''' As Appointment_Datetime,', CAST(@CampaignId as varchar(20)), ' as [Campaign_ID], ''', 
			@campaignName, ''' as [Campaign_Name], ''', @campaignType, ''' As Campaign_Type, NULL As [Interval], ''', @currentDateTime, 
			''' As Reminder_DateTime, Customer_ID, ', Cast(@agentID as varchar(20)), ' as Agent_ID', '  from  ' + @Customer_TableName, @where);
		
		Print @sql;

		--Print 6;

		--Exec(@sql);
		EXECUTE sp_executesql @sql;

		Commit Tran;
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )
		--Begin
		Rollback Tran;
		--End

		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10);
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[uspSaveCSVSampleUploaded]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspSaveCSVSampleUploaded] (  
	@CsvUploadedData CSV_SampleUploadedData Readonly , 
	@Campaign_ID bigint
)  
AS  
Begin  
 SET NOCOUNT ON;  
  
 BEGIN TRY  
    
  BEGIN TRANSACTION  
    
	/**************Inserting data in Campaign_Filter table for sample selection and there is Campfilter_ID in Campaign_SampleUploadedData table so there is a possibility of relationship in between Campaign_Filter and Campaign_SampleUploadedData table*******************/
   INSERT INTO dbo.Campaign_Filter([Campaign_ID],[Sample_Selection], [Customer_TableName], [Criteria_State], [Criteria_Product], [Criteria_Decile], [Criteria_Tenure]) VALUES (@Campaign_ID , 'SS002',null , null , null, null, null )

					
  INSERT INTO DBO.Campaign_SampleUploadedData ([Campaign_ID], [Customer_ID], [Customer_Name], [Customer_Address1], [Customer_City], [Customer_State], [Customer_Zipcode],   
  [Customer_Phone], [Customer_Email], [Customer_Type], [OptIn], [Product], [Decile], [Tenure],[Uploaded_On])   
  SELECT @Campaign_ID as [Campaign_ID], [Customer_ID], [Customer_Name], [Customer_Address1],   
  [Customer_City], [Customer_State], [Customer_Zipcode], [Customer_Phone], [Customer_Email], [Customer_Type], [OptIn], [Product], [Decile], [Tenure], GETDATE()   
  FROM @CsvUploadedData   



  --Select @@ROWCOUNT As [RowCount],'Insert Successfully' As [Status]  
  
  COMMIT TRANSACTION TR1;  
  
 END TRY  
  
 BEGIN CATCH  
   
  ROLLBACK TRANSACTION TR1;  
  
  SELECT ERROR_MESSAGE() AS ErrorMsg  
 END CATCH  
END
GO
/****** Object:  StoredProcedure [dbo].[uspSaveCustomerDetails]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Select * From dbo.Customer_Details;
--exec [dbo].[uspSaveCustomerDetails] '<CustomerDetails><CustDetail_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RecordTypeID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ParentID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ExternalID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Shared p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address1 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><State p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Zip p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Gender p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><DOB p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Salutation p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MiddleName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Suffix p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Country p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Family p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Travel p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Hobbies p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Military p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Pets p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Weather p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Political p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Important_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Health_Info p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Smoker p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Fips p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartA_EffectiveDate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartB_EffectiveDate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Text p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_No_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicare_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Optout p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ReferralID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Text_OPTin p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email_OPTin p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone_OPTin p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicaid_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RepName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Relationship p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerDetails>'
--exec [dbo].[uspSaveCustomerDetails] '<CustomerDetails><CustDetail_ID>3</CustDetail_ID><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RecordType_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MasterCustomer_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Session_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName>Abc</FirstName><LastName>Def</LastName><Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email>a@b.com</Email><Shared p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address1>AAAAAAAA</Address1><Address2>BBBBBB</Address2><Phone2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City>AX</City><State>US</State><Zip>24801</Zip><Gender>G001</Gender><DOB>1947-09-12</DOB><Salutation>Mr</Salutation><MiddleName>HHH</MiddleName><Suffix>Jr</Suffix><Country>US</Country><RAPPORT_Family p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Travel p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Hobbies p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Military p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Pets p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Weather p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Political p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Important_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Health_Info p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Smoker p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Fips p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartA_EffectiveDate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartB_EffectiveDate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference>CP001</ContactPreference><ContactPreference_Text p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_No_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicare_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Optout p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ReferralID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Text_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicaid_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RepName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Relationship p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerDetails>'
--exec [dbo].[uspSaveCustomerDetails] '<CustomerDetails><CustDetail_ID>3</CustDetail_ID><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RecordType_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MasterCustomer_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Session_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName>Abc</FirstName><LastName>Def</LastName><Phone>9988776655</Phone><Email>a@b.com</Email><Shared p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address1>AAAAAAAA</Address1><Address2>BBBBBB</Address2><Phone2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City>AX</City><State>US</State><Zip>24801</Zip><Gender>G003</Gender><DOB>1947-09-12T00:00:00</DOB><Salutation>Mr</Salutation><MiddleName>HHH</MiddleName><Suffix>Jr</Suffix><Country>US</Country><RAPPORT_Family p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Travel p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Hobbies p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Military p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Pets p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Weather p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Political p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Important_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Health_Info p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Smoker p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Fips p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartA_EffectiveDate>2022-01-01T00:00:00</PartA_EffectiveDate><PartB_EffectiveDate>2022-11-24T00:00:00</PartB_EffectiveDate><ContactPreference>CP003</ContactPreference><ContactPreference_Text p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_No_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicare_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Optout p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ReferralID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Text_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicaid_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RepName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Relationship p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerDetails>'
--exec [dbo].[uspSaveCustomerDetails] '<CustomerDetails><CustDetail_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RecordType_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MasterCustomer_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Session_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Shared p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address1 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><State p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Zip p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Gender>G001</Gender><DOB p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Salutation p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MiddleName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Suffix p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Country p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Family p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Travel p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Hobbies p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Military p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Pets p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Weather p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Political p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Important_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Health_Info p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Smoker p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Fips p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartA_EffectiveDate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartB_EffectiveDate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference>CP001</ContactPreference><ContactPreference_Text p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_No_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicare_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Optout p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ReferralID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Text_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicaid_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RepName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Relationship p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerDetails>'
--exec [dbo].[uspSaveCustomerDetails] '<CustomerDetails><CustDetail_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RecordType_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MasterCustomer_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Session_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName>hgytu</FirstName><LastName>aasder</LastName><Phone>1234567890</Phone><Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Shared p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address1 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><State p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Zip>99999</Zip><Gender>G001</Gender><DOB p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Salutation p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MiddleName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Suffix p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Country p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Family p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Travel p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Hobbies p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Military p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Pets p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Weather p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Political p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Important_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Health_Info p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Smoker p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Fips p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartA_EffectiveDate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartB_EffectiveDate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference>CP001</ContactPreference><ContactPreference_Text p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_No_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicare_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Optout p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ReferralID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Text_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicaid_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RepName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Relationship p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerDetails>'
--exec [dbo].[uspSaveCustomerDetails] '<CustomerDetails><CustDetail_ID>5</CustDetail_ID><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RecordType_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MasterCustomer_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Session_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName>abc</FirstName><LastName>def</LastName><Phone>8899776655</Phone><Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Shared p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address1 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><State p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Zip>24801</Zip><Gender>G001</Gender><DOB>1900-01-01T00:00:00</DOB><Salutation p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MiddleName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Suffix p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Country p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Family p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Travel p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Hobbies p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Military p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Pets p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Weather p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Political p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Important_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Health_Info p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Smoker p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Fips p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartA_EffectiveDate>1900-01-01T00:00:00</PartA_EffectiveDate><PartB_EffectiveDate>1900-01-01T00:00:00</PartB_EffectiveDate><ContactPreference>CP001</ContactPreference><ContactPreference_Text p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_No_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicare_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Optout p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ReferralID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Text_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicaid_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RepName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Relationship p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerDetails>'
--exec [dbo].[uspSaveCustomerDetails] '<CustomerDetails><CustDetail_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RecordType_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MasterCustomer_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Session_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName>Abc</FirstName><LastName>Jhi</LastName><Phone>9182736450</Phone><Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Shared p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address1 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City>Charleston</City><State>West Virginia (WV)</State><Zip>24788</Zip><Gender p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><DOB>1958-01-12T00:00:00</DOB><Salutation p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MiddleName>Def</MiddleName><Suffix p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Country>US</Country><RAPPORT_Family p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Travel p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Hobbies p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Military p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Pets p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Weather p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Political p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Important_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Health_Info p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Smoker p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Fips p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartA_EffectiveDate>2023-01-12T00:00:00</PartA_EffectiveDate><PartB_EffectiveDate>2023-01-12T00:00:00</PartB_EffectiveDate><ContactPreference p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Text p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_No_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicare_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Optout p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ReferralID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Text_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicaid_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RepName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Relationship p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerDetails>'
--exec [dbo].[uspSaveCustomerDetails] '<CustomerDetails><CustDetail_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RecordType_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MasterCustomer_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Session_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName>agdj</FirstName><LastName>sldf</LastName><Phone>8899887766</Phone><Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Shared p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address1 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Address2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone2 p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City>Columbus</City><State>Ohio (OH)</State><Zip>44444</Zip><Gender>G002</Gender><DOB>1958-03-01T00:00:00</DOB><Salutation>Mr</Salutation><MiddleName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Suffix p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Country>US</Country><RAPPORT_Family p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Travel p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Hobbies p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Military p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Pets p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Weather p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Political p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Important_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RAPPORT_Health_Info p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Smoker>YN001</Smoker><Fips p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PartA_EffectiveDate>2023-02-28T00:00:00</PartA_EffectiveDate><PartB_EffectiveDate>2023-02-28T00:00:00</PartB_EffectiveDate><ContactPreference>CP003</ContactPreference><ContactPreference_Text p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_Email p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactPreference_No_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Medicare_Number p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Campaign_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Optout>YN001</Optout><ReferralID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Text_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Email_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Phone_OptIN p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastAgent>Cooper, Ryan Reynolds</LastAgent><LastAgent_ID>RCooper1</LastAgent_ID><Medicaid_Number>AASSDD5647F</Medicaid_Number><RepName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Phone p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Rep_Relationship p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerDetails>'
CREATE Procedure [dbo].[uspSaveCustomerDetails]
(
	@pCustDetails Xml
)
As
Begin
	Begin Try
		Begin Tran;

		Declare @newRecord bit;
		--Declare @custDetailId int;

		Create Table dbo.#tblCustDetails
		(
			CustDetail_ID bigint NULL,
			BrandID bigint NULL,
			RecordType_ID int NULL,
			MasterCustomer_ID bigint NULL,
			Session_ID varchar(50) NULL,
			FirstName varchar(100) NULL,
			LastName varchar(100) NULL,
			Phone float NULL,
			Email varchar(200) NULL,
			Shared tinyint NULL,
			Address1 varchar(200) NULL,
			Address2 varchar(200) NULL,
			Phone2 float NULL,
			City varchar(200) NULL,
			[State] varchar(200) NULL,
			Zip varchar(25) NULL,
			Gender varchar(10) NULL,
			DOB date NULL,
			Salutation varchar(25) NULL,
			MiddleName varchar(50) NULL,
			Suffix varchar(25) NULL,
			ContactPreference varchar(25) NULL,
			Country varchar(50) NULL,
			RAPPORT_Family text NULL,
			RAPPORT_Travel text NULL,
			RAPPORT_Hobbies text NULL,
			RAPPORT_Military text NULL,
			RAPPORT_Pets text NULL,
			RAPPORT_Weather text NULL,
			RAPPORT_Political text NULL,
			RAPPORT_Important_Date text NULL,
			RAPPORT_Health_Info text NULL,
			Smoker varchar(10) NULL,
			Fips varchar(25) NULL,
			PartA_EffectiveDate date NULL,
			PartB_EffectiveDate date NULL,
			ContactPreference_Phone int NULL,
			ContactPreference_Text int NULL,
			ContactPreference_Email int NULL,
			ContactPreference_No_OptIN int NULL,
			Medicare_Number varchar(25) NULL,
			Campaign_ID int NULL,
			RecipientID bigint NULL,
			Optout varchar(10) NULL,
			ReferralID int NULL,
			Text_OptIN int NULL,
			Email_OptIN int NULL,
			Phone_OptIN int NULL,
			LastAgent_ID varchar(50) NULL,
			Medicaid_Number varchar(50) NULL,
			RepName varchar(200) NULL,
			Rep_Phone varchar(200) NULL,
			Rep_Relationship varchar(200) NULL
		);

		Declare @custDetailId int, @brandID int, @recordType_ID int, @masterCustomer_ID int, @phone int, @shared int, @phone2 int, @smoker int, @contactPreference int, @contactPreference_Phone int, @contactPreference_No_OptIN int, @campaign_ID int, @recipientID int, @optout int, @referralID int, @lastAgent_ID int;
		Declare @strCustDetailId varchar(10), @strBrandID varchar(10), @strRecordTypeID varchar(10), @strMasterCustomerID varchar(10), @strPhone varchar(10), @strShared varchar(10), @strPhone2 varchar(10), @strSmoker varchar(10), @strContactPreference varchar(10), @strCampaign_ID varchar(10), @strRecipientID varchar(10), @strOptout varchar(10), @strReferralID varchar(10), @strLastAgent_ID varchar(10);
		Select 
			@strCustDetailId = cast(colx.query('data(CustDetail_ID)') as varchar),
			@strBrandID = cast(colx.query('data(BrandID) ') as varchar),
			@strRecordTypeID = cast(colx.query('data(RecordType_ID) ') as varchar),
			@strMasterCustomerID = cast(colx.query('data(MasterCustomer_ID) ') as varchar),
			@strPhone = cast(colx.query('data(Phone) ') as varchar),
			@strShared = cast(colx.query('data(Shared) ') as varchar),
			@strPhone2 = cast(colx.query('data(Phone2) ') as varchar),
			@strContactPreference = cast(colx.query('data(ContactPreference) ') as varchar),
			@strSmoker = cast(colx.query('data(Smoker) ') as varchar),
			--cast(colx.query('data(ContactPreference_Text) ') as varchar) As ContactPreference_Text,
			--cast(colx.query('data(ContactPreference_Phone) ') as varchar) As ContactPreference_Phone,
			--cast(colx.query('data(ContactPreference_No_OptIN) ') as varchar) As ContactPreference_No_OptIN,
			@strCampaign_ID = cast(colx.query('data(Campaign_ID) ') as varchar),
			@strRecipientID = cast(colx.query('data(Recipient_ID) ') as varchar),
			@strOptout = cast(colx.query('data(Optout) ') as varchar),
			@strReferralID = cast(colx.query('data(ReferralID) ') as varchar)--,
			--cast(colx.query('data(Text_OptIN) ') as varchar) As Text_OptIN,
			--cast(colx.query('data(Email_OptIN) ') as varchar) As Email_OptIN,
			--cast(colx.query('data(Phone_OptIN) ') as varchar) As Phone_OptIN,
			--@strLastAgent_ID  = cast(colx.query('data(LastAgent_ID) ') as varchar)
		From @pCustDetails.nodes('CustomerDetails') as Tabx(colx);

		Insert Into dbo.#tblCustDetails
		Select 
			(Case When (@strCustDetailId = '' OR @strCustDetailId IS NULL) Then NULL Else @strCustDetailId End) As CustDetail_ID,
			(Case When (@strBrandID = '' OR @strBrandID IS NULL) Then NULL Else @strBrandID End) As BrandID,
			(Case When (@strRecordTypeID = '' OR @strRecordTypeID IS NULL) Then NULL Else @strRecordTypeID End) As RecordType_ID,
			(Case When (@strMasterCustomerID = '' OR @strMasterCustomerID IS NULL) Then NULL Else @strMasterCustomerID End) As MasterCustomer_ID,
			cast(colx.query('data(Session_ID) ') as varchar) As Session_ID,
			cast(colx.query('data(FirstName) ') as varchar) As FirstName,
			cast(colx.query('data(LastName) ') as varchar) As LastName,
			(Case When (@strPhone = '' OR @strPhone IS NULL) Then NULL Else @strPhone End) As Phone,
			cast(colx.query('data(Email) ') as varchar) As Email,
			(Case When (@strShared = '' OR @strShared IS NULL) Then NULL Else @strShared End) As Shared,
			cast(colx.query('data(Address1) ') as varchar) As Address1,
			cast(colx.query('data(Address2) ') as varchar) As Address2,
			(Case When (@strPhone2 = '' OR @strPhone2 IS NULL) Then NULL Else @strPhone2 End) As Phone2,
			cast(colx.query('data(City) ') as varchar) As City,
			cast(colx.query('data(State) ') as varchar) As [State],
			cast(colx.query('data(Zip) ') as varchar) As Zip,
			cast(colx.query('data(Gender) ') as varchar) As Gender,
			cast(colx.query('data(DOB) ') as varchar) As DOB,
			cast(colx.query('data(Salutation) ') as varchar) As Salutation,
			cast(colx.query('data(MiddleName) ') as varchar) As MiddleName,
			cast(colx.query('data(Suffix) ') as varchar) As Suffix,
			(Case When (@strContactPreference = '' OR @strContactPreference IS NULL) Then NULL Else @strContactPreference End) As ContactPreference,
			cast(colx.query('data(Country) ') as varchar) As Country,
			cast(colx.query('data(RAPPORT_Family) ') as varchar) As RAPPORT_Family,
			cast(colx.query('data(RAPPORT_Travel) ') as varchar) As RAPPORT_Travel,
			cast(colx.query('data(RAPPORT_Hobbies) ') as varchar) As RAPPORT_Hobbies,
			cast(colx.query('data(RAPPORT_Military) ') as varchar) As RAPPORT_Military,
			cast(colx.query('data(RAPPORT_Pets) ') as varchar) As RAPPORT_Pets,
			cast(colx.query('data(RAPPORT_Weather) ') as varchar) As RAPPORT_Weather,
			cast(colx.query('data(RAPPORT_Political) ') as varchar) As RAPPORT_Political,
			cast(colx.query('data(RAPPORT_Important_Date) ') as varchar) As RAPPORT_Important_Date,
			cast(colx.query('data(RAPPORT_Health_Info) ') as varchar) As RAPPORT_Health_Info,
			(Case When(@strSmoker = '' OR @strSmoker IS NULL) Then NULL Else @strSmoker End) As Smoker,
			cast(colx.query('data(Fips) ') as varchar) As Fips,
			cast(colx.query('data(PartA_EffectiveDate) ') as varchar) As PartA_EffectiveDate,
			cast(colx.query('data(PartB_EffectiveDate) ') as varchar) As PartB_EffectiveDate,
			(Case When(@strContactPreference = '' OR @strContactPreference IS NULL) Then NULL When @strContactPreference = 'CP001' Then 1 Else 0 End) As ContactPreference_Phone,
			(Case When(@strContactPreference = '' OR @strContactPreference IS NULL) Then NULL When @strContactPreference = 'CP002' Then 1 Else 0 End) As ContactPreference_Text,
			(Case When(@strContactPreference = '' OR @strContactPreference IS NULL) Then NULL When @strContactPreference = 'CP003' Then 1 Else 0 End) As ContactPreference_Email,
			(Case When(@strContactPreference = '' OR @strContactPreference IS NULL) Then NULL When @strContactPreference = 'CP004' Then 1 Else 0 End) As ContactPreference_No_OptIN,
			cast(colx.query('data(Medicare_Number) ') as varchar) As Medicare_Number,
			(Case When (@strCampaign_ID = '' OR @strCampaign_ID IS NULL) Then NULL Else @strCampaign_ID End) As Campiagn_ID,
			(Case When (@strRecipientID = '' OR @strRecipientID IS NULL) Then NULL Else @strCampaign_ID End) As Recipient_ID,
			(Case When (@strOptout = '' OR @strOptout IS NULL) Then NULL Else @strOptout End) As Optout,
			(Case When (@strReferralID = '' OR @strReferralID IS NULL) Then NULL Else @strReferralID End) As ReferralID,
			NULL As Text_OptIN, --cast(colx.query('data(Text_OptIN) ') as varchar) As Text_OptIN,
			NULL As Email_OptIN, --cast(colx.query('data(Email_OptIN) ') as varchar) As Email_OptIN,
			NULL As Phone_OptIN, --cast(colx.query('data(Phone_OptIN) ') as varchar) As Phone_OptIN,
			--(Case When (@strLastAgent_ID = '' OR @strLastAgent_ID IS NULL) Then NULL Else @strLastAgent_ID End) As LastAgent_ID,
			cast(colx.query('data(LastAgent_ID) ') as varchar) As LastAgent_ID,
			cast(colx.query('data(Medicaid_Number) ') as varchar) As Medicaid_Number,
			cast(colx.query('data(RepName) ') as varchar) As RepName,
			cast(colx.query('data(Rep_Phone) ') as varchar) As Rep_Phone,
			cast(colx.query('data(Rep_Relationship) ') as varchar) As Rep_Relationship
		From @pCustDetails.nodes('CustomerDetails') as Tabx(colx);

		--Select * From dbo.#tblCustDetails;

		If Exists(Select 1 From dbo.#tblCustDetails Where CustDetail_ID Is Not NULL)
		Begin
			--Select Medicare_Number From dbo.#tblCustDetails Where Medicare_Number Is Not Null And Medicare_Number <> '';
			--Select Medicare_Number From dbo.Customer_Details;
			If Not Exists(Select 1 From dbo.Customer_Details Where CustDetail_ID In (Select CustDetail_ID From dbo.#tblCustDetails))
			Begin
				Select -1 As 'RowCount', 'Update Failure' As 'Status', 'CustDetail_ID not found' As 'Description';
			End
			Else If Exists (Select 1 From dbo.Customer_Details Where CustDetail_ID Not In (Select CustDetail_ID From dbo.#tblCustDetails) And Phone In (Select Phone From dbo.#tblCustDetails Where Phone Is Not Null And Phone <> ''))
			Begin
				--TODO: error
				Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Duplicate Phone number' As 'Description';
			End
			Else If Exists (Select 1 From dbo.Customer_Details Where CustDetail_ID Not In (Select CustDetail_ID From dbo.#tblCustDetails) And Medicare_Number In (Select Medicare_Number From dbo.#tblCustDetails Where Medicare_Number Is Not Null And Medicare_Number <> ''))
			Begin
				--TODO: error
				Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Duplicate Medicare number' As 'Description';
			End
			Else
			Begin
				Set @newRecord = 0;
				Select @custDetailId = CustDetail_ID From dbo.#tblCustDetails;

				--TODO: update
				Update A
				Set 
					A.BrandID = B.BrandID,
					A.RecordType_ID = B.RecordType_ID,
					A.MasterCustomer_ID = B.MasterCustomer_ID,
					A.Session_ID = B.Session_ID,
					A.FirstName = B.FirstName,
					A.LastName = B.LastName,
					A.Phone = B.Phone,
					A.Email = B.Email,
					A.Shared = B.Shared,
					A.Address1 = B.Address1,
					A.Address2 = B.Address2,
					A.Phone2 = B.Phone2,
					A.City = B.City,
					A.[State] = B.[State],
					A.Zip = B.Zip,
					A.Gender = B.Gender,
					A.DOB = B.DOB,
					A.Salutation = B.Salutation,
					A.MiddleName = B.MiddleName,
					A.Suffix = B.Suffix,
					A.ContactPreference = B.ContactPreference,
					A.Country = B.Country,
					A.RAPPORT_Family = B.RAPPORT_Family,
					A.RAPPORT_Travel = B.RAPPORT_Travel,
					A.RAPPORT_Hobbies = B.RAPPORT_Hobbies,
					A.RAPPORT_Military = B.RAPPORT_Military,
					A.RAPPORT_Pets = B.RAPPORT_Pets,
					A.RAPPORT_Weather = B.RAPPORT_Weather,
					A.RAPPORT_Political = B.RAPPORT_Political,
					A.RAPPORT_Important_Date = B.RAPPORT_Important_Date,
					A.RAPPORT_Health_Info = B.RAPPORT_Health_Info,
					A.Smoker = B.Smoker,
					A.Fips = B.Fips,
					A.PartA_EffectiveDate = B.PartA_EffectiveDate,
					A.PartB_EffectiveDate = B.PartB_EffectiveDate,
					A.ContactPreference_Text = B.ContactPreference_Text,
					A.ContactPreference_Phone = B.ContactPreference_Phone,
					A.ContactPreference_No_OptIN = B.ContactPreference_No_OptIN,
					A.Medicare_Number = B.Medicare_Number,
					A.Campaign_ID = B.Campaign_ID,
					A.RecipientID = B.RecipientID,
					A.Optout = B.Optout,
					A.ReferralID = B.ReferralID,
					A.Text_OptIN = B.Text_OptIN,
					A.Email_OptIN = B.Email_OptIN,
					A.Phone_OptIN = B.Phone_OptIN,
					--A.LastAgent_ID = B.LastAgent_ID,
					A.Medicaid_Number = B.Medicaid_Number,
					A.RepName = B.RepName,
					A.Rep_Phone = B.Rep_Phone,
					A.Rep_Relationship = B.Rep_Relationship
				From dbo.Customer_Details A
				Inner Join dbo.#tblCustDetails B
				On A.CustDetail_ID = B.CustDetail_ID;

				Select @@ROWCOUNT As 'RowCount', 'Update Success' As [Status], ('NewRecord:' + Cast(@newRecord as varchar) + '|CustDetail_ID:' + CAST(@custDetailId As varchar)) As [Description];
			End
		End
		Else
		Begin
			--Select @strPhone;
			--Select Medicare_Number From dbo.#tblCustDetails Where Medicare_Number Is Not Null And Medicare_Number <> '';
			--Select Medicare_Number From dbo.Customer_Details;
			If Exists (Select 1 From dbo.Customer_Details Where Phone In (Select Phone From dbo.#tblCustDetails Where Phone Is Not Null And Phone <> ''))
			Begin
				--TODO: error
				Select -1 As 'RowCount', 'Add Failure' As 'Status', 'Duplicate Phone number' As 'Description';
			End
			Else If Exists (Select 1 From dbo.Customer_Details Where Medicare_Number In (Select Medicare_Number From dbo.#tblCustDetails Where Medicare_Number Is Not Null And Medicare_Number <> ''))
			Begin
				--TODO: error
				Select -1 As 'RowCount', 'Add Failure' As 'Status', 'Duplicate Medicare number' As 'Description';
			End
			Else
			Begin
				Set @newRecord = 1;
				
				Select @custDetailId = (Coalesce(MAX(CustDetail_ID), 0) + 1) From dbo.Customer_Details;
				--Print @custDetailId;
				Set Identity_Insert dbo.Customer_Details On;

				Insert Into dbo.Customer_Details(
				CustDetail_ID,BrandID,RecordType_ID,MasterCustomer_ID,Session_ID,FirstName,LastName,Phone,Email,Shared,Address1,Address2,Phone2,City,[State],Zip,
				Gender,DOB,Salutation,MiddleName,Suffix,ContactPreference,Country,RAPPORT_Family,RAPPORT_Travel,RAPPORT_Hobbies,RAPPORT_Military,RAPPORT_Pets,
				RAPPORT_Weather,RAPPORT_Political,RAPPORT_Important_Date,RAPPORT_Health_Info,Smoker,Fips,PartA_EffectiveDate,PartB_EffectiveDate,ContactPreference_Phone,
				ContactPreference_Text,ContactPreference_Email,ContactPreference_No_OptIN,Medicare_Number,Campaign_ID,RecipientID,Optout,ReferralID,Text_OptIN,Email_OptIN,
				Phone_OptIN,LastAgent_ID,Medicaid_Number,RepName,Rep_Phone,Rep_Relationship)
				Select
					@custDetailId,
					BrandID,
					RecordType_ID,
					MasterCustomer_ID,
					Session_ID,
					FirstName,
					LastName,
					Phone,
					Email,
					Shared,
					Address1,
					Address2,
					Phone2,
					City,
					[State],
					Zip,
					Gender,
					DOB,
					Salutation,
					MiddleName,
					Suffix,
					ContactPreference,
					Country,
					RAPPORT_Family,
					RAPPORT_Travel,
						RAPPORT_Hobbies,
					RAPPORT_Military,
					RAPPORT_Pets,
					RAPPORT_Weather,
					RAPPORT_Political,
					RAPPORT_Important_Date,
					RAPPORT_Health_Info,
					Smoker,
					Fips,
					PartA_EffectiveDate,
					PartB_EffectiveDate,
					ContactPreference_Phone,
					ContactPreference_Text,
					ContactPreference_Email,
					ContactPreference_No_OptIN,
					Medicare_Number,
					Campaign_ID,
					RecipientID,
					Optout,
					ReferralID,
					--Text_OptIN,
					--Email_OptIN,
					--Phone_OptIN,
					NULL,
					NULL,
					NULL,
					LastAgent_ID,
					Medicaid_Number,
					RepName,
					Rep_Phone,
					Rep_Relationship 
				From dbo.#tblCustDetails;

				Select @@ROWCOUNT As [RowCount], 'Add Success' As [Status], ('NewRecord:' + Cast(@newRecord as varchar) + '|CustDetail_ID:' + CAST(@custDetailId As varchar)) As [Description];
			End
		End

		Drop Table dbo.#tblCustDetails;

		-- since IMPLICIT TRANSACTION is ON by default to a COMMIT for the above DROP statement
		Commit Tran; 
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )

		--Begin

		Rollback Tran;

		--End
		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10);
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[uspSaveCustomerLead]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Select * From dbo.Customer_Leads;
--exec [dbo].[uspSaveCustomerLead] '<CustomerLeads><CustLead_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>0</CustDetail_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueSubID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><SubIssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PrevCaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusID>1</CaseStatusID><CreatedDate>2022-07-01T00:00:00</CreatedDate><LastUpdate>2022-09-23</LastUpdate><PrevTier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Tier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AssignedAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Classification p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Urgency p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ImpactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MedicareCVG6MT_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerLeads>'
--exec [dbo].[uspSaveCustomerLead] '<CustomerLeads><CustLead_ID>1</CustLead_ID><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>3</CustDetail_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueSubID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><SubIssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PrevCaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusID>0</CaseStatusID><CreatedDate>2022-01-01T00:00:00</CreatedDate><LastUpdate>2022-06-01</LastUpdate><PrevTier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Tier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AssignedAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Classification p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Urgency p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ImpactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MedicareCVG6MT_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerLeads>'
--exec [dbo].[uspSaveCustomerLead] '<CustomerLeads><CustLead_ID>1</CustLead_ID><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>3</CustDetail_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueSubID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><SubIssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PrevCaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusCode>OC001</CaseStatusCode><CreatedDate>2022-01-01T00:00:00</CreatedDate><LastUpdate>2022-06-01</LastUpdate><PrevTier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Tier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AssignedAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Classification p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Urgency p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ImpactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MedicareCVG6MT_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerLeads>'
--exec [dbo].[uspSaveCustomerLead] '<CustomerLeads><CustLead_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>5</CustDetail_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueSubID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><SubIssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PrevCaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusCode>OC001</CaseStatusCode><CreatedDate>2022-11-10T00:00:00</CreatedDate><PrevTier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Tier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AssignedAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Classification p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Urgency p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ImpactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MedicareCVG6MT_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerLeads>'
--exec [dbo].[uspSaveCustomerLead] '<CustomerLeads><CustLead_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>27</CustDetail_ID><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID>1</AgentMaster_ID><AgentName>Cooper, Ryan </AgentName><PreIssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueSubID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><SubIssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PrevCaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusCode>OC001</CaseStatusCode><CreatedDate>2022-12-20T13:26:13.1839702+05:30</CreatedDate><PrevTier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Tier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AssignedAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Classification p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Urgency p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ImpactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MedicareCVG6MT_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerLeads>'
--exec [dbo].[uspSaveCustomerLead] '<CustomerLeads><CustLead_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><BrandID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustDetail_ID>24</CustDetail_ID><CustomerName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustomerAddressZip p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ContactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AgentMaster_ID>1</AgentMaster_ID><AgentName>Cooper, Ryan </AgentName><PreIssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><IssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PreIssueSubID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><SubIssueID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PrevCaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseStatusCode>OC001</CaseStatusCode><CreatedDate>2022-12-20T15:19:45.0565866+05:30</CreatedDate><CreatedDateString>2022-12-20</CreatedDateString><LastUpdate p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PrevTier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Notes p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Tier p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><AssignedAgent_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><PriorityID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Classification p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Urgency p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><ImpactID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CaseType p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><RuleTicker p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Session_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><EnrolledMedicareAB p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MedicareCVG6mt p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><MedicareCVG6MT_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /></CustomerLeads>'
CREATE Procedure [dbo].[uspSaveCustomerLead]
(
	@pCustLead Xml
)
As
Begin
	Begin Try
		Begin Tran;

		Declare @newRecord bit;
		--print cast(@pCustLead as nvarchar(4000));

		Create Table dbo.#tblCustLead
		(
			CustLead_ID bigint NULL, 
			BrandID varchar(50) NULL, 
			CustDetail_ID bigint NULL, 
			ContactID bigint NULL, 
			Source_TFN bigint NULL,
			AgentMaster_ID bigint NULL, 
			AgentName varchar(100) NULL,
			PreIssueType varchar(10) NULL, 
			IssueType varchar(10) NULL, 
			PreIssueID varchar(10) NULL, 
			IssueID varchar(10) NULL, 
			PreIssueSubID varchar(10) NULL, 
			SubIssueID varchar(10) NULL, 
			PrevCaseStatusID varchar(10) NULL, 
			CaseStatusID int NULL, 
			CaseStatusCode varchar(10) NULL,
			CreatedDateString varchar(20) NULL, 
			LastUpdate varchar(20) NULL, 
			PrevTier varchar(10) NULL, 
			Notes nvarchar(1000) NULL, 
			Tier varchar(10) NULL, 
			AssignedAgent_ID float NULL, 
			PriorityID varchar(10) NULL, 
			ClassificationID varchar(10) NULL, 
			Urgency varchar(10) NULL, 
			ImpactID varchar(10) NULL, 
			CaseType varchar(10) NULL, 
			RuleTicker nvarchar(50) NULL, 
			Session_ID varchar(250) NULL, 
			EnrolledMedicareAB varchar(25) NULL, 
			MedicareCVG6mt varchar(25) NULL, 
			MedicareCVG6MT_Date varchar(20) NULL
		);

		--Select Cast(@pCustLead.query('data(/CustomerLeads/CustLead_ID)') As varchar);
		--Select Cast(colx.query('data(CustLead_ID)') As varchar) From @pCustLead.nodes('CustomerLeads') as Tabx(colx);

		Declare @custLeadId bigint, @custDetail_ID bigint, @caseStatusID bigint, @brandID varchar(10), @contactID varchar(10), 
		@agentMaster_ID varchar(10), @preIssueType varchar(10), 
		@issueType varchar(10), @preIssueID varchar(10), @issueID varchar(10), @subIssueID varchar(10), @prevCaseStatusID varchar(10), 
		@tier varchar(10), @assignedAgent_ID varchar(10), @priorityID varchar(10), @classificationID varchar(10), @urgency varchar(10), @impactID varchar(10), 
		@caseType varchar(10);
		Declare @strCustLeadId varchar(10), @strBrandID varchar(10), @strCustDetailID varchar(10), @strContactID varchar(10), @strSourceTFN varchar(20), 
		@strAgentMasterID varchar(10), 
		@strPreIssueType varchar(10), @strIssueType varchar(10), @strPreIssueID varchar(10), @strIssueID varchar(10), @strSubIssueID varchar(10), 
		@strPrevCaseStatusID varchar(10), @caseStatusCode varchar(10), @strTier varchar(10), @strAssignedAgent_ID varchar(10), @strPriorityID varchar(10), 
		@strClassificationID varchar(10), @strUrgency varchar(10), @strImpactID varchar(10), @strCaseType varchar(10);
		Select 
			@strCustLeadId = cast(colx.query('data(CustLead_ID) ') as varchar),
			@strBrandID = cast(colx.query('data(BrandID) ') as varchar),
			@strCustDetailID = cast(colx.query('data(CustDetail_ID) ') as varchar),
			@strContactID = cast(colx.query('data(ContactID) ') as varchar),
			@strSourceTFN = cast(colx.query('data(Source_TFN) ') as varchar),
			@strAgentMasterID = cast(colx.query('data(AgentMaster_ID) ') as varchar),
			@strPreIssueType = cast(colx.query('data(PreIssueType) ') as varchar),
			@strPreIssueID = cast(colx.query('data(PreIssueID) ') as varchar),
			@strIssueID = cast(colx.query('data(IssueID) ') as varchar),
			@strSubIssueID = cast(colx.query('data(SubIssueID) ') as varchar),
			@strPrevCaseStatusID = cast(colx.query('data(PrevCaseStatusID) ') as varchar),
			@caseStatusCode = cast(colx.query('data(CaseStatusCode) ') as varchar),
			@strTier = cast(colx.query('data(Tier) ') as varchar),
			@strAssignedAgent_ID = cast(colx.query('data(AssignedAgent_ID) ') as varchar),
			--cast(colx.query('data(Text_OptIN) ') as varchar) As Text_OptIN,
			--cast(colx.query('data(Email_OptIN) ') as varchar) As Email_OptIN,
			--cast(colx.query('data(Phone_OptIN) ') as varchar) As Phone_OptIN,
			@strPriorityID  = cast(colx.query('data(PriorityID) ') as varchar),
			@strClassificationID  = cast(colx.query('data(ClassificationID) ') as varchar),
			@strUrgency  = cast(colx.query('data(Urgency) ') as varchar),
			@strImpactID  = cast(colx.query('data(ImpactID) ') as varchar),
			@strCaseType  = cast(colx.query('data(CaseType) ') as varchar)
		From @pCustLead.nodes('CustomerLeads') as Tabx(colx);

		--Select @strCustLeadId + '|' + @strCustDetailID;
		--Select cast(colx.query('data(AgentName) ') as varchar) From @pCustLead.nodes('CustomerLeads') as Tabx(colx);
		print 1;

		Insert into dbo.#tblCustLead(
				CustLead_ID, BrandID, CustDetail_ID, ContactID, Source_TFN, AgentMaster_ID, AgentName, 
				PreIssueType, IssueType, PreIssueID, IssueID, PreIssueSubID, SubIssueID, PrevCaseStatusID, CaseStatusID, 
				CaseStatusCode, 
				CreatedDateString, 
				LastUpdate, 
				PrevTier, Notes, Tier, 
				AssignedAgent_ID, PriorityID, ClassificationID, 
				Urgency, ImpactID, CaseType, 
				RuleTicker, Session_ID, EnrolledMedicareAB, 
				MedicareCVG6mt, MedicareCVG6MT_Date
				)
		Select 
			(Case When (@strCustLeadID = '' OR @strCustLeadID IS NULL) Then Null Else @strCustLeadID End) As CustLead_ID, 
			(Case When (@strBrandID = '' OR @strBrandID IS NULL) Then Null Else @strBrandID End) As BrandID, 
			(Case When (@strCustDetailID = '' OR @strCustDetailID IS NULL) Then Null Else @strCustDetailID End) As CustDetail_ID, 
			(Case When (@strContactID = '' OR @strContactID IS NULL) Then Null Else @strContactID End) As ContactID, 
			(Case When (@strSourceTFN = '' OR @strSourceTFN IS NULL) Then Null Else @strSourceTFN End) As Source_TFN, 
			(Case When (@strAgentMasterID = '' OR @strAgentMasterID IS NULL) Then Null Else @strAgentMasterID End) As AgentMaster_ID, 
			cast(colx.query('data(AgentName) ') as varchar(50)) As AgentName, 
			--NULL,
			(Case When (@strPreIssueType = '' OR @strPreIssueType IS NULL) Then Null Else @strPreIssueType End) As PreIssueType, 
			(Case When (@strIssueType = '' OR @strIssueType IS NULL) Then Null Else @strIssueType End) As IssueType, 
			(Case When (@strPreIssueID = '' OR @strPreIssueID IS NULL) Then Null Else @strPreIssueID End) As PreIssueID, 
			(Case When (@strIssueID = '' OR @strIssueID IS NULL) Then Null Else @strIssueID End) As IssueID, 
			--(Case When (@strPreIssueSubID = '' OR @strPreIssueSubID IS NULL) Then Null Else @strPreIssueSubID End) As PreIssueSubID, 
			cast(colx.query('data(PreIssueSubID) ') as varchar) As PreIssueSubID, 
			(Case When (@strSubIssueID = '' OR @strSubIssueID IS NULL) Then Null Else @strSubIssueID End) As SubIssueID, 
			(Case When (@strPrevCaseStatusID = '' OR @strPrevCaseStatusID IS NULL) Then Null Else @strPrevCaseStatusID End) As PrevCaseStatusID, 
			NULL As CaseStatusID,
			(Case When (@caseStatusCode = '' OR @caseStatusCode IS NULL) Then Null Else @caseStatusCode End) As CaseStatusCode, 
			cast(colx.query('data(CreatedDateString) ') as varchar) As CreatedDateString, 
			cast(colx.query('data(LastUpdate) ') as varchar) As LastUpdate, 
			cast(colx.query('data(PrevTier) ') as varchar) As PrevTier, 
			cast(colx.query('data(Notes) ') as varchar) As Notes, 
			(Case When (@strTier = '' OR @strTier IS NULL) Then Null Else @strTier End) As Tier, 
			(Case When (@strAssignedAgent_ID = '' OR @strAssignedAgent_ID IS NULL) Then Null Else @strAssignedAgent_ID End) As AssignedAgent_ID, 
			(Case When (@strPriorityID = '' OR @strPriorityID IS NULL) Then Null Else @strPriorityID End) As PriorityID, 
			(Case When (@strClassificationID = '' OR @strClassificationID IS NULL) Then Null Else @strClassificationID End) As ClassificationID, 
			(Case When (@strUrgency = '' OR @strUrgency IS NULL) Then Null Else @strUrgency End) As Urgency, 
			(Case When (@strImpactID = '' OR @strImpactID IS NULL) Then Null Else @strImpactID End) As ImpactID, 
			(Case When (@strCaseType = '' OR @strCaseType IS NULL) Then Null Else @strCaseType End) As CaseType, 
			cast(colx.query('data(RuleTicker) ') as varchar) As RuleTicker, 
			cast(colx.query('data(Session_ID) ') as varchar) As Session_ID, 
			cast(colx.query('data(EnrolledMedicareAB) ') as varchar) As EnrolledMedicareAB, 
			cast(colx.query('data(MedicareCVG6mt) ') as varchar) As MedicareCVG6mt, 
			cast(colx.query('data(MedicareCVG6MT_Date) ') as varchar) As MedicareCVG6MT_Date
		From @pCustLead.nodes('CustomerLeads') as Tabx(colx);

		Declare @caseStatus_OpenValue varchar(10), @caseStatus_ClosedValue varchar(10);
		Select
			@caseStatus_OpenValue = CodeVal
		From dbo.CRM_LookupMaster Where DataGroup='OpenClosed' And TxtVal='Open';
		Select
			@caseStatus_ClosedValue = CodeVal
		From dbo.CRM_LookupMaster Where DataGroup='OpenClosed' And TxtVal='Closed';

		Update dbo.#tblCustLead
		Set CaseStatusID = (Case When CaseStatusCode=@caseStatus_OpenValue Then 1 When CaseStatusCode=@caseStatus_ClosedValue Then 0 End);

		--Select * From dbo.#tblCustLead;

		Select
			@custLeadId = CustLead_ID,
			@custDetail_ID = CustDetail_ID,
			@caseStatusID = CaseStatusID,
			@caseStatusCode = CaseStatusCode
		From
			dbo.#tblCustLead;

		--Print Cast(@custLeadId as Varchar);
		--Print Cast(@custDetail_ID as Varchar);
		--Print Cast(@caseStatusID as Varchar);

		If Exists(Select 1 From dbo.#tblCustLead Where CustLead_ID Is Not NULL)
		Begin
			If Not Exists(Select 1 From dbo.Customer_Leads Where CustLead_ID = @custLeadId)
			Begin
				Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Customer Lead not found' As 'Description';
			End
			Else If Exists (Select 1 From dbo.Customer_Leads Where CustLead_ID <> @custLeadId And CustDetail_ID = @custDetail_ID And CaseStatusCode = @caseStatusCode And @caseStatusCode = @caseStatus_OpenValue)
			Begin
				--TODO: error
				Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Duplicate Case Status for same Customer' As 'Description';
			End
			--Else If Exists (Select 1 From dbo.Customer_Details Where CustDetail_ID Not In (Select CustDetail_ID From dbo.#tblCustDetails) And Medicare_Number In (Select Medicare_Number From dbo.#tblCustDetails Where Medicare_Number Is Not Null And Medicare_Number <> ''))
			--Begin
			--	--TODO: error
			--	Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Duplicate Medicare number' As 'Description';
			--End
			Else
			Begin
				Set @newRecord = 0;
				Select @custLeadId = CustLead_ID From dbo.#tblCustLead;

				--TODO: update
				Update A
				Set 
					--A.CustLead_ID=B.CustLead_ID, 
					A.BrandID=B.BrandID, 
					A.CustDetail_ID=B.CustDetail_ID, 
					A.ContactID=B.ContactID, 
					A.Source_TFN=B.Source_TFN,
					--A.AgentMaster_ID=B.AgentMaster_ID, 
					A.PreIssueType=B.PreIssueType, 
					A.IssueType=B.IssueType, 
					A.PreIssueID=B.PreIssueID, 
					A.IssueID=B.IssueID, 
					A.PreIssueSubID=B.PreIssueSubID, 
					A.SubIssueID=B.SubIssueID, 
					A.PrevCaseStatusID=B.PrevCaseStatusID, 
					A.CaseStatusID=B.CaseStatusID, 
					A.CaseStatusCode=B.CaseStatusCode,
					--A.CreatedDate=B.CreatedDateString, 
					A.LastUpdate=B.LastUpdate, 
					A.PrevTier=B.PrevTier, 
					A.Notes=B.Notes, 
					A.Tier=B.Tier, 
					A.AssignedAgent_ID=B.AssignedAgent_ID, 
					A.PriorityID=B.PriorityID, 
					A.ClassificationID=B.ClassificationID, 
					A.Urgency=B.Urgency, 
					A.ImpactID=B.ImpactID, 
					A.CaseType=B.CaseType, 
					A.RuleTicker=B.RuleTicker, 
					A.Session_ID=B.Session_ID, 
					A.EnrolledMedicareAB=B.EnrolledMedicareAB, 
					A.MedicareCVG6mt=B.MedicareCVG6mt, 
					A.MedicareCVG6MT_Date=B.MedicareCVG6MT_Date 
				From dbo.Customer_Leads A
				Inner Join dbo.#tblCustLead B
				On A.CustLead_ID = B.CustLead_ID;

				Select @@ROWCOUNT As 'RowCount', 'Update Success' As 'Status', ('NewRecord:' + Cast(@newRecord as varchar) + '|CustLead_ID:' + CAST(@custLeadId As varchar)) As [Description];
			End
		End
		Else
		Begin
			If Exists (Select 1 From dbo.Customer_Leads Where CustDetail_ID = @custDetail_ID And CaseStatusCode = @caseStatus_OpenValue And @caseStatusCode = @caseStatus_OpenValue)
			Begin
				--TODO: error
				Select -1 As 'RowCount', 'Add Failure' As 'Status', 'Cannot have more than 1 open case for the Customer' As 'Description';
			End
			--Else If Exists (Select 1 From dbo.Customer_Leads Where Medicare_Number In (Select Medicare_Number From dbo.#tblCustDetails Where Medicare_Number Is Not Null And Medicare_Number <> ''))
			--Begin
			--	--TODO: error
			--	Select -1 As 'RowCount', 'Insert Failure' As 'Status', 'Duplicate Medicare number' As 'Description';
			--End
			Else
			Begin
				Set @newRecord = 1;

				--Declare @newCustLeadId bigint;
				--Select @newCustLeadId = (Case When CustLead_ID IS NULL Then 1 Else CustLead_ID End) from dbo.Customer_Leads Order By CustLead_ID Desc;
				--Set @newCustLeadId = @newCustLeadId + 1;
				Select @custLeadId = (Coalesce(MAX(CustLead_ID),0) + 1) from dbo.Customer_Leads;
				
				Declare @rowCnt int; Set @rowCnt = -1;

				Set Identity_Insert dbo.Customer_Leads On;

				Insert into dbo.Customer_Leads(
				CustLead_ID, BrandID, CustDetail_ID, ContactID, Source_TFN, AgentMaster_ID, AgentName, 
				PreIssueType, IssueType, PreIssueID, IssueID, PreIssueSubID, SubIssueID, PrevCaseStatusID, CaseStatusID, 
				CaseStatusCode, CreatedDate, LastUpdate, PrevTier, Notes, Tier, AssignedAgent_ID, PriorityID, ClassificationID, Urgency, ImpactID, CaseType, RuleTicker, Session_ID, EnrolledMedicareAB, 
				MedicareCVG6mt, MedicareCVG6MT_Date)
				Select	
				@custLeadId, BrandID, CustDetail_ID, ContactID, Source_TFN, AgentMaster_ID, AgentName, 
				PreIssueType, IssueType, PreIssueID, IssueID, PreIssueSubID, SubIssueID, PrevCaseStatusID, CaseStatusID, 
				CaseStatusCode, CreatedDateString, LastUpdate, PrevTier, Notes, Tier, AssignedAgent_ID, PriorityID, ClassificationID, Urgency, ImpactID, CaseType, RuleTicker, Session_ID, EnrolledMedicareAB, 
				MedicareCVG6mt, MedicareCVG6MT_Date
				From dbo.#tblCustLead;

				Set @rowCnt = @@ROWCOUNT;
				print @@ROWCOUNT;
				print @rowCnt;

				Set Identity_Insert dbo.Customer_Leads Off;

				--Set Identity_Insert dbo.Call_Interactions On;

				--Declare @callInteractionId bigint;
				--Select @callInteractionId = (MAX(CallInteraction_ID) + 1) from dbo.Call_Interactions;

				--Insert into dbo.Call_Interactions(
				--CallInteraction_ID, CustLead_ID, AgentMaster_ID, AgentName, InteractionDate, PrevIssueType, IssueType, PrevSubIssueID, SubIssueID, PrevCaseStatusID, CaseStatusID, 
				--PrevTierID, TierID, UrgencyID, ImpactID) 
				--Select 
				--@callInteractionId, @custLeadId, AgentMaster_ID, AgentName, PreIssueType, IssueType, PreIssueSubID, SubIssueID, PrevCaseStatusID, CaseStatusID, 
				--PrevTier, Tier, Urgency, ImpactID
				--From dbo.#tblCustLead;

				--Set Identity_Insert dbo.Call_Interactions Off;

				Select @rowCnt As 'RowCount', 'Add Success' As 'Status', ('NewRecord:' + Cast(@newRecord as varchar) + '|CustLead_ID:' + CAST(@custLeadId As varchar)) As [Description]; -- + '|CallInteraction_ID:' + CAST(@callInteractionId As varchar)) As [Description];
			End
		End

		Drop Table dbo.#tblCustLead;

		-- since IMPLICIT TRANSACTION is ON by default to a COMMIT for the above DROP statement
		Commit Tran; 
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )

		--Begin

		Rollback Tran;

		--End
		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10);
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[uspSaveCustomerQuotation]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Select * From dbo.Customer_Quotation
--exec [dbo].[uspSaveCustomerQuotation] '<CustomerQuotation><CustQuote_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustLead_ID>2</CustLead_ID><Carrier>HealthTeam Advantage</Carrier><Coverage_Amount>22000.00</Coverage_Amount><Effective_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Effective_DateString>0001-01-01</Effective_DateString><PlanID>0</PlanID><Plan_Name>HealthTeam Advantage Plan I</Plan_Name><Quoted_PlanType>PPO</Quoted_PlanType><Quoted_PolicyType>MA</Quoted_PolicyType><Quoted_Rate>540.00</Quoted_Rate><SNP>123</SNP><CustDetail_ID>2</CustDetail_ID><Quotation_Date p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Quotation_DateString>0001-01-01</Quotation_DateString><CallInteraction_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Tenant_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Status>DS004</Status></CustomerQuotation>'
--exec [dbo].[uspSaveCustomerQuotation] '<CustomerQuotation><CustQuote_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustLead_ID>2</CustLead_ID><Carrier>BlueCross</Carrier><Coverage_Amount>5000.00</Coverage_Amount><Effective_Date>2023-02-24T19:29:18.9130556+05:30</Effective_Date><Effective_DateString>2023-02-24</Effective_DateString><PlanID>7</PlanID><Plan_Name>Blue Medicare Essential</Plan_Name><Quoted_PlanType>HMO</Quoted_PlanType><Quoted_PolicyType>MA</Quoted_PolicyType><Quoted_Rate>60.00</Quoted_Rate><SNP>123</SNP><CustDetail_ID>2</CustDetail_ID><Quotation_Date>2023-02-24T19:29:32.4509355+05:30</Quotation_Date><Quotation_DateString>2023-02-24</Quotation_DateString><CallInteraction_ID>35</CallInteraction_ID><Tenant_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Status>DS004</Status></CustomerQuotation>'
--exec [dbo].[uspSaveCustomerQuotation] '<CustomerQuotation><CustQuote_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustLead_ID>2</CustLead_ID><Carrier>BlueCross</Carrier><Coverage_Amount>5000.00</Coverage_Amount><Effective_Date>2023-02-24T19:45:41.9048144+05:30</Effective_Date><Effective_DateString>2023-02-24</Effective_DateString><PlanID>6</PlanID><Plan_Name>Blue Medicare Freedom+</Plan_Name><Quoted_PlanType>PPO</Quoted_PlanType><Quoted_PolicyType>MA</Quoted_PolicyType><Quoted_Rate>69.00</Quoted_Rate><SNP>123</SNP><CustDetail_ID>2</CustDetail_ID><Quotation_Date>2023-02-24T19:45:41.9048144+05:30</Quotation_Date><Quotation_DateString>2023-02-24</Quotation_DateString><CallInteraction_ID>37</CallInteraction_ID><Tenant_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Status>DS004</Status></CustomerQuotation>'
--exec [dbo].[uspSaveCustomerQuotation] '<CustomerQuotation><CustQuote_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><CustLead_ID>2</CustLead_ID><Carrier>United Healthcare</Carrier><Coverage_Amount>15000.00</Coverage_Amount><Effective_Date>2023-02-24T21:59:19.9376871+05:30</Effective_Date><Effective_DateString>2023-02-24</Effective_DateString><PlanID>4</PlanID><Plan_Name>AARP Medicare Advantage Patriot</Plan_Name><Quoted_PlanType>HMO-POS</Quoted_PlanType><Quoted_PolicyType>MA</Quoted_PolicyType><Quoted_Rate>199.00</Quoted_Rate><SNP>123</SNP><CustDetail_ID>2</CustDetail_ID><Quotation_Date>2023-02-24T21:59:19.9376871+05:30</Quotation_Date><Quotation_DateString>2023-02-24</Quotation_DateString><CallInteraction_ID>41</CallInteraction_ID><Tenant_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Status>DS004</Status></CustomerQuotation>'
CREATE Procedure [dbo].[uspSaveCustomerQuotation]
(
	@pCustQuotation Xml
)
As
 Begin
	Begin Try
		Begin Tran;

		Create Table dbo.#tblCustQuotation
		(
		    CustQuote_ID bigint NULL,
			CustDetail_ID bigint NULL,
			CustLead_ID bigint NULL,
			CallInteraction_ID bigint NULL,
			Carrier varchar(50) NULL,
			CopayBase_Riders varchar(50) NULL,
			Coverage_Amount varchar(20) NULL,
			Effective_Date datetime NULL,
			Info_ProviderMethod varchar(20) NULL,
			LocationSpecified_Options varchar(200) NULL,
			Plan_ID bigint NULL,
			Plan_Name varchar(200) NULL,
			Quoted_PlanType varchar(20) NULL,
			Quoted_PolicyType varchar(20) NULL,
			Quoted_Rate varchar(20) NULL,
			Riders varchar(2000) NULL,
			SNP varchar(200) NULL,
			Enrolled tinyint NULL,
			[Status] varchar(100) NULL,
			Quotation_Date datetime NULL,
			Tenant_ID int NULL
		);

		Declare @custQuote_ID int, @custLead_ID int,@custDetail_ID int, @enrolled int, @callInteraction_ID int, @tenant_ID int;
		Declare @strCustQuote_ID varchar(10),@strCustLead_ID varchar(10),@strCustDetail_ID varchar(10), @strEnrolled varchar(10), 
		@strCallInteraction_ID varchar(10), @strTenant_ID varchar(10), @strPlanID varchar(20);
		
		Select 
			@strCustQuote_ID = cast(colx.query('data(CustQuote_ID)') as varchar),
			@strCustLead_ID = cast(colx.query('data(CustLead_ID)') as varchar),
			@strCustDetail_ID = cast(colx.query('data(CustDetail_ID) ') as varchar),
			@strEnrolled = cast(colx.query('data(Enrolled) ') as varchar),
			@strCallInteraction_ID = cast(colx.query('data(CallInteraction_ID) ') as varchar),
			@strTenant_ID = cast(colx.query('data(Tenant_ID) ') as varchar),
			@strPlanID = cast(colx.query('data(PlanID) ') as varchar)
		From @pCustQuotation.nodes('CustomerQuotation') as Tabx(colx);

		Insert Into dbo.#tblCustQuotation
		Select 
			(Case When (@strCustQuote_ID = '' OR @strCustQuote_ID IS NULL) Then NULL Else @strCustQuote_ID End) As CustQuote_ID,
			(Case When (@strCustDetail_ID = '' OR @strCustDetail_ID IS NULL) Then NULL Else @strCustDetail_ID End) As CustDetail_ID,
			(Case When (@strCustLead_ID = '' OR @strCustLead_ID IS NULL) Then NULL Else @strCustLead_ID End) As CustLead_ID,
			(Case When (@strCallInteraction_ID = '' OR @strCallInteraction_ID IS NULL) Then NULL Else @strCallInteraction_ID End) As CallInteraction_ID,
			cast(colx.query('data(Carrier) ') as varchar) As Carrier,
			cast(colx.query('data(CopayBase_Riders) ') as varchar) As CopayBase_Riders,
			cast(colx.query('data(Coverage_Amount) ') as varchar) As Coverage_Amount,
			cast(colx.query('data(Effective_DateString) ') as varchar) As Effective_Date,
			cast(colx.query('data(Info_ProviderMethod) ') as varchar) As Info_ProviderMethod,
			cast(colx.query('data(LocationSpecified_Options) ') as varchar) As LocationSpecified_Options,
			(Case When (@strPlanID = '' OR @strPlanID IS NULL) Then NULL Else @strPlanID End) As Plan_ID,
			cast(colx.query('data(Plan_Name) ') as varchar(100)) As Plan_Name,
			cast(colx.query('data(Quoted_PlanType) ') as varchar) As Quoted_PlanType,
			cast(colx.query('data(Quoted_PolicyType) ') as varchar) As Quoted_PolicyType,
			cast(colx.query('data(Quoted_Rate) ') as varchar) As Quoted_Rate,
			cast(colx.query('data(Riders) ') as varchar) As Riders,
			cast(colx.query('data(SNP) ') as varchar) As SNP,
			(Case When (@strEnrolled = '' OR @strEnrolled IS NULL) Then NULL Else @strEnrolled End) As Enrolled,
			cast(colx.query('data(Status) ') as varchar) As [Status],
			cast(colx.query('data(Quotation_DateString) ') as varchar) As Quotation_Date,
			(Case When (@strTenant_ID = '' OR @strTenant_ID IS NULL) Then NULL Else @strTenant_ID End) As Tenant_ID--,
		From @pCustQuotation.nodes('CustomerQuotation') as Tabx(colx);

		--Select * From dbo.#tblCustQuotation;

		If Exists(Select 1 From dbo.#tblCustQuotation Where CustQuote_ID Is Not NULL)
		Begin
			If Not Exists(Select 1 From dbo.Customer_Quotation Where CustQuote_ID In (Select CustQuote_ID From dbo.#tblCustQuotation))
			Begin
				Select -1 As 'RowCount', 'Update Failure' As 'Status', 'CustQuote_ID not found' As 'Description';
			End
			Else
			Begin
				Update A
				Set 
					A.CustLead_ID = B.CustLead_ID,
					A.Carrier = B.Carrier,
					A.CopayBase_Riders = B.CopayBase_Riders,
					A.Coverage_Amount = B.Coverage_Amount,
					A.Effective_Date = B.Effective_Date,
					A.Info_ProviderMethod = B.Info_ProviderMethod,
					A.LocationSpecified_Options = B.LocationSpecified_Options,
					A.Plan_ID = B.Plan_ID,
					A.Plan_Name = B.Plan_Name,
					A.Quoted_PlanType  = B.Quoted_PlanType,
					A.Quoted_PolicyType = B.Quoted_PolicyType,
					A.Quoted_Rate = B.Quoted_Rate,
					A.Riders = B.Riders,
					A.SNP = B.SNP,
					A.CustDetail_ID = B.CustDetail_ID,
					A.Enrolled = B.Enrolled,
					A.CallInteraction_ID = B.CallInteraction_ID,
					A.[Status] = B.[Status],
					A.Quotation_Date = B.Quotation_Date,
					A.[Tenant_ID] = B.[Tenant_ID]
				From dbo.Customer_Quotation A
				Inner Join dbo.#tblCustQuotation B
				On A.CustQuote_ID = B.CustQuote_ID;

				Select @@ROWCOUNT As 'RowCount', 'Update Success' As 'Status', @strCustQuote_ID As 'Description';
			End
		End
		Else
		Begin
			Set Identity_Insert dbo.Customer_Quotation On;

			Declare @custQuoteId bigint, @rowCnt bigint;
			Select @custQuoteId = (Coalesce(Max(CustQuote_ID), 0) + 1) From dbo.Customer_Quotation;

			--Print @custQuoteId;

			Insert Into dbo.Customer_Quotation(
			CustQuote_ID,[CustLead_ID],[Carrier],[CopayBase_Riders],[Coverage_Amount],[Effective_Date],[Info_ProviderMethod],[LocationSpecified_Options],[Plan_ID],[Plan_Name],
			[Quoted_PlanType],[Quoted_PolicyType],[Quoted_Rate],[Riders],[SNP],[CustDetail_ID],[Enrolled],[CallInteraction_ID],[Tenant_ID],[Status],[Quotation_Date])
			Select
				@custQuoteId
				,[CustLead_ID]
				,[Carrier]
				,[CopayBase_Riders]
				,[Coverage_Amount]
				,[Effective_Date]
				,[Info_ProviderMethod]
				,[LocationSpecified_Options]
				,[Plan_ID]
				,[Plan_Name]
				,[Quoted_PlanType]
				,[Quoted_PolicyType]
				,[Quoted_Rate]
				,[Riders]
				,[SNP]
				,[CustDetail_ID]
				,[Enrolled]
				,[CallInteraction_ID]
				,[Tenant_ID]
				,[Status]
				,[Quotation_Date]
			From dbo.#tblCustQuotation;

			Set @rowCnt = @@ROWCOUNT;

			Set Identity_Insert dbo.Customer_Quotation Off;

			Select @rowCnt As 'RowCount', 'Add Success' As 'Status', Cast(@custQuoteId As varchar) As 'Description';
		End
		
		
		Drop Table dbo.#tblCustQuotation;

		-- since IMPLICIT TRANSACTION is ON by default to a COMMIT for the above DROP statement
		Commit Tran; 
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )

		--Begin

		Rollback Tran;

		--End
		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity int, @ErrorState int
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End

GO
/****** Object:  StoredProcedure [dbo].[uspSaveFilterCustomerCriteria]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[uspSaveFilterCustomerCriteria]
(
@pCampaignId bigint,
@pCampaignTable varchar(200),
@pState varchar(500),
@pProduct varchar(200),
@pDecile varchar(200),
@pTenure varchar(200),
@pTargetVolume int
)
AS
Begin
	Begin Try
		Begin Tran

		Declare @Sample_Selection varchar(10)

		select @Sample_Selection=Sample_Selection from dbo.Campaign_BasicDetails where Campaign_ID=@pCampaignId

		if exists(select CampFilter_ID from Campaign_Filter where Campaign_ID=@pCampaignId)
		begin
			update dbo.Campaign_Filter set Customer_TableName=@pCampaignTable,Criteria_State=@pState,Criteria_Product=@pProduct,Criteria_Decile=@pDecile
			, Criteria_Tenure=@pTenure,Criteria_TargetVolume=@pTargetVolume where Campaign_ID=@pCampaignId

			Select @@ROWCOUNT As [RowCount],'Update Successfully' As [Status]
		end
		else
		begin
			INSERT INTO dbo.Campaign_Filter([Campaign_ID],[Sample_Selection], [Customer_TableName], [Criteria_State], [Criteria_Product], [Criteria_Decile], [Criteria_Tenure],Criteria_TargetVolume) VALUES 
					(@pCampaignId , @Sample_Selection,@pCampaignTable , @pState , @pProduct, @pDecile, @pTenure,@pTargetVolume )
			
			Select @@ROWCOUNT As [RowCount],'Insert Successfully' As [Status]
		end		
		Commit Tran
	End Try
	Begin Catch
		 Rollback Tran
		   Declare  
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10);  
			Select @ErrorMessage = ERROR_MESSAGE(),  
			@ErrorSeverity = ERROR_SEVERITY(),   
			@ErrorState = ERROR_STATE();  
  
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);  
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[uspSaveLoginUser]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[uspSaveLoginUser]
(
@ID int,
@UserId varchar(20),
@Password varchar(20),
@User_Type varchar(20) null,
@Agent_ID varchar(20) null,
@Active bit
)
as
 begin
  if @UserId IS NULL   
  begin 
	insert into dbo.LoginUsers(UserId,Pwd,User_Type,Agent_ID,Active)
	values(@UserId,@Password,@User_Type,@Agent_ID,@Active);
 end
    
 else if exists (select 1 from [dbo].[LoginUsers] where UserId = @UserId)
			begin
			--print 2; 
				update dbo.LoginUsers 
				set 
					UserId = @UserId,
					Pwd = @Password,
					User_Type = @User_Type,
					Agent_ID= @Agent_ID,
					Active = @Active
					where UserId = @UserId              	 
	   end
end

GO
/****** Object:  StoredProcedure [dbo].[uspSavePrerequisitesForCallback]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspSavePrerequisitesForCallback 3, 4, NULL, 5, 1
--exec dbo.uspSavePrerequisitesForCallback 15, 4, NULL, 5, 1
CREATE Procedure [dbo].[uspSavePrerequisitesForCallback]
(
	@pCustDetail_ID bigint,
	@pIsNewLead bit NULL,
	@pCustLead_ID bigint NULL,
	@pSource_TFN bigint NULL,
	@pPlanID bigint,
	@pAgentID bigint
)
As
Begin
	Begin Try
		Begin Tran;

		Declare @agentName varchar(100), @interactionDate datetime, @interactionDuration datetime, @dispositionCode varchar(10), @caseStatusCode varchar(10),@caseStatusID int, 
		@planName varchar(100), @product varchar(20), @contractNumber varchar(20), @PBPnumber varchar(20), @custFirstName varchar(50), @custLastName varchar(50), 
		@phone float, @zip varchar(20);
	
		Select @agentName=(LastName+', '+MiddleName+' '+FirstName) From dbo.Agent_Master Where Agent_ID=@pAgentID;
		Select @interactionDate=GetDate(), --@interactionDuration= YEAR(GETDATE()) + '-' + MONTH(GETDATE()) + '-' + DAY(GETDATE()) + ' ' + '00:00:10';
		@interactionDuration=FORMAT(GetDate(), 'yyyy-MM-dd');-- + ' 00:00:100';
		Select @dispositionCode=CodeVal From dbo.CRM_LookupMaster Where DataGroup='Disposition' And ModuleName='Call Interactions' And FieldName='IssueID' And TxtVal='Callback';
		Select @caseStatusCode=CodeVal From dbo.CRM_LookupMaster Where DataGroup='OpenClosed' And TxtVal='Open';
		Set @caseStatusID=(Case When @caseStatusCode='OC001' Then 1 Else 0 End);
		Select @planName=PlanName,@product=Product,@contractNumber=ContractNumber,@PBPnumber=PBPNumber From dbo.PlanMaster Where Id=@pPlanID;
		Select @custFirstName=FirstName,@custLastName=LastName,@phone=Cast(Phone as Float),@zip=Zip From dbo.Customer_Details Where CustDetail_ID=@pCustDetail_ID;

		Declare @rowCount int;
		--Declare @custLeadId bigint;
		IF (@pIsNewLead=1)
		Begin
			Declare @currentDateTime varchar(20);
			Set @currentDateTime=FORMAT(GetDate(), 'yyyy-MM-dd HH:mm:sss');

			--Declare @newCustLeadID bigint;
			Select @pCustLead_ID=(Coalesce(MAX(CustLead_ID),0)+1) from dbo.Customer_Leads;

			--ToDo: Insert customer lead with CustDetail_ID, Source_TFN and required details
			Set Identity_Insert dbo.Customer_Leads On;

			Insert Into dbo.Customer_Leads(
			CustLead_ID, BrandID, CustDetail_ID, ContactID, Source_TFN, AgentMaster_ID, AgentName, 
			PreIssueType, IssueType, PreIssueID, IssueID, PreIssueSubID, SubIssueID, PrevCaseStatusID, CaseStatusID, 
			CaseStatusCode, CreatedDate, LastUpdate, PrevTier, Notes, Tier, AssignedAgent_ID, PriorityID, ClassificationID, Urgency, ImpactID, CaseType, RuleTicker, Session_ID, EnrolledMedicareAB, 
			MedicareCVG6mt, MedicareCVG6MT_Date)
			Select @pCustLead_ID,NULL,@pCustDetail_ID,NULL,@pSource_TFN,@pAgentID,@agentName,
			NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
			@caseStatusCode,@currentDateTime,@currentDateTime,NULL,NULL,NULL,@pAgentID,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
			NULL,NULL;

			Set Identity_Insert dbo.Customer_Leads Off;
			--print 0;
		End

		Set Identity_Insert dbo.Call_Interactions On;

		Declare @newCallInteractionId bigint;
		Select @newCallInteractionId=(Coalesce(MAX(CallInteraction_ID),0)+1) from dbo.Call_Interactions;
	
		Insert Into dbo.Call_Interactions(CallInteraction_ID,CustLead_ID,CustDetail_ID,AgentMaster_ID,AgentName,InteractionDate,InteractionDuration,DispositionCode,
		CaseStatusID,CaseStatusCode,PlanId,PlanName,Product,ContractNumber,PBP_Number,FirstName,LastName,Phone,Zip)
		Select @newCallInteractionId,@pCustLead_ID,@pCustDetail_ID,@pAgentID,@agentName,@interactionDate,@interactionDuration,@dispositionCode,@caseStatusID,
		@caseStatusCode,@pPlanID,@planName,@product,@contractNumber,@PBPnumber,@custFirstName,@custLastName,@phone,@zip;
		--Insert Into dbo.Call_Interactions(CustLead_ID,CustDetail_ID,AgentMaster_ID,AgentName,InteractionDate,InteractionDuration,DispositionCode,CaseStatusID,CaseStatusCode,
		--PlanId,PlanName,Product,ContractNumber,PBP_Number,FirstName,LastName,Phone,Zip)

		Set @rowCount=@@ROWCOUNT;

		Set Identity_Insert dbo.Call_Interactions Off;
		--Drop Table dbo.#tblCallInteraction;

		Declare @strStatus varchar(50), @strDescription varchar(50);
		If (@rowCount > 0)
		Begin
			Set @strStatus='Add Success';
			Set @strDescription='CallInteraction_ID:'+Cast(@newCallInteractionId As Varchar(5));
			If (@pIsNewLead=1)
			Begin
				Set @strDescription += '|CustLead_ID:'+Cast(@pCustLead_ID As Varchar(5));
			End
		End
		Else
		Begin
			Set @strStatus='Add Failure';
			Set @strDescription = 'Record was not added'
		End
		Select @strStatus As [Status], @strDescription As [Description];

		-- since IMPLICIT TRANSACTION is ON by default to a COMMIT for the above DROP statement
		Commit Tran; 
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )

		--Begin

		Rollback Tran;

		--End
		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10)
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End

--Select * From dbo.Customer_Leads Where CaseStatusCode='OC001';
--Select * From dbo.Call_Interactions Order By CallInteraction_ID Desc;
--Select * From dbo.CRM_LookupMaster;
--Select @@version;
GO
/****** Object:  StoredProcedure [dbo].[uspSaveScheduledCallbacks]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext uspSaveScheduledCallbacks;

CREATE Procedure [dbo].[uspSaveScheduledCallbacks]
(
	@pScheduledCallbacksDetails Xml
)
As
Begin
	Begin Try
		Begin Tran;

		Create Table dbo.#tblScheduledCallbacksDetails
		(
			ScheduledCallback_ID bigint null,
			BrandID bigint,
			AppointmentTypeID int,
			Appointment_Date datetime null,
			Appointment_DateString varchar(20) null,
			Callback_Date datetime null,
			Callback_DateString varchar(20) null,
			Callback_Text varchar(1000) null,
			Callback_Time time null,
			CallbackTimeOption varchar(20),
			Send_Reminder bit null,
			Reminder_Type varchar(10) null,
			CustLead_ID bigint,
			CallInteraction_ID bigint,
			[Priority] bigint,
			AgentType int,
			Completion_Time time,
			Completion_Agent bigint,
			Active int,
			CallbackTime2 time,
			Category varchar(300),
			AgentMaster_ID bigint,
			CallBackNumber float,
			Dispostion_ID varchar(200)
		);

		declare @scheduledIdVar as varchar(100);
		declare @scheduledId as varchar(100);
		declare @appointmentDate as varchar(20);
		declare @appointmentDateValue as datetime;
		declare @sendReminderString as varchar(10), @sendReminder as bit, @reminderType as varchar(10);

		Select @sendReminderString = cast(colx.query('data(SendReminder) ') as varchar), 
		@reminderType =  cast(colx.query('data(ReminderType) ') as varchar)
		From @pScheduledCallbacksDetails.nodes('ScheduledCallback') as Tabx(colx);

		if (@sendReminderString = 'true')
		Begin
			Set @sendReminder = 1;
		End
		else
		Begin
			Set @sendReminder = 0; 
			Set @reminderType = NULL;
		End

		Select @scheduledIdVar = cast(colx.query('data(ScheduledCallback_ID) ') as varchar) 
		From @pScheduledCallbacksDetails.nodes('ScheduledCallback') as Tabx(colx);

		--print 1;

		if(@scheduledIdVar = 0 OR @scheduledIdVar = null)
			Begin
				set @scheduledId  = null
			End
		Else
			Begin
				set @scheduledId  = @scheduledIdVar;
			End

		Select @appointmentDate = cast(colx.query('data(Appointment_DateString) ') as varchar(20))
		From @pScheduledCallbacksDetails.nodes('ScheduledCallback')  as Tabx(colx);

		if(@appointmentDate is null OR LEN(@appointmentDate) = 0)
		Begin
			set @appointmentDateValue = null;
		End
		Else
		Begin
			set @appointmentDateValue = cast(@appointmentDate As datetime);
		End

		--print 2;

		Insert Into dbo.#tblScheduledCallbacksDetails
		Select 
			@scheduledId As ScheduledCallback_ID,
			cast(colx.query('data(BrandID) ') as varchar) As BrandID,
			cast(colx.query('data(AppointmentTypeID) ') as varchar) As AppointmentTypeID,
			@appointmentDateValue As Appointment_Date,
			cast(colx.query('data(Appointment_DateString) ') as varchar) As Appointment_DateString,
			cast(colx.query('data(Callback_Date) ') as varchar) As Callback_Date,
			cast(colx.query('data(Callback_DateString) ') as varchar) As Callback_DateString,
			cast(colx.query('data(Callback_Text) ') as varchar) As Callback_Text,
			cast(cast(colx.query('data(Callback_Time) ') as varchar) as time) As Callback_Time,
			cast(colx.query('data(CallbackTimeOption) ') as varchar) As CallbackTimeOption,
			@sendReminder as Send_Reminder,
			@reminderType as Reminder_Type,
			cast(colx.query('data(CustLead_ID) ') as varchar) As CustLead_ID,
			cast(colx.query('data(CallInteraction_ID) ') as varchar) As Email,
			cast(colx.query('data(Priority) ') as varchar) As [Priority],
			cast(colx.query('data(AgentType) ') as varchar) As AgentType,
			cast(cast(colx.query('data(Completion_Time) ') as varchar) as time) As Completion_Time,
			cast(colx.query('data(Completion_Agent) ') as varchar) As Completion_Agent,
			cast(colx.query('data(Active) ') as varchar) As Active,
			cast(cast(colx.query('data(AppointmentTime2) ') as varchar) as time) As AppointmentTime2,
			cast(colx.query('data(Category) ') as varchar) As Category,
			cast(colx.query('data(AgentMaster_ID) ') as varchar) As AgentMaster_ID,
			cast(colx.query('data(CallBackNumber) ') as varchar) As CallBackNumber,
			cast(colx.query('data(Dispostion_ID) ') as varchar) As Dispostion_ID--,
			--cast(cast(colx.query('data(Callback_Date) ') as varchar) as datetime) As Callback_Date
		From @pScheduledCallbacksDetails.nodes('ScheduledCallback') as Tabx(colx);
		
		--Declare @agentMasterID bigint;
		--Select @agentMasterID = A.AgentMaster_ID From dbo.Call_Interactions A
		--Inner Join dbo.#tblScheduledCallbacksDetails B
		--On A.CallInteraction_ID = B.CallInteraction_ID;

		Update A
		Set A.AgentMaster_ID=B.AgentMaster_ID 
		From dbo.#tblScheduledCallbacksDetails A
		Inner Join dbo.Call_Interactions B
		On A.CallInteraction_ID=B.CallInteraction_ID;

		--Select * From dbo.#tblScheduledCallbacksDetails;
		Declare @rowCnt int;
		
		If Exists (Select 1 From dbo.#tblScheduledCallbacksDetails Where ScheduledCallback_ID Is Not NULL)
		Begin
			Update A
			Set 
				A.BrandID = B.BrandID,
				A.AppointmentTypeID = B.AppointmentTypeID,
				--A.Appointment_Date = B.Appointment_Date,
				--A.Appointment_DateString = B.Appointment_DateString,
				A.Callback_Date = B.Callback_Date,
				A.Callback_DateString = B.Callback_DateString,
				A.Callback_Time = B.Callback_Time,
				A.CallbackTimeOption = B.CallbackTimeOption,
				A.Send_Reminder = B.Send_Reminder,
				A.Reminder_Type = B.Reminder_Type,
				A.CustLead_ID = B.CustLead_ID,
				A.CallInteraction_ID = B.CallInteraction_ID,
				A.[Priority] = B.[Priority],
				A.AgentType = B.AgentType,
				A.Completion_Time = B.Completion_Time,
				A.Completion_Agent = B.Completion_Agent,
				A.Active = B.Active,
				A.CallbackTime2 = B.CallbackTime2,
				A.Category = B.Category,
				A.AgentMaster_ID = B.AgentMaster_ID,
				A.CallBackNumber = B.CallBackNumber,
				A.Dispostion_ID = B.Dispostion_ID--,
				--A.Callback_Date = B.Callback_Date
			From dbo.Scheduled_Callbacks A
			Inner Join dbo.#tblScheduledCallbacksDetails B
			On A.ScheduledCallback_ID = B.ScheduledCallback_ID;		

			Set @rowCnt = @@ROWCOUNT;

			Select @rowCnt As 'RowCount', 'Update Success' As 'Status', @@ROWCOUNT As 'Description';
		End
		Else
		Begin
			Declare @upcomingCallbackDate datetime;
			Declare @upcomingAppointmentTime time;
			Select @upcomingCallbackDate =  Callback_Date from dbo.#tblScheduledCallbacksDetails;
			Select @upcomingAppointmentTime = Callback_Time from dbo.#tblScheduledCallbacksDetails;

			--If Exists (Select 1 From dbo.Scheduled_Callbacks Where Callback_Date = @upcomingCallbackDate AND Callback_Time = @upcomingAppointmentTime )
			--Begin
			--	Select 'Failure' As 'Status', 'Scheduled callback already exists' As 'Description';
			--End
			--Else 
			If exists(Select 1 From dbo.#tblScheduledCallbacksDetails Where Appointment_Date is NULL)
			Begin
			   Select 'Add Failure' As 'Status', 'Appointment Date is not provided' As 'Description';
			End
			Else
			Begin
				Set Identity_Insert dbo.Scheduled_Callbacks On;

				Declare @callbackId bigint;
				Select @callbackId = Coalesce(MAX(ScheduledCallback_ID),0)+1 From dbo.Scheduled_Callbacks;

				Insert Into dbo.Scheduled_Callbacks(ScheduledCallback_ID, BrandId, AppointmentTypeID, Appointment_Date, Callback_Date, Callback_Text, Callback_Time, CallbackTimeOption, Send_Reminder, Reminder_Type, CustLead_ID,CallInteraction_ID, [Priority], AgentType, Completion_Time, Completion_Agent, Active, CallbackTime2, Category, AgentMaster_ID, CallBackNumber,Dispostion_ID)
				Select
					@callbackId,
					BrandId,
					AppointmentTypeID,
					Appointment_Date,
					Callback_Date,
					Callback_Text ,
					Callback_Time,
					CallbackTimeOption ,
					Send_Reminder,
					Reminder_Type,
					CustLead_ID ,
					CallInteraction_ID ,
					[Priority] ,
					AgentType ,
					Completion_Time ,
					Completion_Agent ,
					Active ,
					CallbackTime2 ,
					Category ,
					AgentMaster_ID ,
					CallBackNumber ,
					Dispostion_ID--,
					--Callback_Date
				From dbo.#tblScheduledCallbacksDetails;



				Set @rowCnt = @@ROWCOUNT;

				Set Identity_Insert dbo.Scheduled_Callbacks Off;

				INSERT INTO [dbo].[Appointment_Reminder]
					   ([Appointment_Datetime]
					   ,[Campaign_Name]
					   ,[Interval]
					   ,[Reminder_Datetime]
					   ,Send_Reminder
					   ,Reminder_Type
					   ,[Customer_ID]
					   ,[Agent_ID])
				SELECT
					   Appointment_Date
					   ,'Callback'
					   ,1
					   ,(SELECT DATEADD(MINUTE, -5, Appointment_Date))
					   ,Send_Reminder
					   ,Reminder_Type
					   ,(SELECT TOP 1 CustDetail_ID FROM Customer_Leads a WHERE a.CustLead_ID = X.CustLead_ID)
					   ,AgentMaster_ID
					   From dbo.#tblScheduledCallbacksDetails X;

				Select @rowCnt As 'RowCount', 'Add Success' As 'Status', @callbackId As 'Description';
			End
		End
		Commit Tran; 
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )

		--Begin

		Rollback Tran;

		--End
		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10);
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End

GO
/****** Object:  StoredProcedure [dbo].[uspSearchCampaignBasicDetails]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[uspSearchCampaignBasicDetails]
(
	@Campaign_Name varchar(100)='',
	@Campaign_Type varchar(50)='',
	@Start_Date varchar(50)=''
)
As
Begin	
	Declare @where varchar(max)=' Where 1=1 ';

	If (@Campaign_Name<>'' and @Campaign_Name is not Null)
	Begin	
		Set @where= @where+' and  Campaign_Name like ''%'+@Campaign_Name+'%'''
	End
	If (@Campaign_Type<>'' and @Campaign_Type is not Null)
	Begin
		Set @where= @where+' and  Campaign_Type= '''+@Campaign_Type+''''
	End
	If (@Start_Date<>'' and @Start_Date is not Null)
	Begin
		Set @where= @where+' and  [Start_Date] ='''+@Start_Date+''''
	End
	
	Declare @sql varchar(max) = 
	'Select Campaign_ID,Campaign_Name,clm.TxtVal as Campaign_Type, clm.CodeVal as Campaign_Type_Code, clm1.TxtVal as Wave, 
	[Start_Date], Project_Owner, Stakeholder, clm2.TxtVal as Sample_Selection 
	from dbo.Campaign_BasicDetails cbc left join dbo.CRM_LookupMaster clm on cbc.Campaign_Type=clm.CodeVal and clm.DataGroup=''CMPGNTYP'' 
	left join dbo.CRM_LookupMaster clm1 on clm1.CodeVal=cbc.Wave and clm1.DataGroup=''CMPGNWAV'' 
	left join dbo.CRM_LookupMaster clm2 on clm2.CodeVal=cbc.Sample_Selection and clm2.DataGroup=''CMPGNSMPLSEL'' 
	left join dbo.CRM_LookupMaster clm3 on clm3.CodeVal=cbc.Campaign_Brand and clm3.DataGroup=''CMPGNBRANDS'''; 
  
	print(@sql+  @where)
	exec(@sql+  @where)
End

GO
/****** Object:  StoredProcedure [dbo].[uspSubmitAdhocSale]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec dbo.uspSubmitAdhocSale '<SalePrerequisite><IsNewCustomer>false</IsNewCustomer><IsNewCustomer_bit>0</IsNewCustomer_bit><CustDetail_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><FirstName>Nolan</FirstName><MiddleName p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><LastName>Heinz</LastName><Phone>8881230003</Phone><Zip p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><City>Trenton</City><State>New Jersey (NJ)</State><Country>US</Country><Email>07911</Email><DOB>1958-03-13T00:00:00</DOB><DOB_string>1958-03-13</DOB_string><PartA_EffectiveDate>2023-03-12T00:00:00</PartA_EffectiveDate><PartA_EffectiveDate_string>2023-03-12</PartA_EffectiveDate_string><Medicare_Number>KKFHG88325A</Medicare_Number><IsNewLead>false</IsNewLead><IsNewLead_bit>0</IsNewLead_bit><CustLead_ID>52</CustLead_ID><Campaign_ID>0</Campaign_ID><CallInteraction_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Interaction_Date>2023-05-05T16:14:35.4001977+05:30</Interaction_Date><Interation_Date_string>2023-05-05</Interation_Date_string><PlanID>3</PlanID><CustQuote_ID p2:nil="true" xmlns:p2="http://www.w3.org/2001/XMLSchema-instance" /><Quotation_Date>2023-05-05T16:14:35.4001977+05:30</Quotation_Date><Quotation_Date_String>2023-05-05</Quotation_Date_String><Product>HMO-POS</Product><ContractNumber>BACD4123EF5</ContractNumber><PBPNumber>B1A2C3D4E5F</PBPNumber><Carrier>Humana</Carrier><Coverage_Amount>17000</Coverage_Amount><Effective_Date>2023-05-16T00:00:00</Effective_Date><Effective_DateString>2023-05-16</Effective_DateString><Quoted_Rate>0</Quoted_Rate></SalePrerequisite>'
CREATE Procedure [dbo].[uspSubmitAdhocSale]
(
	@pAdhocSale xml
)
As
Begin
	Begin Try
		Begin Tran;
		Create Table dbo.#AdhocSaleDetails
		(
			IsNewCustomer bit, CustDetail_ID bigint NULL, FirstName varchar(100), MiddleName varchar(100), LastName varchar(100), Phone varchar(20), Zip varchar(10), 
			City varchar(50) NULL, [State] varchar(50) NULL, Country varchar(10) NULL, Email varchar(50) NULL, DOB date, PartA_EffectiveDate date NULL, 
			Medicare_Number varchar(20),
			IsNewLead bit, CustLead_ID bigint NULL, Campaign_ID bigint NULL, CallInteraction_ID bigint NULL, InteractionDate date NULL, CustQuote_ID bigint NULL, 
			PlanID bigint, Product varchar(50) NULL,
			ContractNumber varchar(20) NULL, PBPNumber varchar(20) NULL, Carrier varchar(20) NULL, CopayBase_Riders varchar(20) NULL, Coverage_Amount decimal(18,2), 
			EffectiveDate date, Quoted_PlanType varchar(20) NULL, Quoted_PolicyType varchar(20) NULL, Quoted_Rate decimal(18,2), SNP varchar(20) NULL, Quotation_Date date NULL,
			Agent_ID bigint
		);

		Declare @isNewCustomer bit, @isNewLead bit;
		Declare @strCustDetailId varchar(10), @strPhone varchar(10), @strCustLeadId varchar(10), @strCampaignId varchar(10), @strPlanId varchar(10);
		--Insert Into dbo.#AdhocSaleDetails
		Select 
			@isNewCustomer = cast(colx.query('data(IsNewCustomer_bit)') as varchar),
			@strCustDetailId = cast(colx.query('data(CustDetail_ID)') as varchar),
			@strPhone = cast(colx.query('data(Phone)') as varchar),
			@isNewLead = cast(colx.query('data(IsNewLead_bit)') as varchar),
			@strCustLeadId = cast(colx.query('data(CustLead_ID) ') as varchar),
			@strCampaignId = cast(colx.query('data(Campaign_ID) ') as varchar),
			--cast(colx.query('data(ContactPreference_Text) ') as varchar) As ContactPreference_Text,
			--cast(colx.query('data(ContactPreference_Phone) ') as varchar) As ContactPreference_Phone,
			--cast(colx.query('data(ContactPreference_No_OptIN) ') as varchar) As ContactPreference_No_OptIN,
			@strPlanId = cast(colx.query('data(PlanID) ') as varchar)
		From @pAdhocSale.nodes('SalePrerequisite') as Tabx(colx);

		Insert Into dbo.#AdhocSaleDetails
		Select 
			cast(colx.query('data(IsNewCustomer_bit)') as varchar), cast(colx.query('data(CustDetail_ID)') as varchar), cast(colx.query('data(FirstName)') as varchar), 
			cast(colx.query('data(MiddleName)') as varchar), cast(colx.query('data(LastName)') as varchar), cast(colx.query('data(Phone)') as varchar), 
			cast(colx.query('data(Zip)') as varchar), cast(colx.query('data(City)') as varchar), cast(colx.query('data(State)') as varchar),
			cast(colx.query('data(Country) ') as varchar), cast(colx.query('data(Email) ') as varchar), cast(colx.query('data(DOB_string) ') as varchar),
			cast(colx.query('data(PartA_EffectiveDate_string) ') as varchar), cast(colx.query('data(Medicare_Number) ') as varchar),
			cast(colx.query('data(IsNewLead_bit) ') as varchar), cast(colx.query('data(CustLead_ID) ') as varchar), cast(colx.query('data(Campaign_ID) ') as varchar), 
			cast(colx.query('data(CallInteraction_ID) ') as varchar), cast(colx.query('data(Interaction_Date_String) ') as varchar), 
			cast(colx.query('data(CustQuote_ID) ') as varchar), cast(colx.query('data(PlanID) ') as varchar), 
			cast(colx.query('data(Product) ') as varchar), cast(colx.query('data(ContractNumber) ') as varchar), cast(colx.query('data(PBPNumber) ') as varchar), 
			cast(colx.query('data(Carrier) ') as varchar), cast(colx.query('data(CopayBase_Riders) ') as varchar), cast(colx.query('data(Coverage_Amount) ') as varchar), 
			cast(colx.query('data(Effective_DateString) ') as varchar), cast(colx.query('data(Quoted_PlanType) ') as varchar), 
			cast(colx.query('data(Quoted_PolicyType) ') as varchar), cast(colx.query('data(Quoted_Rate) ') as varchar), cast(colx.query('data(SNP) ') as varchar),
			cast(colx.query('data(Quotation_Date_String) ') as varchar), cast(colx.query('data(Agent_ID) ') as varchar)
		From @pAdhocSale.nodes('SalePrerequisite') as Tabx(colx);

		Declare @rowCnt_CustDetail int, @rowCnt_CustLead int, @rowCnt_CallInteraction int, @rowCnt_CustQuote int, @rowCnt_Sale int;
		Select @rowCnt_CustDetail=-1, @rowCnt_CustLead=-1, @rowCnt_CallInteraction=-1, @rowCnt_CustQuote=-1, @rowCnt_Sale=-1;
		If (@isNewCustomer=1)
		Begin
			Declare @newCustDetailId bigint;
			Select @newCustDetailId=(Coalesce(MAX(CustDetail_ID),0)+1) From dbo.Customer_Details;

			Set Identity_Insert dbo.Customer_Details On;

			Insert Into dbo.Customer_Details(
				CustDetail_ID,FirstName,MiddleName,LastName,Phone,Email,City,[State],Country,Zip,DOB,PartA_EffectiveDate,Medicare_Number,LastAgent_ID)
			Select 
				@newCustDetailId,FirstName,MiddleName,LastName,Phone,Email,City,[State],Country,Zip,DOB,PartA_EffectiveDate,Medicare_Number,Agent_ID
			From dbo.#AdHocSaleDetails;

			Set @rowCnt_CustDetail=@@ROWCOUNT;

			Set Identity_Insert dbo.Customer_Details Off;

			Update dbo.#AdHocSaleDetails
			Set CustDetail_ID=@newCustDetailId;
		End

		If (@isNewLead=1)
		Begin
			Declare @newCustLeadId bigint;
			Select @newCustLeadId=(Coalesce(MAX(CustLead_ID),0)+1) From dbo.Customer_Leads;

			Set Identity_Insert dbo.Customer_Leads On;

			Insert Into dbo.Customer_Leads(
				CustLead_ID,CustDetail_ID,Source_TFN,AgentMaster_ID)
			Select 
				@newCustDetailId,CustDetail_ID,Campaign_ID,Agent_ID
			From dbo.#AdHocSaleDetails;

			Set @rowCnt_CustLead=@@ROWCOUNT;

			Set Identity_Insert dbo.Customer_Leads Off;

			Update dbo.#AdHocSaleDetails
			Set CustLead_ID=@newCustLeadId;
		End

		--insert call interaction record
		Declare @newCallInteractionId bigint;
		Select @newCallInteractionId=(Coalesce(MAX(CallInteraction_ID),0)+1) From dbo.Call_Interactions;

		Set Identity_Insert dbo.Call_Interactions On;

		Insert Into dbo.Call_Interactions(
			CallInteraction_ID,CustLead_ID,CustDetail_ID,AgentMaster_ID,InteractionDate,InteractionDuration,PlanId,Product,ContractNumber,PBP_Number,DispositionCode)
		Select
			@newCallInteractionId,CustLead_ID,CustDetail_ID,Agent_ID,InteractionDate,'00:00:10',PlanId,Product,ContractNumber,PBPNumber,'D003'
		From dbo.#AdHocSaleDetails;

		Set @rowCnt_CustQuote=@@ROWCOUNT;

		Set Identity_Insert dbo.Call_Interactions Off;

		Update dbo.#AdHocSaleDetails
		Set CallInteraction_ID=@newCallInteractionId;

		--insert customer quotation record
		Declare @newCustQuoteId bigint;
		Select @newCustQuoteId=(Coalesce(MAX(CustQuote_ID),0)+1) From dbo.Customer_Quotation;

		Set Identity_Insert dbo.Customer_Quotation On;

		Insert Into dbo.Customer_Quotation(
			CustQuote_ID,CustLead_ID,CustDetail_ID,CallInteraction_ID,Carrier,CopayBase_Riders,Coverage_Amount,Effective_Date,Plan_ID,Quoted_PlanType,Quoted_PolicyType,
			Quoted_Rate,Quotation_Date,SNP,Date_Created)
		Select
			@newCustQuoteId,CustLead_ID,CustDetail_ID,CallInteraction_ID,Carrier,CopayBase_Riders,Coverage_Amount,EffectiveDate,PlanID,Quoted_PlanType,Quoted_PolicyType,
			Quoted_Rate,Quotation_Date,SNP,GetDate()
		From dbo.#AdHocSaleDetails;

		Set @rowCnt_Sale=@@ROWCOUNT;

		Set Identity_Insert dbo.Customer_Quotation Off;

		Update dbo.#AdHocSaleDetails
		Set CustQuote_ID=@newCustQuoteId;

		--insert sales record
		Declare @newSaleId bigint;
		Select @newSaleId=(Coalesce(MAX(Sale_ID),0)+1) From dbo.Sales;

		Set Identity_Insert dbo.Sales On;

		Insert Into dbo.Sales(
			Sale_ID,CustLead_ID,CustDetail_ID,CallInteraction_ID,CustQuote_ID,Plan_ID,PlanType,HICN_MBI,ContractNumber,PBPNumber,
			Confirmation_Number,PolicyNumber,Carrier)
		Select
			@newSaleId,CustLead_ID,CustDetail_ID,CallInteraction_ID,CustQuote_ID,PlanID,Quoted_PlanType,Medicare_Number,ContractNumber,PBPNumber,
			NULL,NULL,Carrier
		From dbo.#AdHocSaleDetails;

		Set Identity_Insert dbo.Sales Off;

		Update A
		Set A.CaseStatusCode='OC002'
		From dbo.Customer_Leads A
		Inner Join dbo.#AdHocSaleDetails B
		On A.CustLead_ID=B.CustLead_ID;

		Select @rowCnt_Sale As 'RowCount', 'Insert Success' As 'Status', Cast(@newSaleId As varchar) As 'Description';

		Commit Tran;
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )
		--Begin
		Rollback Tran;
		--End

		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity varchar(10), @ErrorState varchar(10);
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[uspSubmitForSale]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec [dbo].[uspSubmitForSale] '<Sales><Sales_ID>0</Sales_ID><CustDetail_ID>2</CustDetail_ID><CustLead_ID>6</CustLead_ID><CallInteraction_ID>90</CallInteraction_ID><CustQuote_ID>27</CustQuote_ID><HICN_MBI>777</HICN_MBI><Plan_ID>0</Plan_ID><PlanType>HMO</PlanType><ContractNumber>DDDD4455ER3</ContractNumber><PBPNumber>B1C1D1A1F6R</PBPNumber></Sales>'
CREATE Procedure [dbo].[uspSubmitForSale]
(
	@pDetailsForSale Xml
)
As
 Begin
	Begin Try
		Begin Tran;

		Create Table dbo.#tblSales
		(
		    Sale_ID bigint NULL,
			CustDetail_ID bigint NULL,
			CustLead_ID bigint NULL,
			CallInteraction_ID bigint NULL,
			CustQuote_ID bigint NULL,
			Carrier varchar(50) NULL,
			PlanID bigint NULL,
			PlanType varchar(20) NULL,
			HICNMBI varchar(20) NULL,
			ContractNumber varchar(20) NULL,
			PBPNumber varchar(20) NULL,
			Confirmation_Number varchar(50) NULL,
			PolicyNumber varchar(50) NULL,
			SubmitStatus varchar(20) NULL,
			IssueStatus varchar(200) NULL,
			SourceOfSale varchar(20) NULL,
			TypeOfSale varchar(20) NULL
		);

		Declare @custQuote_ID int, @custLead_ID int,@custDetail_ID int, @enrolled int, @callInteraction_ID int, @tenant_ID int;
		Declare @strSale_ID varchar(20), @strCustQuote_ID varchar(10),@strCustLead_ID varchar(10),@strCustDetail_ID varchar(10), 
		@strCallInteraction_ID varchar(10), @strPlan_ID varchar(20);
		
		Select 
			@strSale_ID = cast(colx.query('data(Sale_ID)') as varchar),
			@strCustQuote_ID = cast(colx.query('data(CustQuote_ID)') as varchar),
			@strCustLead_ID = cast(colx.query('data(CustLead_ID)') as varchar),
			@strCustDetail_ID = cast(colx.query('data(CustDetail_ID) ') as varchar),
			@strCallInteraction_ID = cast(colx.query('data(CallInteraction_ID) ') as varchar),
			@strPlan_ID = cast(colx.query('data(Plan_ID) ') as varchar)
		From @pDetailsForSale.nodes('Sales') as Tabx(colx);

		Insert Into dbo.#tblSales
		Select 
			(Case When (@strSale_ID = '' OR @strSale_ID IS NULL) Then NULL Else @strSale_ID End) As Sale_ID,
			(Case When (@strCustDetail_ID = '' OR @strCustDetail_ID IS NULL) Then NULL Else @strCustDetail_ID End) As CustDetail_ID,
			(Case When (@strCustLead_ID = '' OR @strCustLead_ID IS NULL) Then NULL Else @strCustLead_ID End) As CustLead_ID,
			(Case When (@strCallInteraction_ID = '' OR @strCallInteraction_ID IS NULL) Then NULL Else @strCallInteraction_ID End) As CallInteraction_ID,
			(Case When (@strCustQuote_ID = '' OR @strCustQuote_ID IS NULL) Then NULL Else @strCustQuote_ID End) As CustQuote_ID,
			cast(colx.query('data(Carrier) ') as varchar) As Carrier,
			(Case When (@strPlan_ID = '' OR @strPlan_ID IS NULL) Then NULL Else @strPlan_ID End) As Plan_ID,
			cast(colx.query('data(PlanType) ') as varchar) As PlanType,
			cast(colx.query('data(HICN_MBI) ') as varchar) As HICN_MBI,
			cast(colx.query('data(ContractNumber) ') as varchar) As ContractNumber,
			cast(colx.query('data(PBPNumber) ') as varchar) As PBPNumber,
			cast(colx.query('data(Confirmation_Number) ') as varchar) As Confirmation_Number,
			cast(colx.query('data(PolicyNumber) ') as varchar) As PolicyNumber,
			cast(colx.query('data(SubmitStatus) ') as varchar) As SubmitStatus,
			cast(colx.query('data(IssueStatus) ') as varchar) As IssueStatus,
			cast(colx.query('data(SourceOfSale) ') as varchar) As SourceOfSale,
			cast(colx.query('data(TypeOfSale) ') as varchar) As TypeOfSale
		From @pDetailsForSale.nodes('Sales') as Tabx(colx);

		--Select * From dbo.#tblSales;
		Declare @caseStatus_OpenValue varchar(10), @caseStatus_ClosedValue varchar(10);
		Select
			@caseStatus_OpenValue = CodeVal
		From dbo.CRM_LookupMaster Where DataGroup='OpenClosed' And TxtVal='Open';
		Select
			@caseStatus_ClosedValue = CodeVal
		From dbo.CRM_LookupMaster Where DataGroup='OpenClosed' And TxtVal='Closed';

		Declare @rowCnt bigint;
		If Exists(Select 1 From dbo.#tblSales Where Sale_ID Is Not NULL)
		Begin
			If Not Exists(Select 1 From dbo.Sales Where Sale_ID In (Select Sale_ID From dbo.#tblSales))
			Begin
				Select -1 As 'RowCount', 'Update Failure' As 'Status', 'Sale_ID not found' As 'Description';
			End
			Else
			Begin
				Update A
				Set 
					A.CustQuote_ID = B.CustQuote_ID,
					A.Plan_ID = B.PlanID,
					A.PlanType = B.PlanType,
					A.HICN_MBI = B.HICNMBI,
					A.ContractNumber = B.ContractNumber,
					A.PBPNumber = B.PBPNumber,
					A.Confirmation_Number = B.Confirmation_Number,
					A.PolicyNumber = B.PolicyNumber,
					A.SubmitStatus = B.SubmitStatus,
					A.IssueStatus = B.IssueStatus,
					A.SourceOfSale = B.SourceOfSale,
					A.TypeOfSale = B.TypeOfSale
				From dbo.Sales A
				Inner Join dbo.#tblSales B
				On A.Sale_ID = B.Sale_ID;

				Set @rowCnt = @@ROWCOUNT;

				-- close the customer lead
				Update A
				Set A.CaseStatusCode = @caseStatus_ClosedValue
				From dbo.Customer_Leads A
				Inner Join dbo.#tblSales B
				On A.CustLead_ID = B.CustLead_ID;

				Select @rowCnt As 'RowCount', 'Update Success' As 'Status', @strSale_ID As 'Description';
			End
		End
		Else
		Begin
			Set Identity_Insert dbo.Sales On;

			Declare @saleId bigint;
			Select @saleId = (Coalesce(Max(Sale_ID), 0) + 1) From dbo.Sales;

			--Print @custQuoteId;

			Insert Into dbo.Sales(
			Sale_ID,[CustDetail_ID],[CustLead_ID],[CallInteraction_ID],[CustQuote_ID],[Plan_ID],[PlanType],[Carrier],
			[HICN_MBI],[ContractNumber],[PolicyNumber],[PBPNumber],[Confirmation_Number],[SubmitStatus],[IssueStatus],
			[SourceOfSale],[TypeOfSale])
			Select
				@saleId
				,[CustDetail_ID]
				,[CustLead_ID]
				,[CallInteraction_ID]
				,[CustQuote_ID]
				,[PlanID]
				,[PlanType]
				,[Carrier]
				,[HICNMBI]
				,[ContractNumber]
				,[PolicyNumber]
				,[PBPNumber]
				,[Confirmation_Number]
				,[SubmitStatus]
				,[IssueStatus]
				,[SourceOfSale]
				,[TypeOfSale]
			From dbo.#tblSales;

			-- close the customer lead
			Update A
			Set A.CaseStatusCode = @caseStatus_ClosedValue
			From dbo.Customer_Leads A
			Inner Join dbo.#tblSales B
			On A.CustLead_ID = B.CustLead_ID;

			Set @rowCnt = @@ROWCOUNT;

			Set Identity_Insert dbo.Sales Off;

			Select @rowCnt As 'RowCount', 'Insert Success' As 'Status', Cast(@saleId As varchar) As 'Description';
		End
		
		Drop Table dbo.#tblSales;

		-- since IMPLICIT TRANSACTION is ON by default to a COMMIT for the above DROP statement
		Commit Tran; 
	End Try
	Begin Catch
		Print XACT_STATE();

		--IF (XACT_STATE() = -1 )

		--Begin

		Rollback Tran;

		--End
		Declare
			@ErrorMessage nvarchar(max), @ErrorSeverity int, @ErrorState int
		Select
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	End Catch
End

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateAppointmentDetails]    Script Date: 9/17/2024 4:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE Procedure [dbo].[uspUpdateAppointmentDetails]
 (
	@pReminder_Datetime Datetime,
	@pAppointment_ID bigint
 )
 As
 Begin

 Declare @rowCount int;

  Update dbo.Appointment_Reminder set Reminder_Datetime=@pReminder_Datetime where
   Appointment_ID=@pAppointment_ID

   Set @rowCount = @@ROWCOUNT;

   Select @rowCount As [RowCount]


 End
 
GO
