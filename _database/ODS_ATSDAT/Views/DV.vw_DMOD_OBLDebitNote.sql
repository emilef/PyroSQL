SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON






/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [DV].[vw_DMOD_OBLDebitNote]
AS


SELECT StandardAlias1.[IDCUST]
      ,StandardAlias1.[IDINVC]
      ,StandardAlias1.[AUDTDATE] AS OBL_AUDTDATE
      ,StandardAlias1.[AUDTTIME] AS OBL_AUDTTIME
      ,StandardAlias1.[AUDTUSER] AS OBL_AUDTUSER
      ,StandardAlias1.[AUDTORG]
      ,StandardAlias1.[IDORDERNBR]
      ,StandardAlias1.[IDCUSTPO]
      ,StandardAlias1.[DATEDUE]
      ,StandardAlias1.[IDNATACCT]
      ,StandardAlias1.[TRXTYPEID]
      ,StandardAlias1.[TRXTYPETXT]
      ,StandardAlias1.[DATEBTCH]
      ,StandardAlias1.[CNTBTCH]
      ,StandardAlias1.[CNTITEM]
      ,StandardAlias1.[IDGRP]
      ,StandardAlias1.[DESCINVC]
      ,StandardAlias1.[DATEINVC]
      ,StandardAlias1.[DATEASOF]
      ,StandardAlias1.[CODETERM]
      ,StandardAlias1.[CODECURN]
      ,StandardAlias1.[IDRATETYPE]
      ,StandardAlias1.[EXCHRATEHC]
      ,StandardAlias1.[AMTINVCHC]
      ,StandardAlias1.[AMTDUEHC]
      ,StandardAlias1.[AMTTXBLHC]
      ,StandardAlias1.[AMTTAXHC]
      ,StandardAlias1.[AMTINVCTC]
      ,StandardAlias1.[AMTDUETC]
      ,StandardAlias1.[AMTTXBLTC]
      ,StandardAlias1.[AMTTAXTC]
      ,StandardAlias1.[AMTDISCTC]
      ,StandardAlias1.[CODETAX1]
      ,StandardAlias1.[AMTBASE1HC]
      ,StandardAlias1.[AMTTAX1HC]
      ,StandardAlias1.[AMTBASE1TC]
      ,StandardAlias1.[AMTTAX1TC]
      ,StandardAlias1.[FISCYR]
      ,StandardAlias1.[FISCPER]
      ,StandardAlias1.[DATEBUS]
      ,StandardAlias1.[RATEDATE]
      ,StandardAlias1.[RATEOP]
      ,StandardAlias1.[POSTSEQNCE]
      ,StandardAlias1.[INVCTYPE]
      ,StandardAlias1.[TYPEBTCH]
      ,StandardAlias1.[CNTOBLJ]
      ,StandardAlias1.[CODECURNRC]
      ,StandardAlias1.[RATERC]
      ,StandardAlias1.[CODETAXGRP]
      ,StandardAlias1.[TAXVERSION]
      ,StandardAlias1.[TAXCLASS1]
      ,StandardAlias1.[ORATE]
      ,StandardAlias1.[ORATETYPE]
      ,StandardAlias1.[ORATEDATE]
      ,StandardAlias1.[ORATEOP]
     
FROM 
	[ODS_ATSDAT].[dbo].[AROBL] StandardAlias1
WHERE 
	StandardAlias1.TRXTYPETXT = 2
	AND [StandardAlias1].[IDCUST] = 'KEV100'

GO
