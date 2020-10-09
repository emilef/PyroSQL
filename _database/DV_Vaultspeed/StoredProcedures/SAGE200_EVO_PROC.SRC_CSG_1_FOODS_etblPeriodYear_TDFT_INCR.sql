SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].[SRC_CSG_1_FOODS_etblPeriodYear_TDFT_INCR] AS 
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

	TRUNCATE TABLE [dv_CSG_1_FOODS].[_etblPeriodYear];

	WITH [DELTA_VIEW] AS 
	( 
		SELECT 
			  CAST('SRC'  AS VARCHAR) AS [DATATYPE]
			, [CDC_SRC].[idYear] AS [idYear]
			, [CDC_SRC].[dYearStartDate] AS [dYearStartDate]
			, [CDC_SRC].[cYearDescription] AS [cYearDescription]
			, [CDC_SRC].[bArchived] AS [bArchived]
			, [CDC_SRC].[bPurged] AS [bPurged]
			, [CDC_SRC].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
			, [CDC_SRC].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
			, [CDC_SRC].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
			, [CDC_SRC].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
			, [CDC_SRC].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
			, [CDC_SRC].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
			, [CDC_SRC].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
			, [CDC_SRC].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
			, [CDC_SRC].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
		FROM [CSG_1_FOODS].[_etblPeriodYear] [CDC_SRC]
	)
	, [PREPJOINBK] AS 
	( 
		SELECT
			  [DELTA_VIEW].[DATATYPE] AS [DATATYPE]
			, COALESCE(REPLACE([DELTA_VIEW].[idYear],',',''),[MEX_BK_SRC].[KEY_ATTRIBUTE_INT]) AS [idYear]
			, [DELTA_VIEW].[dYearStartDate] AS [dYearStartDate]
			, [DELTA_VIEW].[cYearDescription] AS [cYearDescription]
			, REPLACE([DELTA_VIEW].[bArchived],',','') AS [bArchived]
			, REPLACE([DELTA_VIEW].[bPurged],',','') AS [bPurged]
			, REPLACE([DELTA_VIEW].[_etblPeriodYear_iBranchID],',','') AS [_etblPeriodYear_iBranchID]
			, [DELTA_VIEW].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
			, [DELTA_VIEW].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
			, REPLACE([DELTA_VIEW].[_etblPeriodYear_iCreatedBranchID],',','') AS [_etblPeriodYear_iCreatedBranchID]
			, REPLACE([DELTA_VIEW].[_etblPeriodYear_iModifiedBranchID],',','') AS [_etblPeriodYear_iModifiedBranchID]
			, REPLACE([DELTA_VIEW].[_etblPeriodYear_iCreatedAgentID],',','') AS [_etblPeriodYear_iCreatedAgentID]
			, REPLACE([DELTA_VIEW].[_etblPeriodYear_iModifiedAgentID],',','') AS [_etblPeriodYear_iModifiedAgentID]
			, REPLACE([DELTA_VIEW].[_etblPeriodYear_iChangeSetID],',','') AS [_etblPeriodYear_iChangeSetID]
			, [DELTA_VIEW].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
		FROM [DELTA_VIEW]
		INNER JOIN [dc].[EXECEPTION] [MEX_BK_SRC] ON  1 = 1
		WHERE  [MEX_BK_SRC].[DATATYPE] = '#'
	)
	INSERT INTO [dv_CSG_1_FOODS].[_etblPeriodYear](
		 [DATATYPE]
		,[idYear]
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
		  [PREPJOINBK].[DATATYPE] AS [DATATYPE]
		, [PREPJOINBK].[idYear] AS [idYear]
		, [PREPJOINBK].[dYearStartDate] AS [dYearStartDate]
		, [PREPJOINBK].[cYearDescription] AS [cYearDescription]
		, [PREPJOINBK].[bArchived] AS [bArchived]
		, [PREPJOINBK].[bPurged] AS [bPurged]
		, [PREPJOINBK].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
		, [PREPJOINBK].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
		, [PREPJOINBK].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
		, [PREPJOINBK].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
		, [PREPJOINBK].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
		, [PREPJOINBK].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
		, [PREPJOINBK].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
		, [PREPJOINBK].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
		, [PREPJOINBK].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
	FROM [PREPJOINBK]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [raw].[SAT_CSG_1_FOODS_FinancialYear] [SAT_SRC1] ON  CONVERT(INT, [PREPJOINBK].[idYear] , 1) = [SAT_SRC1].[idYear] AND [SAT_SRC1].[LOAD_CYCLE_ID] =
		[LCI_SRC].[LOAD_CYCLE_ID]
	WHERE  [SAT_SRC1].[HK_FinancialYear] IS NULL
	;
END;


END;

 
 


GO
