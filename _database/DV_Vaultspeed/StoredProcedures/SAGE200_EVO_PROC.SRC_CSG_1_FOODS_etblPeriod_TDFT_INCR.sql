SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].[SRC_CSG_1_FOODS_etblPeriod_TDFT_INCR] AS 
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
BEGIN -- TDFT_TGT

	TRUNCATE TABLE [dv_CSG_1_FOODS].[_etblPeriod];

	WITH [DELTA_VIEW] AS 
	( 
		SELECT 
			  CAST('SRC'  AS VARCHAR) AS [DATATYPE]
			, [CDC_SRC].[idPeriod] AS [idPeriod]
			, [CDC_SRC].[iYearID] AS [iYearID]
			, [CDC_SRC].[dPeriodDate] AS [dPeriodDate]
			, [CDC_SRC].[bBlocked] AS [bBlocked]
			, [CDC_SRC].[bPBTProcessed] AS [bPBTProcessed]
			, [CDC_SRC].[bPeriodProcessed] AS [bPeriodProcessed]
			, [CDC_SRC].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
			, [CDC_SRC].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
			, [CDC_SRC].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
			, [CDC_SRC].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
			, [CDC_SRC].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
			, [CDC_SRC].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
			, [CDC_SRC].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
			, [CDC_SRC].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
			, [CDC_SRC].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
		FROM [CSG_1_FOODS].[_etblPeriod] [CDC_SRC]
	)
	, [PREPJOINBK] AS 
	( 
		SELECT
			  [DELTA_VIEW].[DATATYPE] AS [DATATYPE]
			, COALESCE(REPLACE([DELTA_VIEW].[idPeriod],',',''),[MEX_BK_SRC].[KEY_ATTRIBUTE_INT]) AS [idPeriod]
			, COALESCE(REPLACE([DELTA_VIEW].[iYearID],',',''),[MEX_BK_SRC].[KEY_ATTRIBUTE_INT]) AS [iYearID]
			, [DELTA_VIEW].[dPeriodDate] AS [dPeriodDate]
			, REPLACE([DELTA_VIEW].[bBlocked],',','') AS [bBlocked]
			, REPLACE([DELTA_VIEW].[bPBTProcessed],',','') AS [bPBTProcessed]
			, REPLACE([DELTA_VIEW].[bPeriodProcessed],',','') AS [bPeriodProcessed]
			, REPLACE([DELTA_VIEW].[_etblPeriod_iBranchID],',','') AS [_etblPeriod_iBranchID]
			, [DELTA_VIEW].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
			, [DELTA_VIEW].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
			, REPLACE([DELTA_VIEW].[_etblPeriod_iCreatedBranchID],',','') AS [_etblPeriod_iCreatedBranchID]
			, REPLACE([DELTA_VIEW].[_etblPeriod_iModifiedBranchID],',','') AS [_etblPeriod_iModifiedBranchID]
			, REPLACE([DELTA_VIEW].[_etblPeriod_iCreatedAgentID],',','') AS [_etblPeriod_iCreatedAgentID]
			, REPLACE([DELTA_VIEW].[_etblPeriod_iModifiedAgentID],',','') AS [_etblPeriod_iModifiedAgentID]
			, REPLACE([DELTA_VIEW].[_etblPeriod_iChangeSetID],',','') AS [_etblPeriod_iChangeSetID]
			, [DELTA_VIEW].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
		FROM [DELTA_VIEW]
		INNER JOIN [dc].[EXECEPTION] [MEX_BK_SRC] ON  1 = 1
		WHERE  [MEX_BK_SRC].[DATATYPE] = '#'
	)
	INSERT INTO [dv_CSG_1_FOODS].[_etblPeriod](
		 [DATATYPE]
		,[idPeriod]
		,[iYearID]
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
		  [PREPJOINBK].[DATATYPE] AS [DATATYPE]
		, [PREPJOINBK].[idPeriod] AS [idPeriod]
		, [PREPJOINBK].[iYearID] AS [iYearID]
		, [PREPJOINBK].[dPeriodDate] AS [dPeriodDate]
		, [PREPJOINBK].[bBlocked] AS [bBlocked]
		, [PREPJOINBK].[bPBTProcessed] AS [bPBTProcessed]
		, [PREPJOINBK].[bPeriodProcessed] AS [bPeriodProcessed]
		, [PREPJOINBK].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
		, [PREPJOINBK].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
		, [PREPJOINBK].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
		, [PREPJOINBK].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
		, [PREPJOINBK].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
		, [PREPJOINBK].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
		, [PREPJOINBK].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
		, [PREPJOINBK].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
		, [PREPJOINBK].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
	FROM [PREPJOINBK]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [raw].[SAT_CSG_1_FOODS_FinancialPeriod] [SAT_SRC1] ON  CONVERT(INT, [PREPJOINBK].[idPeriod] , 1) = [SAT_SRC1].[idPeriod] AND [SAT_SRC1].[LOAD_CYCLE_ID] =
		[LCI_SRC].[LOAD_CYCLE_ID]
	WHERE  [SAT_SRC1].[HK_FinancialPeriod] IS NULL
	;
END;


END;

 
 


GO
