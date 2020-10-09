SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_etblPeriod_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[_etblPeriod];

	INSERT INTO [CSG_1_FOODS_ext].[_etblPeriod](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idPeriod]
		,[iYearID]
		,[BK_dPeriodDate]
		,[BK_idPeriod]
		,[dPeriodDate]
		,[bBlocked]
		,[bPBTProcessed]
		,[bPeriodProcessed]
		,[_etblPeriod_iBranchID]
		,[_etblPeriod_dCreatedDate]
		,[_etblPeriod_dModifiedDate]
		,[_etblPeriod_iCreatedBranchID]
		,[_etblPeriod_iModifiedBranchID]
		,[_etblPeriod_iCreatedAgentID]
		,[_etblPeriod_iModifiedAgentID]
		,[_etblPeriod_iChangeSetID]
		,[_etblPeriod_Checksum]
	)
	SELECT 
		  [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, dateadd(MICROSECOND, 2*row_number() over (order by [LCI_SRC].[LOADDT]), SYSDATETIME()) AS [LOADDT]
		, [MEX_SRC].[ATTRIBUTE_VARCHAR] AS [CHANGE_TYPE]
		, [TDFV_SRC].[DATATYPE] AS [DATATYPE]
		, CONVERT(INT, [TDFV_SRC].[idPeriod] , 1) AS [idPeriod]
		, CONVERT(INT, [TDFV_SRC].[iYearID] , 1) AS [iYearID]
		, COALESCE(UPPER([TDFV_SRC].[dPeriodDate]),[MEX_SRC].[KEY_ATTRIBUTE_DATETIME2]) AS [BK_dPeriodDate]
		, COALESCE(UPPER([TDFV_SRC].[idPeriod]),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_idPeriod]
		, CONVERT(DATETIME2, [TDFV_SRC].[dPeriodDate] , 103) AS [dPeriodDate]
		, CONVERT(BIT, [TDFV_SRC].[bBlocked] , 1) AS [bBlocked]
		, CONVERT(BIT, [TDFV_SRC].[bPBTProcessed] , 1) AS [bPBTProcessed]
		, CONVERT(BIT, [TDFV_SRC].[bPeriodProcessed] , 1) AS [bPeriodProcessed]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriod_iBranchID] , 1) AS [_etblPeriod_iBranchID]
		, CONVERT(DATETIME2, [TDFV_SRC].[_etblPeriod_dCreatedDate] , 103) AS [_etblPeriod_dCreatedDate]
		, CONVERT(DATETIME2, [TDFV_SRC].[_etblPeriod_dModifiedDate] , 103) AS [_etblPeriod_dModifiedDate]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriod_iCreatedBranchID] , 1) AS [_etblPeriod_iCreatedBranchID]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriod_iModifiedBranchID] , 1) AS [_etblPeriod_iModifiedBranchID]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriod_iCreatedAgentID] , 1) AS [_etblPeriod_iCreatedAgentID]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriod_iModifiedAgentID] , 1) AS [_etblPeriod_iModifiedAgentID]
		, CONVERT(INT, [TDFV_SRC].[_etblPeriod_iChangeSetID] , 1) AS [_etblPeriod_iChangeSetID]
		, CAST([TDFV_SRC].[_etblPeriod_Checksum]  AS BINARY) AS [_etblPeriod_Checksum]
	FROM [dv_CSG_1_FOODS].[VW__etblPeriod] [TDFV_SRC]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
