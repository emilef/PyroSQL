SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dv_CSG_1_FOODS].[VW__etblPeriodYear] AS 
	SELECT
		  [TDFT_SRC].[DATATYPE] AS [DATATYPE]
		, [TDFT_SRC].[idYear] AS [idYear]
		, [TDFT_SRC].[dYearStartDate] AS [dYearStartDate]
		, [TDFT_SRC].[cYearDescription] AS [cYearDescription]
		, [TDFT_SRC].[bArchived] AS [bArchived]
		, [TDFT_SRC].[bPurged] AS [bPurged]
		, [TDFT_SRC].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
		, [TDFT_SRC].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
		, [TDFT_SRC].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
		, [TDFT_SRC].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
		, [TDFT_SRC].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
		, [TDFT_SRC].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
		, [TDFT_SRC].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
		, [TDFT_SRC].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
		, [TDFT_SRC].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
	FROM [dv_CSG_1_FOODS].[_etblPeriodYear] [TDFT_SRC]
	;

GO
