SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_etblGLSegment_INIT AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[_etblGLSegment];

	WITH [PREP_EXCEP] AS 
	( 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, 'SRC' AS [DATATYPE]
			, NULL AS [LOAD_CYCLE_ID]
			, COALESCE( CONVERT(INT, REPLACE([INI_SRC].[idSegment],',','') , 1), CONVERT(INT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_INT] , 1)) AS [idSegment]
			, CONVERT(INT, REPLACE([INI_SRC].[iSegmentNo],',','') , 1) AS [iSegmentNo]
			, [INI_SRC].[cCode]  AS [cCode]
			, [INI_SRC].[cDescription]  AS [cDescription]
			, CONVERT(INT, [INI_SRC].[iSegmentBranchID] , 1) AS [iSegmentBranchID]
			, CONVERT(INT, [INI_SRC].[_etblGLSegment_iBranchID] , 1) AS [_etblGLSegment_iBranchID]
			, CONVERT(DATETIME2, [INI_SRC].[_etblGLSegment_dCreatedDate] , 103) AS [_etblGLSegment_dCreatedDate]
			, CONVERT(DATETIME2, [INI_SRC].[_etblGLSegment_dModifiedDate] , 103) AS [_etblGLSegment_dModifiedDate]
			, CONVERT(INT, [INI_SRC].[_etblGLSegment_iCreatedBranchID] , 1) AS [_etblGLSegment_iCreatedBranchID]
			, CONVERT(INT, [INI_SRC].[_etblGLSegment_iModifiedBranchID] , 1) AS [_etblGLSegment_iModifiedBranchID]
			, CONVERT(INT, [INI_SRC].[_etblGLSegment_iCreatedAgentID] , 1) AS [_etblGLSegment_iCreatedAgentID]
			, CONVERT(INT, [INI_SRC].[_etblGLSegment_iModifiedAgentID] , 1) AS [_etblGLSegment_iModifiedAgentID]
			, CONVERT(INT, [INI_SRC].[_etblGLSegment_iChangeSetID] , 1) AS [_etblGLSegment_iChangeSetID]
			, CAST([INI_SRC].[_etblGLSegment_Checksum]  AS BINARY) AS [_etblGLSegment_Checksum]
			, CONVERT(INT, [INI_SRC].[imSCOAAccountID] , 1) AS [imSCOAAccountID]
			, [INI_SRC].[mSCOAId]  AS [mSCOAId]
		FROM [CSG_1_FOODS].[_etblGLSegment] [INI_SRC]
		INNER JOIN [dc].[EXECEPTION] [MEX_INR_SRC] ON  [MEX_INR_SRC].[DATATYPE] = '#'
		UNION 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, [MEX_EXT_SRC].[DATATYPE] AS [DATATYPE]
			, CONVERT(int, [MEX_EXT_SRC].[LOAD_CYCLE_ID] ) AS [LOAD_CYCLE_ID]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [idSegment]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [iSegmentNo]
			, [MEX_EXT_SRC].[KEY_ATTRIBUTE_VARCHAR]  AS [cCode]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [cDescription]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iSegmentBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblGLSegment_iBranchID]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [_etblGLSegment_dCreatedDate]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [_etblGLSegment_dModifiedDate]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblGLSegment_iCreatedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblGLSegment_iModifiedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblGLSegment_iCreatedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblGLSegment_iModifiedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblGLSegment_iChangeSetID]
			, CAST([MEX_EXT_SRC].[ATTRIBUTE_BINARY]  AS BINARY) AS [_etblGLSegment_Checksum]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [imSCOAAccountID]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [mSCOAId]
		FROM [dc].[EXECEPTION] [MEX_EXT_SRC]
	)
	INSERT INTO [CSG_1_FOODS_ext].[_etblGLSegment](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idSegment]
		,[BK_iSegmentNo]
		,[BK_cCode]
		,[BK_idSegment]
		,[iSegmentNo]
		,[cCode]
		,[cDescription]
		,[iSegmentBranchID]
		,[_etblGLSegment_iBranchID]
		,[_etblGLSegment_dCreatedDate]
		,[_etblGLSegment_dModifiedDate]
		,[_etblGLSegment_iCreatedBranchID]
		,[_etblGLSegment_iModifiedBranchID]
		,[_etblGLSegment_iCreatedAgentID]
		,[_etblGLSegment_iModifiedAgentID]
		,[_etblGLSegment_iChangeSetID]
		,[_etblGLSegment_Checksum]
		,[imSCOAAccountID]
		,[mSCOAId]
	)
	SELECT
		  COALESCE([PREP_EXCEP].[LOAD_CYCLE_ID],[LCI_SRC].[LOAD_CYCLE_ID]) AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [PREP_EXCEP].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [PREP_EXCEP].[DATATYPE] AS [DATATYPE]
		, [PREP_EXCEP].[idSegment] AS [idSegment]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[iSegmentNo] , 1)),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_iSegmentNo]
		, COALESCE(UPPER(REPLACE([PREP_EXCEP].[cCode],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_cCode]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[idSegment] , 1)),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_idSegment]
		, [PREP_EXCEP].[iSegmentNo] AS [iSegmentNo]
		, [PREP_EXCEP].[cCode] AS [cCode]
		, [PREP_EXCEP].[cDescription] AS [cDescription]
		, [PREP_EXCEP].[iSegmentBranchID] AS [iSegmentBranchID]
		, [PREP_EXCEP].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
		, [PREP_EXCEP].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
		, [PREP_EXCEP].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
		, [PREP_EXCEP].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
		, [PREP_EXCEP].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
		, [PREP_EXCEP].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
		, [PREP_EXCEP].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
		, [PREP_EXCEP].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
		, [PREP_EXCEP].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
		, [PREP_EXCEP].[imSCOAAccountID] AS [imSCOAAccountID]
		, [PREP_EXCEP].[mSCOAId] AS [mSCOAId]
	FROM [PREP_EXCEP]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
