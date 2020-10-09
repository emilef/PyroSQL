SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_etblPeriodYear_INCR AS 
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
BEGIN -- STG_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[_etblPeriodYear];

	INSERT INTO [CSG_1_FOODS_stage].[_etblPeriodYear](
		 [HK_FinancialYear]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idYear]
		,[BK_FinancialYear]
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
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_dYearStartDate] + '|' +
			[EXT_SRC].[BK_idYear] + '|'),2)) AS [HK_FinancialYear]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[idYear] AS [idYear]
		, [EXT_SRC].[BK_dYearStartDate] + '|' +  [EXT_SRC].[BK_idYear] AS [BK_FinancialYear]
		, [EXT_SRC].[dYearStartDate] AS [dYearStartDate]
		, [EXT_SRC].[cYearDescription] AS [cYearDescription]
		, [EXT_SRC].[bArchived] AS [bArchived]
		, [EXT_SRC].[bPurged] AS [bPurged]
		, [EXT_SRC].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
		, [EXT_SRC].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
		, [EXT_SRC].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
		, [EXT_SRC].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
		, [EXT_SRC].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
		, [EXT_SRC].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
		, [EXT_SRC].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
		, [EXT_SRC].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
		, [EXT_SRC].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
	FROM [CSG_1_FOODS_ext].[_etblPeriodYear] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	;
END;


END;

 
 


GO
