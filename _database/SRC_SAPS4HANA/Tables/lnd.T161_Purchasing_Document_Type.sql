SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [lnd].[T161_Purchasing_Document_Type](
	[MANDT] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BSTYP] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BSART] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BSAKZ] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PINCR] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NUMKI] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NUMKE] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BREFN] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REFBA] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ABVOR] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STAFO] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UPINC] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STAKO] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PARGR] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NUMKA] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HITYP] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LPHIS] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GSFRG] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VARIANTE] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SHENQ] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KZALE] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ABGEBOT] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KORNR] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UMLIF] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KOETT] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AR_OBJECT] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KOAKO] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OICSEGI] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OIRFQREQ] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WVVKZ] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XLOKZ] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CP_AKTIVE] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CPTYPE] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FLS_RSTO] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MSR_ACTIVE] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RDP_PROFILE] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NUMKC] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QTN_FOL_DOC_DRAFT_AUTOM] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QTN_FOL_DOC_ACTIVE_AUTOM] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QTN_FOL_DOC_MANUALLY] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RFQ_PROCESS_TYPE] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SCNR_BASED_WFL] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RFX_PROCESSING_CD] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ITMAC] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[/SAPMP/CEACT] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[/SAPMP/PDACT] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[/SAPMP/PPROT] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[/SAPMP/PUSER] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[/SAPMP/PAUSW] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[/SAPMP/ATNAM] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[/SAPMP/GAUF] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOLSL] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_VAS_ACT] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_VAS_KALSM] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_VAS_DEL] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_VAS_DETDT] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_EXCL_RETURN] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_VAR_KALSM] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_DPR_DETPRO] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_PO_IDOC] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_VAS_CORR] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_AUTO_DC] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSH_VM_ACT] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MILL_OMKZ] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WRF_ENABLE_DATELINE] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
