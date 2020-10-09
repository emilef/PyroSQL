SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_VenClass_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[VenClass];

	INSERT INTO [CSG_1_FOODS_ext].[VenClass](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idVenClass]
		,[BK_Code]
		,[BK_idVenClass]
		,[Code]
		,[Description]
		,[DiscMtrxRow]
		,[dGroupTimeStamp]
		,[iAccountsIDControlAcc]
		,[iAccountsIDProfitAcc]
		,[iAccountsIDLossAcc]
		,[iTaxControlAccID]
		,[iRevProfitAcc]
		,[iRevLossAcc]
		,[iProvForRevAcc]
		,[iInvoiceDocProfileID]
		,[iSOInvoiceDocProfileID]
		,[iCreditNoteDocProfileID]
		,[iJCInvoiceDocProfileID]
		,[VenClass_iBranchID]
		,[VenClass_dCreatedDate]
		,[VenClass_dModifiedDate]
		,[VenClass_iCreatedBranchID]
		,[VenClass_iModifiedBranchID]
		,[VenClass_iCreatedAgentID]
		,[VenClass_iModifiedAgentID]
		,[VenClass_iChangeSetID]
		,[VenClass_Checksum]
	)
	SELECT 
		  [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, dateadd(MICROSECOND, 2*row_number() over (order by [LCI_SRC].[LOADDT]), SYSDATETIME()) AS [LOADDT]
		, [MEX_SRC].[ATTRIBUTE_VARCHAR] AS [CHANGE_TYPE]
		, [TDFV_SRC].[DATATYPE] AS [DATATYPE]
		, CONVERT(INT, [TDFV_SRC].[idVenClass] , 1) AS [idVenClass]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[Code],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_Code]
		, COALESCE(UPPER([TDFV_SRC].[idVenClass]),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_idVenClass]
		, [TDFV_SRC].[Code]  AS [Code]
		, [TDFV_SRC].[Description]  AS [Description]
		, CONVERT(INT, [TDFV_SRC].[DiscMtrxRow] , 1) AS [DiscMtrxRow]
		, CONVERT(DATETIME2, [TDFV_SRC].[dGroupTimeStamp] , 103) AS [dGroupTimeStamp]
		, CONVERT(INT, [TDFV_SRC].[iAccountsIDControlAcc] , 1) AS [iAccountsIDControlAcc]
		, CONVERT(INT, [TDFV_SRC].[iAccountsIDProfitAcc] , 1) AS [iAccountsIDProfitAcc]
		, CONVERT(INT, [TDFV_SRC].[iAccountsIDLossAcc] , 1) AS [iAccountsIDLossAcc]
		, CONVERT(INT, [TDFV_SRC].[iTaxControlAccID] , 1) AS [iTaxControlAccID]
		, CONVERT(INT, [TDFV_SRC].[iRevProfitAcc] , 1) AS [iRevProfitAcc]
		, CONVERT(INT, [TDFV_SRC].[iRevLossAcc] , 1) AS [iRevLossAcc]
		, CONVERT(INT, [TDFV_SRC].[iProvForRevAcc] , 1) AS [iProvForRevAcc]
		, CONVERT(INT, [TDFV_SRC].[iInvoiceDocProfileID] , 1) AS [iInvoiceDocProfileID]
		, CONVERT(INT, [TDFV_SRC].[iSOInvoiceDocProfileID] , 1) AS [iSOInvoiceDocProfileID]
		, CONVERT(INT, [TDFV_SRC].[iCreditNoteDocProfileID] , 1) AS [iCreditNoteDocProfileID]
		, CONVERT(INT, [TDFV_SRC].[iJCInvoiceDocProfileID] , 1) AS [iJCInvoiceDocProfileID]
		, CONVERT(INT, [TDFV_SRC].[VenClass_iBranchID] , 1) AS [VenClass_iBranchID]
		, CONVERT(DATETIME2, [TDFV_SRC].[VenClass_dCreatedDate] , 103) AS [VenClass_dCreatedDate]
		, CONVERT(DATETIME2, [TDFV_SRC].[VenClass_dModifiedDate] , 103) AS [VenClass_dModifiedDate]
		, CONVERT(INT, [TDFV_SRC].[VenClass_iCreatedBranchID] , 1) AS [VenClass_iCreatedBranchID]
		, CONVERT(INT, [TDFV_SRC].[VenClass_iModifiedBranchID] , 1) AS [VenClass_iModifiedBranchID]
		, CONVERT(INT, [TDFV_SRC].[VenClass_iCreatedAgentID] , 1) AS [VenClass_iCreatedAgentID]
		, CONVERT(INT, [TDFV_SRC].[VenClass_iModifiedAgentID] , 1) AS [VenClass_iModifiedAgentID]
		, CONVERT(INT, [TDFV_SRC].[VenClass_iChangeSetID] , 1) AS [VenClass_iChangeSetID]
		, CAST([TDFV_SRC].[VenClass_Checksum]  AS BINARY) AS [VenClass_Checksum]
	FROM [dv_CSG_1_FOODS].[VW_VenClass] [TDFV_SRC]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
