SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_etblPeriod_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[_etblPeriod];

	WITH [DIST_FK1] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC1].[iYearID] AS [iYearID]
		FROM [CSG_1_FOODS_ext].[_etblPeriod] [EXT_DIS_SRC1]
	)
	, [FIND_BK_FK1] AS 
	( 
		SELECT 
			  UPPER( CONVERT(VARCHAR, [SAT_SRC1].[dYearStartDate] , 103)) AS [BK_dYearStartDate]
			, UPPER( CONVERT(VARCHAR, [SAT_SRC1].[idYear] , 1)) AS [BK_idYear]
			, [DIST_FK1].[iYearID] AS [iYearID]
		FROM [DIST_FK1]
		INNER JOIN [raw].[SAT_CSG_1_FOODS_FinancialYear] [SAT_SRC1] ON  [DIST_FK1].[iYearID] = [SAT_SRC1].[idYear]
		INNER JOIN [raw].[HUB_FinancialYear] [HUB_SRC1] ON  [HUB_SRC1].[HK_FinancialYear] = [SAT_SRC1].[HK_FinancialYear]
		WHERE  [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
		UNION 
		SELECT 
			  [EXT_FKBK_SRC1].[BK_dYearStartDate] AS [BK_dYearStartDate]
			, [EXT_FKBK_SRC1].[BK_idYear] AS [BK_idYear]
			, [DIST_FK1].[iYearID] AS [iYearID]
		FROM [DIST_FK1]
		INNER JOIN [CSG_1_FOODS_ext].[_etblPeriodYear] [EXT_FKBK_SRC1] ON  [DIST_FK1].[iYearID] = [EXT_FKBK_SRC1].[idYear]
	)
	INSERT INTO [CSG_1_FOODS_stage].[_etblPeriod](
		 [HK_FinancialPeriod]
		,[HK_FinancialYear]
		,[HKLINK_FinancialPeriod_FinancialYear]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idPeriod]
		,[iYearID]
		,[BK_FinancialPeriod]
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
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_dPeriodDate] + '|' +
			[EXT_SRC].[BK_idPeriod] + '|'),2)) AS [HK_FinancialPeriod]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_dYearStartDate],
			[MEX_SRC].[KEY_ATTRIBUTE_DATETIME2])+ '|' +  COALESCE([FIND_BK_FK1].[BK_idYear],[MEX_SRC].[KEY_ATTRIBUTE_INT])+
			'|'),2)) AS [HK_FinancialYear]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_dPeriodDate] + '|' +
			[EXT_SRC].[BK_idPeriod] + '|' + 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_dYearStartDate],
			[MEX_SRC].[KEY_ATTRIBUTE_DATETIME2])+ '|' +  COALESCE([FIND_BK_FK1].[BK_idYear],[MEX_SRC].[KEY_ATTRIBUTE_INT])+
			'|'),2)) AS [HKLINK_FinancialPeriod_FinancialYear]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[idPeriod] AS [idPeriod]
		, [EXT_SRC].[iYearID] AS [iYearID]
		, [EXT_SRC].[BK_dPeriodDate] + '|' +  [EXT_SRC].[BK_idPeriod] AS [BK_FinancialPeriod]
		, [EXT_SRC].[dPeriodDate] AS [dPeriodDate]
		, [EXT_SRC].[bBlocked] AS [bBlocked]
		, [EXT_SRC].[bPBTProcessed] AS [bPBTProcessed]
		, [EXT_SRC].[bPeriodProcessed] AS [bPeriodProcessed]
		, [EXT_SRC].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
		, [EXT_SRC].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
		, [EXT_SRC].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
		, [EXT_SRC].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
		, [EXT_SRC].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
		, [EXT_SRC].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
		, [EXT_SRC].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
		, [EXT_SRC].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
		, [EXT_SRC].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
	FROM [CSG_1_FOODS_ext].[_etblPeriod] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	LEFT OUTER JOIN [FIND_BK_FK1] ON  [EXT_SRC].[iYearID] = [FIND_BK_FK1].[iYearID]
	;
END;


END;

 
 


GO
