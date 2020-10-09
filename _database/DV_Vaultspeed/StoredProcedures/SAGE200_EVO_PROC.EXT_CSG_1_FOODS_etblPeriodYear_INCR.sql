SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_etblPeriodYear_INCR AS 
/*
    ___  ___  ______  |  
   / _ \/ _ \|  ____| |  agile    
  / / \ \/ \ \ |__    |  automation
 / /  /\ \  \ \ __|   |  factory   
/_/  /_/\_\  \_\      | 

Vaultspeed version: 4.1.16.6, generation date: 2020/09/22 13:12:11
DV_NAME: CSG_DV - Release: CSG_DV_V11(11) - Comment: CSG_DV_V11 - Release date: 2020/09/22 12:36:07, 
BV release: init(1) - Comment: initial release - Release date: 2020/09/22 10:44:25, 
SRC_NAME: CSG_1_FOODS - Release: CSG_1_FOODS(6) - Comment: Release 6.0 - Release date: 2020/09/22 12:10:29
 */


BEGIN 
BEGIN -- EXT_TGT

	TRUNCATE TABLE [CSG_1_FOODS_ext].[_etblPeriodYear];

	INSERT INTO [CSG_1_FOODS_ext].[_etblPeriodYear](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idYear]
		,[BK_dYearStartDate]
		,[BK_idYear]
		,[dYearStartDate]
		,[cYearDescription]
		,[bArchived]
		,[bPurged]
		,[_etblPeriodYear_iBranchID]
		,[_etblPeriodYear_dCreatedDate]
		,[_etblPeriodYear_dModifiedDate]
		,[_etblPeriodYear_iCreatedBranchID]
		,[_etblPeriodYear_iModifiedBranchID]
		,[_etblPeriodYear_iCreatedAgentID]
		,[_etblPeriodYear_iModifiedAgentID]
		,[_etblPeriodYear_iChangeSetID]
		,[_etblPeriodYear_Checksum]
	)
	SELECT 
		  [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, dateadd(MICROSECOND, 2*row_number() over (order by [LCI_SRC].[LOADDT]), SYSDATETIME()) AS [LOADDT]
		, [MEX_SRC].[ATTRIBUTE_VARCHAR] AS [CHANGE_TYPE]
		, [TDFV_SRC].[DATATYPE] AS [DATATYPE]
		, CONVERT(INT, [TDFV_SRC].[idYear] , 1) AS [idYear]
		, COALESCE(UPPER([TDFV_SRC].[dYearStartDate]),[MEX_SRC].[KEY_ATTRIBUTE_DATETIME2]) AS [BK_dYearStartDate]
		, COALESCE(UPPER([TDFV_SRC].[idYear]),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_idYear]
		, CONVERT(DATETIME2, [TDFV_SRC].[dYearStartDate] , 103) AS [dYearStartDate]
		, [TDFV_SRC].[cYearDescription]  AS [cYearDescription]
		, CONVERT(BIT, [TDFV_SRC].[bArchived] , 1) AS [bArchived]
		, CONVERT(BIT, [TDFV_SRC].[bPurged] , 1) AS [bPurged]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriodYear_iBranchID] , 1) AS [_etblPeriodYear_iBranchID]
		, CONVERT(DATETIME2, [TDFV_SRC].[_etblPeriodYear_dCreatedDate] , 103) AS [_etblPeriodYear_dCreatedDate]
		, CONVERT(DATETIME2, [TDFV_SRC].[_etblPeriodYear_dModifiedDate] , 103) AS [_etblPeriodYear_dModifiedDate]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriodYear_iCreatedBranchID] , 1) AS [_etblPeriodYear_iCreatedBranchID]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriodYear_iModifiedBranchID] , 1) AS [_etblPeriodYear_iModifiedBranchID]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriodYear_iCreatedAgentID] , 1) AS [_etblPeriodYear_iCreatedAgentID]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriodYear_iModifiedAgentID] , 1) AS [_etblPeriodYear_iModifiedAgentID]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriodYear_iChangeSetID] , 1) AS [_etblPeriodYear_iChangeSetID]
		, CAST([TDFV_SRC].[_etblPeriodYear_Checksum]  AS BINARY) AS [_etblPeriodYear_Checksum]
	FROM [dv_CSG_1_FOODS].[VW__etblPeriodYear] [TDFV_SRC]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
