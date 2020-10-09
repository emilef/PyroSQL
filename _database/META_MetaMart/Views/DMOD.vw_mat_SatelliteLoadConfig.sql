SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [DMOD].[vw_mat_SatelliteLoadConfig]
AS
SELECT
 
lc.LoadConfigID AS [Load Config ID],
lc.LoadTypeID AS [Load Type ID],
lt.LoadTypeCode AS [Load Type Code],
lt.LoadTypeName AS [Load Type Name],
lt.LoadTypeDescription AS [Load Type Description],
lt.ETLLoadTypeID AS [ETL Load Type ID],
lt.IsCreatedDTRequired AS [Is Created Date Required],
lt.IsUpdatedDTRequired AS [Is Updated Date Requred],
gd.DetailTypeCode AS [Detail Type Code],
gd.DetailTypeDescription AS [Detail Type Description],
lt.DatabasePurposeID AS [Database Purpose ID],
dbp.DatabasePurposeCode AS [Database Purpose Code],
dbp.DatabasePurposeName AS [Database Purpose Name],
lt.DataEntityTypeID AS [Data Entity Type ID],
detype.DataEntityNamingPrefix AS [Data Entity Naming Prefix],
detype.DataEntityTypeCode AS [Data Entity Type Code],
detype.DataEntityTypeName AS [Data Entity Type Name],
detype.IsAllowedInRawVault AS [Is Allowed In Raw Vault],
detype.IsAllowedInBizVault AS [Is Allowed In Biz Vault],
lc.SourceDataEntityID AS [Source Data Entity ID],
desource.DataEntityName AS [Source Data Entity Name],
lc.TargetDataEntityID AS [Target Data Entity ID],
detarget.DataEntityName AS [Target Data Entity Name],
lc.IsSetForReloadOnNextRun AS [Is Set For Reload On Next Run],
lc.OffsetDays AS [Offset Days],
lc.CreatedDT_FieldID AS [Created Date Field ID],
lc.UpdatedDT_FieldID AS [Updated Date Field ID],
s.SatelliteID AS [Satellite ID],
s.SatelliteName AS [Satellite Name],
s.IsActive AS [Is Active Satellite],
sdvt.SatelliteDataVelocityTypeName AS [Satellite Data Velocity Type Name],
s.HubID AS [Hub ID],
lc.CreatedDT AS [Created Date],
lc.UpdatedDT AS [Updated Date],
lc.IsActive AS [Is Active Load]

--FROM DMOD.LoadConfig lc --Main Table
FROM DMOD.Satellite s

--LEFT JOIN DMOD.SatelliteLoadConfig slc --M2M table to Satellite from LoadConfig
--ON lc.LoadConfigID = slc.LoadConfigID
LEFT JOIN DMOD.SatelliteLoadConfig slc --M2M table to Satellite from LoadConfig
ON s.SatelliteID = slc.SatelliteID

--LEFT JOIN DMOD.Satellite s --Satellite Details
--ON  slc.SatelliteID = s.SatelliteID
LEFT JOIN DMOD.LoadConfig lc --Satellite Details
ON  slc.LoadConfigID = lc.LoadConfigID

LEFT JOIN DMOD.LoadType lt --Load type Details
ON lc.LoadTypeID = lt.LoadTypeID

LEFT JOIN DC.DataEntity desource -- Source DE Name
ON lc.SourceDataEntityID = desource.DataEntityID

LEFT JOIN DC.DataEntity detarget -- Target DE Name
ON lc.TargetDataEntityID = detarget.DataEntityID

LEFT JOIN DC.DatabasePurpose dbp --Load Type DB Purpose Details
ON lt.DatabasePurposeID = dbp.DatabasePurposeID

LEFT JOIN DC.DataEntityType detype --Load Type DE Type Details
ON lt.DataEntityTypeID = detype.DataEntityTypeID

LEFT JOIN TYPE.Generic_Detail gd -- Generic Load Types
ON lt.ETLLoadTypeID = gd.DetailID

LEFT JOIN DMOD.SatelliteDataVelocityType sdvt -- Satellite velocity Type
ON s.SatelliteDataVelocityTypeID = sdvt.SatelliteDataVelocityTypeID

--WHERE s.SatelliteID IS NOT NULL --not needed for now


GO
