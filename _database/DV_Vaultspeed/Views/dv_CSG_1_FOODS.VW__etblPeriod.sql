SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dv_CSG_1_FOODS].[VW__etblPeriod] AS 
	SELECT
		  [TDFT_SRC].[DATATYPE] AS [DATATYPE]
		, [TDFT_SRC].[idPeriod] AS [idPeriod]
		, [TDFT_SRC].[iYearID] AS [iYearID]
		, [TDFT_SRC].[dPeriodDate] AS [dPeriodDate]
		, [TDFT_SRC].[bBlocked] AS [bBlocked]
		, [TDFT_SRC].[bPBTProcessed] AS [bPBTProcessed]
		, [TDFT_SRC].[bPeriodProcessed] AS [bPeriodProcessed]
		, [TDFT_SRC].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
		, [TDFT_SRC].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
		, [TDFT_SRC].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
		, [TDFT_SRC].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
		, [TDFT_SRC].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
		, [TDFT_SRC].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
		, [TDFT_SRC].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
		, [TDFT_SRC].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
		, [TDFT_SRC].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
	FROM [dv_CSG_1_FOODS].[_etblPeriod] [TDFT_SRC]
	;

GO
