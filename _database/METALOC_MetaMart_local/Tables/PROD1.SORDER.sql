SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [PROD1].[SORDER](
	[UPDTICK_0] [int] NULL,
	[SOHNUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CPY_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SOHTYP_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SOHCAT_0] [tinyint] NULL,
	[SALFCY_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCORD_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCINV_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCPYR_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPAPYR_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCGRU_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPAADD_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CUSORDREF_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PJT_0] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORDDAT_0] [datetime] NULL,
	[VLYDATCON_0] [datetime] NULL,
	[SHIDAT_0] [datetime] NULL,
	[DEMDLVDAT_0] [datetime] NULL,
	[LNDRTNDAT_0] [datetime] NULL,
	[DAYLTI_0] [smallint] NULL,
	[BPCNAM_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCNAM_1] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPAORD_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCADDLIG_0] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCADDLIG_1] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCADDLIG_2] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCPOSCOD_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCCTY_0] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCSAT_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCCRY_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPCCRYNAM_0] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CNTNAM_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPINAM_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPINAM_1] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPAINV_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPIADDLIG_0] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPIADDLIG_1] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPIADDLIG_2] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPIPOSCOD_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPICTY_0] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPISAT_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPICRY_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPICRYNAM_0] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPIEECNUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CNINAM_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDNAM_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDNAM_1] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDADDLIG_0] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDADDLIG_1] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDADDLIG_2] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDPOSCOD_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDCTY_0] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDSAT_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDCRY_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPDCRYNAM_0] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CNDNAM_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REP_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REP_1] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CUR_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CHGTYP_0] [tinyint] NULL,
	[CHGRAT_0] [numeric](18, 7) NULL,
	[DIE_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_1] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_2] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_3] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_4] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_5] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_6] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_7] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_8] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_9] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_10] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_11] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_12] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_13] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_14] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_15] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_16] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_17] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_18] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DIE_19] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_1] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_2] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_3] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_4] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_5] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_6] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_7] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_8] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_9] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_10] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_11] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_12] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_13] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_14] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_15] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_16] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_17] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_18] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCE_19] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LAN_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VACBPR_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SSTENTCOD_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PTE_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TSCCOD_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TSCCOD_1] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TSCCOD_2] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TSCCOD_3] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TSCCOD_4] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DEP_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BPTNUM_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MDL_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STOFCY_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DRN_0] [tinyint] NULL,
	[DLVPIO_0] [tinyint] NULL,
	[ORDCLE_0] [tinyint] NULL,
	[ODL_0] [tinyint] NULL,
	[DME_0] [tinyint] NULL,
	[IME_0] [tinyint] NULL,
	[OCNFLG_0] [tinyint] NULL,
	[OCNPRN_0] [tinyint] NULL,
	[COPNBR_0] [smallint] NULL,
	[SOHTEX1_0] [nvarchar](24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SOHTEX2_0] [nvarchar](24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SQHNUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BETFCY_0] [tinyint] NULL,
	[BETCPY_0] [tinyint] NULL,
	[ORIFCY_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PRFNUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASDLVNUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASDLVDAT_0] [datetime] NULL,
	[LASINVNUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LASINVDAT_0] [datetime] NULL,
	[INVDTAAMT_0] [numeric](20, 5) NULL,
	[INVDTAAMT_1] [numeric](20, 5) NULL,
	[INVDTAAMT_2] [numeric](20, 5) NULL,
	[INVDTAAMT_3] [numeric](20, 5) NULL,
	[INVDTAAMT_4] [numeric](20, 5) NULL,
	[INVDTAAMT_5] [numeric](20, 5) NULL,
	[INVDTAAMT_6] [numeric](20, 5) NULL,
	[INVDTAAMT_7] [numeric](20, 5) NULL,
	[INVDTAAMT_8] [numeric](20, 5) NULL,
	[INVDTAAMT_9] [numeric](20, 5) NULL,
	[INVDTATYP_0] [tinyint] NULL,
	[INVDTATYP_1] [tinyint] NULL,
	[INVDTATYP_2] [tinyint] NULL,
	[INVDTATYP_3] [tinyint] NULL,
	[INVDTATYP_4] [tinyint] NULL,
	[INVDTATYP_5] [tinyint] NULL,
	[INVDTATYP_6] [tinyint] NULL,
	[INVDTATYP_7] [tinyint] NULL,
	[INVDTATYP_8] [tinyint] NULL,
	[INVDTATYP_9] [tinyint] NULL,
	[INVDTADSP_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_1] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_2] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_3] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_4] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_5] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_6] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_7] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_8] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTADSP_9] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVDTA_0] [smallint] NULL,
	[INVDTA_1] [smallint] NULL,
	[INVDTA_2] [smallint] NULL,
	[INVDTA_3] [smallint] NULL,
	[INVDTA_4] [smallint] NULL,
	[INVDTA_5] [smallint] NULL,
	[INVDTA_6] [smallint] NULL,
	[INVDTA_7] [smallint] NULL,
	[INVDTA_8] [smallint] NULL,
	[INVDTA_9] [smallint] NULL,
	[SFISSTCOD_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_1] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_2] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_3] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_4] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_5] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_6] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_7] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_8] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFISSTCOD_9] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PRITYP_0] [tinyint] NULL,
	[ORDNOT_0] [numeric](27, 13) NULL,
	[ORDATI_0] [numeric](27, 13) NULL,
	[ORDNOTL_0] [numeric](27, 13) NULL,
	[ORDATIL_0] [numeric](27, 13) NULL,
	[ORDINVNOT_0] [numeric](27, 13) NULL,
	[ORDINVATI_0] [numeric](27, 13) NULL,
	[ORDINVNOTL_0] [numeric](27, 13) NULL,
	[ORDINVATIL_0] [numeric](27, 13) NULL,
	[DLRNOT_0] [numeric](27, 13) NULL,
	[DLRATI_0] [numeric](27, 13) NULL,
	[PFMTOT_0] [numeric](27, 13) NULL,
	[DISCRGTYP_0] [tinyint] NULL,
	[DISCRGTYP_1] [tinyint] NULL,
	[DISCRGTYP_2] [tinyint] NULL,
	[DISCRGTYP_3] [tinyint] NULL,
	[DISCRGTYP_4] [tinyint] NULL,
	[DISCRGTYP_5] [tinyint] NULL,
	[DISCRGTYP_6] [tinyint] NULL,
	[DISCRGTYP_7] [tinyint] NULL,
	[DISCRGTYP_8] [tinyint] NULL,
	[INVDTALIN_0] [smallint] NULL,
	[INVDTALIN_1] [smallint] NULL,
	[INVDTALIN_2] [smallint] NULL,
	[INVDTALIN_3] [smallint] NULL,
	[INVDTALIN_4] [smallint] NULL,
	[INVDTALIN_5] [smallint] NULL,
	[INVDTALIN_6] [smallint] NULL,
	[INVDTALIN_7] [smallint] NULL,
	[INVDTALIN_8] [smallint] NULL,
	[ALLTYP_0] [tinyint] NULL,
	[UNL_0] [tinyint] NULL,
	[LINNBR_0] [smallint] NULL,
	[CLELINNBR_0] [smallint] NULL,
	[ALLLINNBR_0] [smallint] NULL,
	[DLVLINNBR_0] [smallint] NULL,
	[INVLINNBR_0] [smallint] NULL,
	[ORDSTA_0] [tinyint] NULL,
	[ALLSTA_0] [tinyint] NULL,
	[DLVSTA_0] [tinyint] NULL,
	[INVSTA_0] [tinyint] NULL,
	[CDTSTA_0] [tinyint] NULL,
	[APPFLG_0] [tinyint] NULL,
	[REVNUM_0] [smallint] NULL,
	[SHIADECOD_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EECICT_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EECLOC_0] [tinyint] NULL,
	[ICTCTY_0] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FFWNUM_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FFWADD_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GEOCOD_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INSCTYFLG_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VTT_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMTTAX_0] [numeric](28, 8) NULL,
	[BASTAX_0] [numeric](28, 8) NULL,
	[CCLREN_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCLDAT_0] [datetime] NULL,
	[SRENUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CMGNUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OPGNUM_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OPGTYP_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PLISTC_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXPNUM_0] [int] NULL,
	[SINUM_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DSPTOTQTY_0] [numeric](22, 7) NULL,
	[DSPTOTWEI_0] [numeric](28, 13) NULL,
	[DSPTOTVOL_0] [numeric](28, 13) NULL,
	[DSPWEU_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DSPVOU_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SDHTYP_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CREUSR_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CREDAT_0] [datetime] NULL,
	[UPDUSR_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UPDDAT_0] [datetime] NULL,
	[ZREQDESC_0] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HLDSTA_0] [tinyint] NULL,
	[HLDCOD_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HLDUSR_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZCREUSR_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HLDDAT_0] [datetime] NULL,
	[HLDTIM_0] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HLDCODP_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XCONTRACT_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HLDUSRP_0] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HLDDATP_0] [datetime] NULL,
	[HLDTIMP_0] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XCONTAINER_0] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CDTSTAP_0] [tinyint] NULL,
	[ADRVAL_0] [smallint] NULL,
	[DEMDLVHOU_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XSEAL_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CREDATTIM_0] [datetime] NULL,
	[UPDDATTIM_0] [datetime] NULL,
	[AUUID_0] [binary](16) NULL,
	[XVESSEL_0] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVCND_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VCRINVCNDDAT_0] [datetime] NULL,
	[INRNOT_0] [numeric](27, 13) NULL,
	[XDEPDATE_0] [datetime] NULL,
	[INRATI_0] [numeric](27, 13) NULL,
	[INRSCHNOT_0] [numeric](27, 13) NULL,
	[INRSCHATI_0] [numeric](27, 13) NULL,
	[XARDATE_0] [datetime] NULL,
	[XBLDATE_0] [datetime] NULL,
	[XBOL_0] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XRAIL_0] [datetime] NULL,
	[XVOYAGE_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XBOOKING_0] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XCNTDATE_0] [datetime] NULL,
	[XH20_0] [numeric](7, 3) NULL,
	[XCR2O3_0] [numeric](7, 3) NULL,
	[XCERT_0] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XDISCPORT_0] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XAGENT_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XLINE_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XAGENTNAM_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XLINENAME_0] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZREQUSR_0] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XINCO_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XSHPREQDATE_0] [datetime] NULL,
	[XORDTONS_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XSTACKDATE_0] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XSERVICEPROV_0] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XCOMMODITY_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XUCRREF_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XARXOINV_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XSAMPCERTNO_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XCIQ_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XROADTRANS_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XGMAECMUTI_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XBRJTRJIFC_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XTRAFHEAD_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XCUSTOMSVAL_0] [numeric](14, 3) NULL,
	[XROE_0] [numeric](28, 10) NULL,
	[XCUSTOMERNAM_0] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XSTG1INV_0] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XSTG2INV_0] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XSTG3INV_0] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XCARGO_0] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XMARKUP_0] [numeric](14, 3) NULL,
	[XCONTRACTTON_0] [numeric](28, 13) NULL,
	[ZXDAMANFLG_0] [tinyint] NULL,
	[XBLRDT_0] [datetime] NULL,
	[XINVNR_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XCRDNR_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XFRIPD_0] [datetime] NULL,
	[XVESSELNO_0] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZCCE1_0] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ROWID] [numeric](38, 0) NULL
) ON [PRIMARY]

GO
