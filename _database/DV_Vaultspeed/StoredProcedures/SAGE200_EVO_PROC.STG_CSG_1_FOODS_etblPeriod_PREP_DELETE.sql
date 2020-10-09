SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_etblPeriod_PREP_DELETE AS 
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
BEGIN -- STG_PREP_DEL_TGT

	INSERT INTO [CSG_1_FOODS_stage].[_etblPeriod](
		 [HK_FinancialPeriod]
		,[HKLINK_FinancialPeriod_FinancialYear]
		,[HK_FinancialYear]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[LOAD_CYCLE_ID]
		,[LOADDT]
		,[idPeriod]
		,[dPeriodDate]
		,[BK_FinancialPeriod]
		,[iYearID]
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
		  [HUB_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
		, [LNK_SRC1].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
		, [LNK_SRC1].[HK_FinancialYear] AS [HK_FinancialYear]
		, '-' AS [CHANGE_TYPE]
		, 'SRC' AS [DATATYPE]
		, [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [SAT_SRC1].[idPeriod] AS [idPeriod]
		, [SAT_SRC1].[dPeriodDate] AS [dPeriodDate]
		, [HUB_SRC].[BK_FinancialPeriod] AS [BK_FinancialPeriod]
		, [LKS_SRC1].[iYearID] AS [iYearID]
		, [SAT_SRC1].[bBlocked] AS [bBlocked]
		, [SAT_SRC1].[bPBTProcessed] AS [bPBTProcessed]
		, [SAT_SRC1].[bPeriodProcessed] AS [bPeriodProcessed]
		, [SAT_SRC1].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
		, [SAT_SRC1].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
		, [SAT_SRC1].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
		, [SAT_SRC1].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
		, [SAT_SRC1].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
		, [SAT_SRC1].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
		, [SAT_SRC1].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
		, [SAT_SRC1].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
		, [SAT_SRC1].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
	FROM [raw].[HUB_FinancialPeriod] [HUB_SRC]
	INNER JOIN [raw].[SAT_CSG_1_FOODS_FinancialPeriod] [SAT_SRC1] ON  [SAT_SRC1].[HK_FinancialPeriod] = [HUB_SRC].[HK_FinancialPeriod] AND [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2,
		'31/12/2999' , 103) AND [SAT_SRC1].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_FinancialPeriod_FinancialYear] [LNK_SRC1] ON  [LNK_SRC1].[HK_FinancialPeriod] = [HUB_SRC].[HK_FinancialPeriod]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear] [LKS_SRC1] ON  [LKS_SRC1].[HKLINK_FinancialPeriod_FinancialYear] =
		[LNK_SRC1].[HKLINK_FinancialPeriod_FinancialYear] AND [LKS_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC1].[ISDELETED] = 'N'
	LEFT OUTER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [HUB_SRC].[LOAD_CYCLE_ID] = CONVERT(int, [MEX_SRC].[LOAD_CYCLE_ID] )
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [CSG_1_FOODS_stage].[_etblPeriod] [STG_SRC] ON  [HUB_SRC].[HK_FinancialPeriod] = [STG_SRC].[HK_FinancialPeriod] AND [HUB_SRC].[SOURCE_SYSTEM] =
		[STG_SRC].[SOURCE_SYSTEM]
	WHERE  [STG_SRC].[LOAD_CYCLE_ID] IS NULL AND [MEX_SRC].[LOAD_CYCLE_ID] IS NULL
	;
END;


END;

 
 


GO
