SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE   VIEW [dbo].[AROBL_AROBP_LINK_WITHTXCODE] 
AS
-- double minus
SELECT 
	[OBL].[IDCUST]
,	[OBL].[IDINVC]
,	[OBL].[TRXTYPEID]											AS [TRXTYPEID_OBL]
,	[OBL].[TRXTYPETXT]											AS [TRXTYPETXT_OBL]
,	[OBL].[DATEINVC]											AS [DATEINVC_OBL]
,	[OBL].[DATEBUS]												AS [DATEBUS_OBL]
,	[OBL].[DATEBTCH]											AS [DATEBTCH_OBL]
,	[OBP].[TRXTYPE]												AS [TRXTYPE_OBP]
,	[OBP].[TRANSTYPE]											AS [TRANSTYPE_OBP]
,	[OBP].[AUDTDATE]											AS [DATEBUS_OBP]
,	[OBP].[DATEBTCH]											AS [DATEBTCH_OBP]
,	[OBP].[IDINVC]												AS [IDINVC_OBP]
,	[OBP].[IDMEMOXREF]											AS [IDMEMOXREF_OBP]
,	[OBL].[AMTINVCHC]											AS [AMTINVCHC_OBL]
,	[OBL].[AMTINVCTC]											AS [AMTINVCTC_OBL]
,	ISNULL([OBP].[AMTPAYMHC],0)									AS [AMTPAYMHC_OBP]
,	ISNULL([OBP].[AMTPAYMTC],0)									AS [AMTPAYMTC_OBP]
,	ISNULL([OBL].[AMTINVCHC],0) - ISNULL([OBP].[AMTPAYMHC],0)	AS [AMTDUEHC_EF]
,	ISNULL([OBL].[AMTINVCTC],0) - ISNULL([OBP].[AMTPAYMTC],0)	AS [AMTDUETC_EF]
FROM 
	 [ODS_ATSDAT].[dbo].[AROBL] AS [OBL]
LEFT JOIN
	[ODS_ATSDAT].[dbo].[AROBP] AS [OBP]
	ON [OBL].[IDINVC] = [OBP].[IDMEMOXREF]
WHERE 
	[OBL].[IDCUST] = 'KEV100'
	AND [OBL].[IDINVC] IN ( 'INV201909615' , 'INV202001261',
	'INV202001020')


	

GO
