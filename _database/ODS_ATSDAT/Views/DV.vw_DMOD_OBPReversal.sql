SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
Create view DV.vw_dmod_OBPReversal
as
(
SELECT [IDCUST]
      ,[IDINVC]
      ,[CNTPAYMNBR]
      ,[IDRMIT]
      ,[DATEBUS]
      ,[TRANSTYPE]
      ,[CNTSEQNCE]
      ,[AUDTDATE]
      ,[AUDTTIME]
      ,[AUDTUSER]
      ,[AUDTORG]
      ,[DEPSTNBR]
      ,[CNTBTCH]
      ,[DATEBTCH]
      ,[AMTPAYMHC]
      ,[AMTPAYMTC]
      ,[CODECURN]
      ,[IDRATETYPE]
      ,[RATEEXCHHC]
      ,[SWOVRDRATE]
      ,[IDBANK]
      ,[TRXTYPE]
      ,[IDMEMOXREF]
      ,[SWINVCDEL]
      ,[DATELSTSTM]
      ,[IDPREPAID]
      ,[IDCUSTRMIT]
      ,[DATERMIT]
      ,[CNTITEM]
      ,[FISCYR]
      ,[FISCPER]
      ,[RATEDATE]
      ,[RATEOP]
      ,[STMTSEQ]
      ,[PYMCUID]
      ,[DEPSEQ]
      ,[DEPLINE]
  FROM [ODS_ATSDAT].[dbo].[AROBP]
  WHERE TRXTYPE = 4 --unnaplied
  OR TRXTYPE = 53 --Receipt
  OR TRXTYPE = 59 --PrePay
  )
GO
