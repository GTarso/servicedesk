USE [master]
GO
/****** Object:  Database [servicedesk]    Script Date: 26/10/2023 10:14:11 ******/
CREATE DATABASE [servicedesk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'servicedesk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\servicedesk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'servicedesk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\servicedesk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [servicedesk] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [servicedesk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [servicedesk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [servicedesk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [servicedesk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [servicedesk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [servicedesk] SET ARITHABORT OFF 
GO
ALTER DATABASE [servicedesk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [servicedesk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [servicedesk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [servicedesk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [servicedesk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [servicedesk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [servicedesk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [servicedesk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [servicedesk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [servicedesk] SET  DISABLE_BROKER 
GO
ALTER DATABASE [servicedesk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [servicedesk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [servicedesk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [servicedesk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [servicedesk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [servicedesk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [servicedesk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [servicedesk] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [servicedesk] SET  MULTI_USER 
GO
ALTER DATABASE [servicedesk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [servicedesk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [servicedesk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [servicedesk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [servicedesk] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [servicedesk] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [servicedesk] SET QUERY_STORE = ON
GO
ALTER DATABASE [servicedesk] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [servicedesk]
GO
/****** Object:  Table [dbo].[AssignmentGroupTable]    Script Date: 26/10/2023 10:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentGroupTable](
	[idAssignmentGroup] [int] NOT NULL,
	[AssignmentGroupName] [varchar](100) NOT NULL,
	[AssignmentGroupOwner] [varchar](100) NOT NULL,
	[AssignmentGroupCompany] [varchar](100) NOT NULL,
	[AssignmentGroupLocation] [varchar](100) NOT NULL,
	[AssignmentGroupTimezone] [varchar](50) NOT NULL,
	[AssignmentGroupMembers] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AssignmentGroupTable] PRIMARY KEY CLUSTERED 
(
	[idAssignmentGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttachmentsTable]    Script Date: 26/10/2023 10:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachmentsTable](
	[idAttachments] [int] NOT NULL,
	[AttachmentsUsername] [varchar](50) NOT NULL,
	[AttachmentsText] [varbinary](max) NOT NULL,
	[AttachmentsImage] [varbinary](max) NOT NULL,
	[AttachmentsEmail] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_AttachmentsTable] PRIMARY KEY CLUSTERED 
(
	[idAttachments] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembersTable]    Script Date: 26/10/2023 10:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembersTable](
	[idMember] [int] NOT NULL,
	[MemberUsername] [varchar](50) NOT NULL,
	[MemberName] [varchar](100) NOT NULL,
	[MemberEmail] [varchar](100) NOT NULL,
	[MemberLocation] [varchar](100) NOT NULL,
	[MemberCompany] [varchar](100) NOT NULL,
	[MemberPersonalNumber] [bigint] NOT NULL,
	[MemberWorkNumber] [bigint] NOT NULL,
 CONSTRAINT [PK_MembersTable] PRIMARY KEY CLUSTERED 
(
	[idMember] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequesterTable]    Script Date: 26/10/2023 10:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequesterTable](
	[idRequester] [int] NOT NULL,
	[RequesterUsername] [varchar](50) NOT NULL,
	[RequesterName] [varchar](100) NOT NULL,
	[RequesterEmail] [varchar](100) NOT NULL,
	[RequesterWorkNumber] [bigint] NOT NULL,
	[RequesterPersonalNumber] [bigint] NOT NULL,
	[RequesterCompany] [varchar](100) NOT NULL,
	[RequesterLocation] [varchar](100) NOT NULL,
 CONSTRAINT [PK_RequesterTable] PRIMARY KEY CLUSTERED 
(
	[idRequester] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketHistoryTable]    Script Date: 26/10/2023 10:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketHistoryTable](
	[idTicketHistory] [int] NOT NULL,
	[AssignmentGroupHistory] [varchar](100) NOT NULL,
	[UpdateDateHistory] [datetime] NOT NULL,
	[UsernameWorkerHistory] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TicketHistoryTable] PRIMARY KEY CLUSTERED 
(
	[idTicketHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTable]    Script Date: 26/10/2023 10:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTable](
	[idTicket] [int] NOT NULL,
	[TicketTitle] [varchar](100) NOT NULL,
	[TicketDescription] [text] NOT NULL,
	[TicketImpact] [varchar](50) NOT NULL,
	[TicketPriority] [varchar](50) NOT NULL,
	[TicketUrgency] [varchar](50) NOT NULL,
	[TicketAssignmentGroup] [varchar](50) NOT NULL,
	[TicketCurrentStatus] [varchar](50) NOT NULL,
	[TicketEscalationStatus] [varchar](50) NOT NULL,
	[TicketAffectedArea] [varchar](50) NOT NULL,
	[TicketAttachments] [varbinary](max) NOT NULL,
	[TicketHistory] [text] NOT NULL,
	[TicketSolution] [text] NOT NULL,
	[TicketTags] [varchar](255) NOT NULL,
	[TicketOpenDate] [datetime] NOT NULL,
	[TicketCloseDate] [datetime] NOT NULL,
	[TicketLastUpdateDate] [datetime] NOT NULL,
	[TicketKPI] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[idTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the Assignment Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignmentGroupTable', @level2type=N'COLUMN',@level2name=N'idAssignmentGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the Assignment Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignmentGroupTable', @level2type=N'COLUMN',@level2name=N'AssignmentGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Owner of the Assignment Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignmentGroupTable', @level2type=N'COLUMN',@level2name=N'AssignmentGroupOwner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Company of the Assignment Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignmentGroupTable', @level2type=N'COLUMN',@level2name=N'AssignmentGroupCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location of the Assignment Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignmentGroupTable', @level2type=N'COLUMN',@level2name=N'AssignmentGroupLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Timezone of the Assignment Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignmentGroupTable', @level2type=N'COLUMN',@level2name=N'AssignmentGroupTimezone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Members of the Assignment Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AssignmentGroupTable', @level2type=N'COLUMN',@level2name=N'AssignmentGroupMembers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the attachments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachmentsTable', @level2type=N'COLUMN',@level2name=N'idAttachments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The username of the user that have attached a evidence on the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachmentsTable', @level2type=N'COLUMN',@level2name=N'AttachmentsUsername'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the text attached on the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachmentsTable', @level2type=N'COLUMN',@level2name=N'AttachmentsText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the images attached on the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachmentsTable', @level2type=N'COLUMN',@level2name=N'AttachmentsImage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the emails attached on the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachmentsTable', @level2type=N'COLUMN',@level2name=N'AttachmentsEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the Member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembersTable', @level2type=N'COLUMN',@level2name=N'idMember'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Username of the Member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembersTable', @level2type=N'COLUMN',@level2name=N'MemberUsername'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Complete Name of the Member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembersTable', @level2type=N'COLUMN',@level2name=N'MemberName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email of the Member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembersTable', @level2type=N'COLUMN',@level2name=N'MemberEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location of the Member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembersTable', @level2type=N'COLUMN',@level2name=N'MemberLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Company of the Member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembersTable', @level2type=N'COLUMN',@level2name=N'MemberCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Personal phone number of the Member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembersTable', @level2type=N'COLUMN',@level2name=N'MemberPersonalNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Work number of the Member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembersTable', @level2type=N'COLUMN',@level2name=N'MemberWorkNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ID of the Requester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequesterTable', @level2type=N'COLUMN',@level2name=N'idRequester'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Username of the Requester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequesterTable', @level2type=N'COLUMN',@level2name=N'RequesterUsername'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current name of the Requester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequesterTable', @level2type=N'COLUMN',@level2name=N'RequesterName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current Email of the Requester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequesterTable', @level2type=N'COLUMN',@level2name=N'RequesterEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The work phone number of the Requester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequesterTable', @level2type=N'COLUMN',@level2name=N'RequesterWorkNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current personal phone number of the Requester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequesterTable', @level2type=N'COLUMN',@level2name=N'RequesterPersonalNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current company of the Requester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequesterTable', @level2type=N'COLUMN',@level2name=N'RequesterCompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current location that the Requester works.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequesterTable', @level2type=N'COLUMN',@level2name=N'RequesterLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of all the ticket history' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketHistoryTable', @level2type=N'COLUMN',@level2name=N'idTicketHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All history of the groups that worked on the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketHistoryTable', @level2type=N'COLUMN',@level2name=N'AssignmentGroupHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the date and time of updates.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketHistoryTable', @level2type=N'COLUMN',@level2name=N'UpdateDateHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the Useernames that worked on the ticket.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketHistoryTable', @level2type=N'COLUMN',@level2name=N'UsernameWorkerHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'idTicket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title of the incident ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the ticket that the requester opened.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current impact of the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketImpact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The priority of the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketPriority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The urgency of the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketUrgency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current assignment Group of the ticket that will work on.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketAssignmentGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current status of the ticket (opened, transfered, working, etc)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketCurrentStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current escalation status of the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketEscalationStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the affected area of the ticket (production, etc)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketAffectedArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the Attachments in the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketAttachments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the groups and text log of the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The text of the solution in the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketSolution'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'All of the tags of the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketTags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time that the ticket was opened' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketOpenDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time that the ticket was closed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketCloseDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last time the ticket was updated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketLastUpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'KPI of the ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketTable', @level2type=N'COLUMN',@level2name=N'TicketKPI'
GO
USE [master]
GO
ALTER DATABASE [servicedesk] SET  READ_WRITE 
GO
