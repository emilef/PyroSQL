SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE   VIEW [DV].[vw_DMOD_UnappliedCashReversedFromPayment]
AS 
  SELECT obp.IDINVC, obp.CNTBTCH, obp.CNTITEM, obp.IDMEMOXREF, trx.*, tt.*
  FROM [ODS_ATSDAT].[dbo].[AROBP] AS obp
  left join [ODS_ATSDAT].CUST.TRXTYPE as trx
  on trx.TRXTYPEID = obp.TRXTYPE
  left join [ODS_ATSDAT].CUST.TRXTYPETEXT AS tt
  ON tt.TRXTYPETEXTID = obp.TRANSTYPE
  WHERE tt.TRXTYPETEXTID  = 11
  AND trx.TRXTYPEID = 4
  AND SUBSTRING(obp.IDINVC,1,2) IN ('PY')

GO
