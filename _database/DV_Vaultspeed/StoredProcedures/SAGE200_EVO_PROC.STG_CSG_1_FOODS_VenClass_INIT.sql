SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_VenClass_INIT AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[VenClass];

	INSERT INTO [CSG_1_FOODS_stage].[VenClass](
		 [HK_VendorClass]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idVenClass]
		,[BK_VendorClass]
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
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_Code] + '|' +
			[EXT_SRC].[BK_idVenClass] + '|'),2)) AS [HK_VendorClass]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[idVenClass] AS [idVenClass]
		, [EXT_SRC].[BK_Code] + '|' +  [EXT_SRC].[BK_idVenClass] AS [BK_VendorClass]
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
		, [EXT_SRC].[VenClass_iBranchID] AS [VenClass_iBranchID]
		, [EXT_SRC].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
		, [EXT_SRC].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
		, [EXT_SRC].[VenClass_iCreatedBranchID] AS [VenClass_iCreatedBranchID]
		, [EXT_SRC].[VenClass_iModifiedBranchID] AS [VenClass_iModifiedBranchID]
		, [EXT_SRC].[VenClass_iCreatedAgentID] AS [VenClass_iCreatedAgentID]
		, [EXT_SRC].[VenClass_iModifiedAgentID] AS [VenClass_iModifiedAgentID]
		, [EXT_SRC].[VenClass_iChangeSetID] AS [VenClass_iChangeSetID]
		, [EXT_SRC].[VenClass_Checksum] AS [VenClass_Checksum]
	FROM [CSG_1_FOODS_ext].[VenClass] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	;
END;


END;

 
 


GO
