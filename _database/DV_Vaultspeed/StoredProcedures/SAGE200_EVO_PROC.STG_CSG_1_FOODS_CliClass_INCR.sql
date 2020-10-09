SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_CliClass_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[CliClass];

	INSERT INTO [CSG_1_FOODS_stage].[CliClass](
		 [HK_ClientClass]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[IdCliClass]
		,[BK_ClientClass]
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
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_Code] + '|' +
			[EXT_SRC].[BK_IdCliClass] + '|'),2)) AS [HK_ClientClass]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[IdCliClass] AS [IdCliClass]
		, [EXT_SRC].[BK_Code] + '|' +  [EXT_SRC].[BK_IdCliClass] AS [BK_ClientClass]
		, [EXT_SRC].[Code] AS [Code]
		, [EXT_SRC].[Description] AS [Description]
		, [EXT_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
		, [EXT_SRC].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [EXT_SRC].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [EXT_SRC].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [EXT_SRC].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [EXT_SRC].[iTaxControlAccID] AS [iTaxControlAccID]
		, [EXT_SRC].[iRevProfitAcc] AS [iRevProfitAcc]
		, [EXT_SRC].[iRevLossAcc] AS [iRevLossAcc]
		, [EXT_SRC].[iProvForRevAcc] AS [iProvForRevAcc]
		, [EXT_SRC].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [EXT_SRC].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [EXT_SRC].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [EXT_SRC].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [EXT_SRC].[CliClass_iBranchID] AS [CliClass_iBranchID]
		, [EXT_SRC].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
		, [EXT_SRC].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
		, [EXT_SRC].[CliClass_iCreatedBranchID] AS [CliClass_iCreatedBranchID]
		, [EXT_SRC].[CliClass_iModifiedBranchID] AS [CliClass_iModifiedBranchID]
		, [EXT_SRC].[CliClass_iCreatedAgentID] AS [CliClass_iCreatedAgentID]
		, [EXT_SRC].[CliClass_iModifiedAgentID] AS [CliClass_iModifiedAgentID]
		, [EXT_SRC].[CliClass_iChangeSetID] AS [CliClass_iChangeSetID]
		, [EXT_SRC].[CliClass_Checksum] AS [CliClass_Checksum]
	FROM [CSG_1_FOODS_ext].[CliClass] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	;
END;


END;

 
 


GO
