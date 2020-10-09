SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Accutrak].[ProductionData](
	[RowId] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[Fact Vehicle Load Key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vehicle Id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Event Date Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Trip Time In Minutes] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Material Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ore Source Description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Production Date Full] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Shift Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Shift Start Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Shift End Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Shift Active Start Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Shift Active End Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vehicle Description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vehicle Type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source Section name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source Section Type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source Section Definition] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source Section Id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Split Source Location Production] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Destination Section name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Destination Section Type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Destination Section Definition] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Destination Section Id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Split Destination Location Production] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source Arrive Event Date Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source Depart Event Date Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Destination Arrive Event Date Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Destination Depart Event Date Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cycle Source Arrive Event Date Time] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cycle Time In Minutes] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Trip Id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cycle Id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source Location Key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Destination Location Key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Material Key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ore Source Key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Shift Key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vehicle Key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tonnes] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Volume] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bank Cubic Metres] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source Time Spent] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Destination Time Spent] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cycle Source Location Key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Excavator Description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vehicle Key Excavator] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reef Type Id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Is Waste] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reef Type Code] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Distance Travelled For Trip] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Distance Travelled For Cycle] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Event Date Hour] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
