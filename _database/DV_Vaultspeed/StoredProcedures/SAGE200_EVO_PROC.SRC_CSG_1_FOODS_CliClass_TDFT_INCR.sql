SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].[SRC_CSG_1_FOODS_CliClass_TDFT_INCR] AS 
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

	TRUNCATE TABLE [dv_CSG_1_FOODS].[CliClass];

	WITH [DELTA_VIEW] AS 
	( 
		SELECT 
			  CAST('SRC'  AS VARCHAR) AS [DATATYPE]
			, [CDC_SRC].[IdCliClass] AS [IdCliClass]
			, [CDC_SRC].[Code] AS [Code]
			, [CDC_SRC].[Description] AS [Description]
			, [CDC_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
			, [CDC_SRC].[dGroupTimeStamp] AS [dGroupTimeStamp]
			, [CDC_SRC].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
			, [CDC_SRC].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
			, [CDC_SRC].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
			, [CDC_SRC].[iTaxControlAccID] AS [iTaxControlAccID]
			, [CDC_SRC].[iRevProfitAcc] AS [iRevProfitAcc]
			, [CDC_SRC].[iRevLossAcc] AS [iRevLossAcc]
			, [CDC_SRC].[iProvForRevAcc] AS [iProvForRevAcc]
			, [CDC_SRC].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
			, [CDC_SRC].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
			, [CDC_SRC].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
			, [CDC_SRC].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
			, [CDC_SRC].[CliClass_iBranchID] AS [CliClass_iBranchID]
			, [CDC_SRC].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
			, [CDC_SRC].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
			, [CDC_SRC].[CliClass_iCreatedBranchID] AS [CliClass_iCreatedBranchID]
			, [CDC_SRC].[CliClass_iModifiedBranchID] AS [CliClass_iModifiedBranchID]
			, [CDC_SRC].[CliClass_iCreatedAgentID] AS [CliClass_iCreatedAgentID]
			, [CDC_SRC].[CliClass_iModifiedAgentID] AS [CliClass_iModifiedAgentID]
			, [CDC_SRC].[CliClass_iChangeSetID] AS [CliClass_iChangeSetID]
			, [CDC_SRC].[CliClass_Checksum] AS [CliClass_Checksum]
		FROM [CSG_1_FOODS].[CliClass] [CDC_SRC]
	)
	, [PREPJOINBK] AS 
	( 
		SELECT
			  [DELTA_VIEW].[DATATYPE] AS [DATATYPE]
			, COALESCE(REPLACE([DELTA_VIEW].[IdCliClass],',',''),[MEX_BK_SRC].[KEY_ATTRIBUTE_INT]) AS [IdCliClass]
			, [DELTA_VIEW].[Code] AS [Code]
			, [DELTA_VIEW].[Description] AS [Description]
			, REPLACE([DELTA_VIEW].[DiscMtrxRow],',','') AS [DiscMtrxRow]
			, [DELTA_VIEW].[dGroupTimeStamp] AS [dGroupTimeStamp]
			, REPLACE([DELTA_VIEW].[iAccountsIDControlAcc],',','') AS [iAccountsIDControlAcc]
			, REPLACE([DELTA_VIEW].[iAccountsIDProfitAcc],',','') AS [iAccountsIDProfitAcc]
			, REPLACE([DELTA_VIEW].[iAccountsIDLossAcc],',','') AS [iAccountsIDLossAcc]
			, REPLACE([DELTA_VIEW].[iTaxControlAccID],',','') AS [iTaxControlAccID]
			, REPLACE([DELTA_VIEW].[iRevProfitAcc],',','') AS [iRevProfitAcc]
			, REPLACE([DELTA_VIEW].[iRevLossAcc],',','') AS [iRevLossAcc]
			, REPLACE([DELTA_VIEW].[iProvForRevAcc],',','') AS [iProvForRevAcc]
			, REPLACE([DELTA_VIEW].[iInvoiceDocProfileID],',','') AS [iInvoiceDocProfileID]
			, REPLACE([DELTA_VIEW].[iSOInvoiceDocProfileID],',','') AS [iSOInvoiceDocProfileID]
			, REPLACE([DELTA_VIEW].[iCreditNoteDocProfileID],',','') AS [iCreditNoteDocProfileID]
			, REPLACE([DELTA_VIEW].[iJCInvoiceDocProfileID],',','') AS [iJCInvoiceDocProfileID]
			, REPLACE([DELTA_VIEW].[CliClass_iBranchID],',','') AS [CliClass_iBranchID]
			, [DELTA_VIEW].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
			, [DELTA_VIEW].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
			, REPLACE([DELTA_VIEW].[CliClass_iCreatedBranchID],',','') AS [CliClass_iCreatedBranchID]
			, REPLACE([DELTA_VIEW].[CliClass_iModifiedBranchID],',','') AS [CliClass_iModifiedBranchID]
			, REPLACE([DELTA_VIEW].[CliClass_iCreatedAgentID],',','') AS [CliClass_iCreatedAgentID]
			, REPLACE([DELTA_VIEW].[CliClass_iModifiedAgentID],',','') AS [CliClass_iModifiedAgentID]
			, REPLACE([DELTA_VIEW].[CliClass_iChangeSetID],',','') AS [CliClass_iChangeSetID]
			, [DELTA_VIEW].[CliClass_Checksum] AS [CliClass_Checksum]
		FROM [DELTA_VIEW]
		INNER JOIN [dc].[EXECEPTION] [MEX_BK_SRC] ON  1 = 1
		WHERE  [MEX_BK_SRC].[DATATYPE] = '#'
	)
	INSERT INTO [dv_CSG_1_FOODS].[CliClass](
		 [DATATYPE]
		,[IdCliClass]
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
		,[CliClass_iBranchID]
		,[CliClass_dCreatedDate]
		,[CliClass_dModifiedDate]
		,[CliClass_iCreatedBranchID]
		,[CliClass_iModifiedBranchID]
		,[CliClass_iCreatedAgentID]
		,[CliClass_iModifiedAgentID]
		,[CliClass_iChangeSetID]
		,[CliClass_Checksum]
	)
	SELECT
		  [PREPJOINBK].[DATATYPE] AS [DATATYPE]
		, [PREPJOINBK].[IdCliClass] AS [IdCliClass]
		, [PREPJOINBK].[Code] AS [Code]
		, [PREPJOINBK].[Description] AS [Description]
		, [PREPJOINBK].[DiscMtrxRow] AS [DiscMtrxRow]
		, [PREPJOINBK].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [PREPJOINBK].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [PREPJOINBK].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [PREPJOINBK].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [PREPJOINBK].[iTaxControlAccID] AS [iTaxControlAccID]
		, [PREPJOINBK].[iRevProfitAcc] AS [iRevProfitAcc]
		, [PREPJOINBK].[iRevLossAcc] AS [iRevLossAcc]
		, [PREPJOINBK].[iProvForRevAcc] AS [iProvForRevAcc]
		, [PREPJOINBK].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [PREPJOINBK].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [PREPJOINBK].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [PREPJOINBK].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [PREPJOINBK].[CliClass_iBranchID] AS [CliClass_iBranchID]
		, [PREPJOINBK].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
		, [PREPJOINBK].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
		, [PREPJOINBK].[CliClass_iCreatedBranchID] AS [CliClass_iCreatedBranchID]
		, [PREPJOINBK].[CliClass_iModifiedBranchID] AS [CliClass_iModifiedBranchID]
		, [PREPJOINBK].[CliClass_iCreatedAgentID] AS [CliClass_iCreatedAgentID]
		, [PREPJOINBK].[CliClass_iModifiedAgentID] AS [CliClass_iModifiedAgentID]
		, [PREPJOINBK].[CliClass_iChangeSetID] AS [CliClass_iChangeSetID]
		, [PREPJOINBK].[CliClass_Checksum] AS [CliClass_Checksum]
	FROM [PREPJOINBK]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [raw].[SAT_CSG_1_FOODS_ClientClass] [SAT_SRC1] ON  CONVERT(INT, [PREPJOINBK].[IdCliClass] , 1) = [SAT_SRC1].[IdCliClass] AND [SAT_SRC1].[LOAD_CYCLE_ID] =
		[LCI_SRC].[LOAD_CYCLE_ID]
	WHERE  [SAT_SRC1].[HK_ClientClass] IS NULL
	;
END;


END;

 
 


GO
