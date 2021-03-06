SELECT  DB_NAME() AS dbname, 
 o.type_desc AS referenced_object_type, 
 d1.referenced_entity_name, 
 d1.referenced_id, 
        STUFF( (SELECT ', ' + OBJECT_NAME(d2.referencing_id)
   FROM sys.sql_expression_dependencies d2
         WHERE d2.referenced_id = d1.referenced_id
                ORDER BY OBJECT_NAME(d2.referencing_id)
                FOR XML PATH('')), 1, 1, '') AS dependent_objects_list
FROM sys.sql_expression_dependencies  d1 JOIN sys.objects o 
  ON  d1.referenced_id = o.[object_id]
GROUP BY o.type_desc, d1.referenced_id, d1.referenced_entity_name
ORDER BY o.type_desc, d1.referenced_entity_name
      

	  HUB_Plant	1189279692	 
	  
	  HUB_SAP_S4HANA_Plant_INCR, HUB_SAP_S4HANA_Plant_INIT, SRC_SAP_S4HANA_Plant_TDFT_INCR, STG_SAP_S4HANA_Plant_PREP_DELETE, vw_DimPlant, vw_FactFinancial_Thuto_New, vw_FactFinancial_v3, vw_FactPurchaseOrder, vw_FactRIFOT_Dev, vw_FactStockAdjustment, vw_FactStockAvailability, vw_FactStockCount, vw_FactTotalInventoryValue, z_vw_FactPurchaseOrder_CTE, zz_vw_FactJournalEntries_Old, zz_vw_FactJournalEntries_old2, zz_vw_FactPurchaseOrder_Emile, zz_vw_FactPurchaseOrder_HeinreTest, zz_vw_FactPurchaseOrder_Old, zzz_vw_FactDuplicateInvoices_old



	  
	  ;with ObjectHierarchy ( Base_Object_Id , Base_Cchema_Id , Base_Object_Name , Base_Object_Type, object_id , Schema_Id , Name , Type_Desc , Level , Obj_Path) 
as 
    ( select  so.object_id as Base_Object_Id 
        , so.schema_id as Base_Cchema_Id 
        , so.name as Base_Object_Name 
        , so.type_desc as Base_Object_Type
        , so.object_id as object_id 
        , so.schema_id as Schema_Id 
        , so.name 
        , so.type_desc 
        , 0 as Level 
        , convert ( nvarchar ( 1000 ) , N'/' + so.name ) as Obj_Path 
    from sys.objects so 
        left join sys.sql_expression_dependencies ed on ed.referenced_id = so.object_id 
        left join sys.objects rso on rso.object_id = ed.referencing_id 
    where rso.type is null 
        and so.type in ( 'P', 'V', 'IF', 'FN', 'TF' , 'U') 

    union all 
    select   cp.Base_Object_Id as Base_Object_Id 
        , cp.Base_Cchema_Id 
        , cp.Base_Object_Name 
        , cp.Base_Object_Type
        , so.object_id as object_id 
        , so.schema_id as ID_Schema 
        , so.name 
        , so.type_desc 
        , Level + 1 as Level 
        , convert ( nvarchar ( 1000 ) , cp.Obj_Path + N'/' + so.name ) as Obj_Path 
    from sys.objects so 
        inner join sys.sql_expression_dependencies ed on ed.referenced_id = so.object_id 
        inner join sys.objects rso on rso.object_id = ed.referencing_id 
        inner join ObjectHierarchy as cp on rso.object_id = cp.object_id and rso.object_id <> so.object_id 
    where so.type in ( 'P', 'V', 'IF', 'FN', 'TF', 'U') 
        and ( rso.type is null or rso.type in ( 'P', 'V', 'IF', 'FN', 'TF', 'U' ) ) 
        and cp.Obj_Path not like '%/' + so.name + '/%' )   -- prevent cycles n hierarcy
select   Base_Object_Name 
    , Base_Object_Type
    , REPLICATE ( '   ' , Level ) + Name as Indented_Name 
    , SCHEMA_NAME ( Schema_Id ) + '.' + Name as object_id 
    , Type_Desc as Object_Type 
    , Level 
    , Obj_Path 
from ObjectHierarchy as p 



SELECT * FROM (SELECT NAME AS ProcedureName, SUBSTRING(( SELECT ', ' + OBJDEP.NAME
FROM  sysdepends
    INNER JOIN sys.objects OBJ ON sysdepends.ID = OBJ.OBJECT_ID
          INNER JOIN sys.objects OBJDEP ON sysdepends.DEPID = OBJDEP.OBJECT_ID
WHERE obj.type = 'P'
AND Objdep.type in ('P', 'V', 'U', 'TR', 'FN', 'IF', 'TF')
AND sysdepends.id = procs.object_id
--AND OBJ.Name = 'usp_RPT_R0040'
ORDER BY OBJ.name

FOR
XML PATH('')), 2, 8000) AS NestedProcedures

FROM sys.procedures procs
) InnerTab
WHERE NestedProcedures IS NOT NULL
order by Obj_Path


/*
	EXEC  [dm].[Dependency_MsDependencies] 
							@objname  = 'raw.HUB_Plant'
		
*/
	
							
CREATE OR ALTER  procedure [dm].[Dependency_MsDependencies]
@objname nvarchar(517) = null, @objtype int = null, @flags int = 0x01fd, @objlist nvarchar(128) = null, @intrans int = null
as
    set deadlock_priority low
    
	create table #t1 (
		tid				int				NULL,
		ttype			smallint		NULL,
		tcat			smallint		NULL,
		pid				int				NULL,
		ptype			smallint		NULL,
		pcat			smallint		NULL,
		bDone			smallint		NULL
	)
	create table #t2 (
		tid				int				NULL,
		ttype			smallint		NULL,
		tcat			smallint		NULL,
		pid				int				NULL,
		ptype			smallint		NULL,
		pcat			smallint		NULL,
		bDone			smallint		NULL
	)

    create table #t21(
        pid             int             NULL,
        ptype           smallint        NULL,
        pcat            smallint        NULL,
        depid           int             NULL
    )


	create table #tempudt (
		dtype			int				NOT NULL
	)

	/* Worktables we'll use for optimization. */
	create table #t3 (
		tid				int				NOT NULL
	)
	create table #t4 (
		tid				int				NOT NULL
	)
	/* create clustered index #ci_t3 on #t3(tid) with allow_dup_row */
	/* create clustered index #ci_t4 on #t4(tid) with allow_dup_row */
	create clustered index #ci_t3 on #t3(tid)
	create clustered index #ci_t4 on #t4(tid)
	create table #temptrig(
		id				int				NOT NULL,
		deltrig			int				NOT NULL,
		sysstat			smallint		NOT NULL,
		category		int				NOT NULL
	)
	/* create clustered index #ci_temptrig on #temptrig (deltrig) with allow_dup_row */
	create clustered index #ci_temptrig on #temptrig (deltrig)

   /* 8.0 The new UDF is taking 0x0001, and we have to re-assign UDDT */
	if (@objname = N'?')
	begin
		print N'sp_MSobject_dependencies name = NULL, type = NULL, flags = 0x01fd'
		print N'  name:  name or null (all objects of type)'
		print N'  type:  type number (see below) or null'
		print N'	  if both null, get all objects in database'
		print N'  flags is a bitmask of the following values:'
		print N'	  0x10000  = return multiple parent/child rows per object'
		print N'	  0x20000  = descending return order'
		print N'	  0x40000  = return children instead of parents'
		print N'	  0x80000  = Include input object in output result set'
		print N'	  0x100000 = return only firstlevel (immediate) parents/children'
		print N'	  0x200000 = return only DRI dependencies'
		print N'	  power(2, object type number(s))  to return in results set:'
		print N'		  0 (1  	- 0x0001)	 - UDF'
		print N'		  1 (2  	- 0x0002)	 - system tables or MS-internal objects'
		print N'		  2 (4  	- 0x0004)	 - view'
		print N'		  3 (8  	- 0x0008)	 - user table'
		print N'		  4 (16		- 0x0010)	 - procedure'
		print N'		  5 (32		- 0x0020)	 - log'
		print N'		  6 (64 	- 0x0040)	 - default'
		print N'		  7 (128	- 0x0080)	 - rule'
		print N'		  8 (256	- 0x0100)	 - trigger'
		print N'		  12 (1024	- 0x0400) - uddt'
		print N'	  shortcuts:'
		print N'		  29	 (0x011c) - trig, view, user table, procedure'
		print N'		  448	(0x00c1) - rule, default, datatype'
		print N'		  4606 (0x11fd) - all but systables/objects'
		print N'		  4607 (0x11ff) - all'
		return 0
	end

	/* If this proc is called in a tight loop, it tends to fill up the log in a small tempdb too fast */
	/* for the trunc. log on chkpt thread to keep up.  So help it out here.                           */
   /* I can do this only if the current login has the proper permission to dump tempdb               */
   /* In order to find out this information, I need to switch to tempdb                              */
	declare @origdb nvarchar(128)
   declare @tempdbName nvarchar(258)
	select @origdb = db_name()
   SELECT @tempdbName = REPLACE(@origdb, N']', N']]')

	/* If they want SQLDMODep_DRIOnly, remove all but usertable objects from @flags */
	if (@flags & 0x200000 <> 0)
		select @flags = (@flags & ~convert(int, 0x05ff)) | power(2, 3)

	if (@objtype in (12, 5, 6, 7))
	begin
		/* Print only, do not raiserror as we may be calling this blindly and this is not a real error. */
		print N'Rules, defaults, and datatypes do not have dependencies.'
		return (0)
	end

	/*
	 * Create #t1 and #t2 as temp object holding areas.  Columns are:
	 *	 tid		- temp object id
	 *	 ttype	 - temp object type
	 *	 pid		- parent or child object id
	 *	 ptype	 - parent or child object type
	 *	 bDone	 - NULL means dependencies not yet evaluated, else nonNULL.
	 */
	declare @curid int, @curcat int, @rowsaffected int
	declare @allobjs int
	declare @delinputobj int
	select @allobjs = 0, @delinputobj = 0, @curid = NULL, @curcat = NULL

	/*
	 * If both name and type are null, this means get every object in the
	 * database matching the specification they passed in.  Otherwise,
	 * find the passed object or all objects of the passed type.  Start off
	 * loading parent info (pid, tid); these will be put into child as needed.
	 * If Objlist is specified we simply load its contents into #t1.
	 */
	if (@objlist is not null)
	begin
		declare @cmd nvarchar(1024)
		set @cmd = N'insert #t1 (pid, ptype, pcat) select l.objid, l.objtype, o.category &2'+
				N' from ' + QUOTENAME(@objlist, ']') + N' l, dbo.sysobjects o where o.id = l.objid '

		exec(@cmd)

	end else begin
		if (@objname is null and @objtype is null)
		begin
			set nocount on
			select @allobjs = 1
			insert #t1 (pid, ptype, pcat) select o.id, o.sysstat & 0x0f, o.category & 0x0002 from dbo.sysobjects o
				where ((power(2, o.sysstat & 0x0f) & 0x05ff) <> 0) and (OBJECTPROPERTY(o.id, N'IsDefaultCnst') <> 1 and OBJECTPROPERTY(o.id, N'IsRule') <> 1 )
		end else begin
			if (@objname is not null)
			begin
				select @curid = id, @objtype = o.sysstat & 0x0f, @curcat = o.category & 0x0002 from dbo.sysobjects o where id = object_id(@objname)
				if (@curid is null)
				begin
					RAISERROR (15001, -1, -1, @objname)
					return 1
				end
				if (@flags & 0x80000 = 0)
					select @delinputobj = @curid
			end

			set nocount on
			if (@curid is null)
				insert #t1 (pid, ptype, pcat) select o.id, o.sysstat & 0x0f, o.category & 0x0002 from dbo.sysobjects o
					where o.sysstat & 0x0f = @objtype
			else
				insert #t1 (pid, ptype, pcat) values (@curid, @objtype, @curcat)
		end
	end
	/*
	 * All initial objects are loaded as parents/children.  Now we loop, creating
	 * rows of child/parent relationships.  Use #t2 as a temp area for the selects
	 * to simulate recursion; when they find no rows, we're done with this step.
	 *
	 * Note that triggers are weird; they're part of a table definition but can
	 * also reference other tables, so we need to evaluate them both ways.  SQL
	 * Server stores the table for a trigger object as its deltrig; if a trigger
	 * references another table, that relationship is stored in sysdepends.
	 * This peculiarity of triggers requires separating the object-retrieval pass
	 * from the creation-sequence pass (below).  Also, the fact that trigger tables
	 * are stored in a non-indexed column (deltrig) requires us to use a worktable
	 * if we're returning triggers, so we don't continually tablescan sysobjects.
	 */

	if (@flags & power(2, 8) != 0)
		insert #temptrig select d.id, d.deltrig, d.sysstat, d.category from dbo.sysobjects d where OBJECTPROPERTY(d.id, N'IsTrigger') = 1

	while (select count(*) from #t1 where bDone is null) > 0
	begin
		/*
		 * Remove Microsoft-internal or other system objects from #t1, unless
		 * @flags specified including system tables.  We do this here so that
		 * cascaded system dependencies are not included unless specifically
		 * requested.  For other restrictions, we wait until below so that all
		 * cascaded object types are fully evaluated.
		 */
		if (@flags & power(2, 1) = 0)
			delete #t1 where ttype = 1 or tcat = 0x0002 or pcat = 0x0002

		if (@flags & 0x40000 != 0)
		begin
			if (@flags & 0x200000 = 0) begin
				/* Table --> Triggers */
				if (@flags & power(2, 8) != 0)
					insert #t2 (tid, ttype, tcat, pid, ptype, pcat)
						select distinct t.pid, t.ptype, t.pcat, o.id, o.sysstat & 0x0f, o.category & 0x0002 from #t1 t, #temptrig o
							where t.bDone is null and t.ptype = 3 and o.deltrig = t.pid

				/* Object --> sysdepends children */
				insert #t2 (tid, ttype, tcat, pid, ptype, pcat)
					select distinct t.pid, t.ptype, t.pcat, d.id, o.sysstat & 0x0f, o.category & 0x0002
					from #t1 t, dbo.sysdepends d, dbo.sysobjects o
					where t.bDone is null and d.depid = t.pid and d.id = o.id
			end

			/* Object --> sysreferences children (FK tables referencing this one) */
			insert #t2 (tid, ttype, tcat, pid, ptype, pcat)
				select distinct t.pid, t.ptype, t.pcat, r.fkeyid, o.sysstat & 0x0f, o.category & 0x0002
				from #t1 t, dbo.sysreferences r, dbo.sysobjects o
				where t.bDone is null and r.rkeyid = t.pid and r.fkeyid = o.id
		end else begin
			if (@flags & 0x200000 = 0) begin
				/* Trigger --> Table */
				if (@flags & power(2, 3) != 0)
					insert #t2 (tid, ttype, tcat, pid, ptype, pcat)
						select distinct t.pid, t.ptype, t.pcat, o.deltrig, u.sysstat & 0x0f, u.category & 0x0002
							  from #t1 t, dbo.sysobjects o, dbo.sysobjects u
							where t.bDone is null and t.ptype = 8 and o.id = t.pid and o.deltrig != 0 and u.id = o.deltrig

				/* Object --> sysdepends parents */
                insert #t21 (pid, ptype, pcat, depid)
                    select distinct t.pid, t.ptype, t.pcat, d.depid
					from #t1 t, dbo.sysdepends d
					where t.bDone is null and d.id = t.pid

				insert #t2 (tid, ttype, tcat, pid, ptype, pcat)
					select distinct t.pid, t.ptype, t.pcat, t.depid, o.sysstat & 0x0f, o.category & 0x0002
					from #t21 t, dbo.sysobjects o
					where t.depid = o.id
			end
			/* Object --> sysreferences parents (PK/UQ tables referenced by one) */
			insert #t2 (tid, ttype, tcat, pid, ptype, pcat)
				select distinct t.pid, t.ptype, t.pcat, r.rkeyid, o.sysstat & 0x0f, o.category & 0x0002
				from #t1 t, dbo.sysreferences r, dbo.sysobjects o
				where t.bDone is null and r.fkeyid = t.pid and r.rkeyid = o.id
		end

		/*
		 * We have this generation of parents in #t2, so clear the current
		 * child generation's bDone flags.  Then insert from #t2; the current
		 * parent generation becomes the next loop's child generation, with
		 * bDone = null until next loop's dependencies are selected.
		 */
		update #t1 set bDone = 1
		insert #t1 select * from #t2 where #t2.tid not in
			(select tid from #t1 where #t1.tid = #t2.tid and #t1.pid = #t2.pid)
		truncate table #t2

		/* If they only want one level, we're done.	*/
		if (@flags & 0x100000 <> 0)
			update #t1 set bDone = 1
	end

	/*
	 * The inner loop above did not put parents with no parents into the
	 * child (tid) list.  Do that now, then remove all rows where tid is
	 * NULL, because these were initial objects which now have a tid row.
	 * Just in case, remove self-refs from #t1, and also remove rows from #t1
	 * with NULL pid if a row exists for that tid where the pid is nonNULL.
	 * Avoid nested self-joins by using worktables.
	 */
	truncate table #t3
	insert #t3 select tid from #t1 where tid is not null
		and tid <> pid				-- make sure self-refs with no other refs go in child list
	/* update statistics #t3 #ci_t3 */
	insert #t1 (tid, ttype, tcat, bDone) select distinct pid, ptype, pcat, 0 from #t1 t
		where t.pid is not null and not exists (select * from #t3 where tid = t.pid)
	delete #t1 where tid = pid		-- now remove self-refs

	/*
	 * Because triggers can go in both directions, we'll need to check for
	 * circular dependencies on parent evaluation.  Since any tables referenced
	 * by the trigger must exist before the trigger can be created, remove rows
	 * where the trigger is the parent.
	 */
	if (@flags & 0x40000 = 0)
		delete #t1 where ptype = 8

	truncate table #t3
	insert #t3 select tid from #t1 where tid is not null and pid is not null
	/* update statistics #t3 #ci_t3 */
	delete #t1 where #t1.tid is null or #t1.tid = #t1.pid
		or (#t1.pid is null and exists (select * from #t3 where tid = #t1.tid))

	/*
	 * If we're to get all objects, get all UDDTs (which aren't in dbo.sysobjects)
	 * and Rules/Defaults, assuming we're returning those types.
	 */
	if (@allobjs <> 0)
	begin
		if (@flags & power(2, 12) != 0)
			insert #tempudt
				select xusertype from dbo.systypes where xusertype > 256
		if (@flags & (power(2, 7) | power(2, 6)) != 0)
			insert #t2 (tid, ttype, tcat)
				select id, sysstat & 0x0f, 0 from dbo.sysobjects
				where (OBJECTPROPERTY(id, N'IsRule') = 1 or OBJECTPROPERTY(id, N'IsDefault') = 1)
				and category & 0x0800 = 0
	end else begin
		/*
		 * Not getting all objects.  Get any datatypes that
		 * are referenced by objects in #t1.  We don't care about specific
		 * datatype dependencies, we just want to know which ones are needed.
		 */
		if (@flags & power(2, 12) != 0)
			insert #tempudt select distinct xusertype from dbo.syscolumns
				where xusertype > 256 and id in (select tid from #t1)

		/*
		 * Load rules and defaults needed by datatypes and other #t1 objects
		 * into #t2.  Don't track specific object dependencies with these;
		 * we just want to know which ones are needed.  For defaults only, eliminate
		 * those which are constraints.
		 */
		if (@flags & power(2, 7) != 0)
		begin
			insert #t2 (tid, ttype, tcat)
				select distinct s.domain, 7, 0 from dbo.systypes s, #tempudt t
					where s.domain != 0 and s.xusertype = t.dtype
						and s.domain not in (select tid from #t1)
			insert #t2 (tid, ttype, tcat)
				select distinct s.domain, 7, 0 from dbo.syscolumns s, #t1 t
					where s.domain != 0 and s.id = t.tid
						and s.domain not in (select tid from #t1)
		end
		if (@flags & power(2, 6) != 0)
		begin
			insert #t2 (tid, ttype, tcat)
				select distinct s.tdefault, 6, 0 from dbo.systypes s, #tempudt t
					where s.tdefault != 0 and s.xusertype = t.dtype
						and s.tdefault not in (select tid from #t1)
						and s.tdefault not in (select id from dbo.sysobjects where category & 0x0800 != 0)
			insert #t2 (tid, ttype, tcat)
				select distinct s.cdefault, 6, 0 from dbo.syscolumns s, #t1 t
					where s.cdefault != 0 and s.id = t.tid
						and s.cdefault not in (select tid from #t1)
						and s.cdefault not in (select id from dbo.sysobjects where category & 0x0800 != 0)
		end
	end		/* Not getting all objects */

	/*
	 * Now that we've got all objects we want, eliminate those we don't
	 * want to return.  If @inputobj and they don't want it returned,
	 * remove it from the table.  Then eliminate object types they don't
	 * want returned.  Make sure that in doing so we retain all parent
	 * objects of the types we do want -- it is possible at this point
	 * that a tid we want has no rows except those with pids we don't want.
	 */
	if (@flags & 0x05ff != 0x05ff or @delinputobj != 0)
	begin
		delete #t1 where @flags & power(2, ttype) = 0 or tid = @delinputobj

		/*
		 * Be sure that the insert does not duplicate rows that will survive the
		 * following delete -- these are rows where the pid is not @delinputobj
		 * and ptype is either null or a type we'll keep (if ptype is null then
		 * pid hasn't been set so no need for more complex checking).
		 */
		insert #t1 (tid, ttype, tcat) select distinct tid, ttype, tcat from #t1
			where (@flags & power(2, ptype) = 0 or pid = @delinputobj)
				and tid not in (select tid from #t1 where ptype is null or
					(pid != @delinputobj and @flags & power(2, ptype) != 0))
		delete #t1 where @flags & power(2, ptype) = 0 or pid = @delinputobj
	end

	/*
	 * To determine creation order, find all objects which are not yet bDone
	 * and have no parents or whose parents are all bDone, and set their bDone
	 * to the next @curid.  This will leave bDone as the ascending order in
	 * which objects must be created (topological sort).  Again, use worktables
	 * to remove nested self-joins.
	 */
	update #t1 set bDone = 0
	select @curid = 1, @rowsaffected = 1
	while (@rowsaffected <> 0)
	begin
		if (@flags & 0x40000 != 0) begin
			truncate table #t3
			insert #t3 select pid from #t1 where pid is not null and bDone = 0
			/* update statistics #t3 #ci_t3 */
			update #t1 set bDone = @curid where bDone = 0 and tid not in (select tid from #t3)
		end else begin
			truncate table #t3
			truncate table #t4
			insert #t3 select tid from #t1 where bDone = 0				/* Parents not yet done */
			/* update statistics #t3 #ci_t3 */
			insert #t4 select tid from #t1								/* TIDs with (parents not yet done) */
				where pid is not null and pid in (select tid from #t3)
			/* update statistics #t4 #ci_t4 */
			update #t1 set #t1.bDone = @curid where #t1.bDone = 0 		/* TIDs who are not (TIDs with (parents not yet done)) */
				and not exists (select * from #t4 where tid = #t1.tid)
		end
		select @rowsaffected = @@rowcount, @curid = @curid + 1
	end

	/* For SQL60 only, we need to check circular dependencies (DRI for tables is the only way to get them). */
	/* This will have occurred if we still have any rows in #t1 where bDone = 0, after the above loop. */
	/*
	 * At this point, these are indirect (a->b->...->a), and can only be created by:
	 * 	create table a; create table b ref a; alter table a ref b
	 * There is thus no way to create the tables in a single pass.  Further, the ALTER
	 * TABLE B must be done AFTER data has been added (else the PK/FK will fail).
	 * Therefore, the two-step model of
	 *  - Create tables (and other objects)
	 *  - Transfer data
	 * does not work, so assume anyone doing this will do it in three passes (e.g. ScriptTransfer):
	 *  - Create tables (and other objects) but no references (also defer some indexing, for perfomance)
	 *  - Transfer data
	 *  - Create references (and deferred indexing)
	 * and just set bDone for everything remaining to @curid.
	 */
	if exists (select * from #t1 where bDone = 0) begin
		--select "Circular Dependencies", object_name(tid) from #t1 where bDone = 0
		--RAISERROR (14300, -1, -1)
		--return 1
		update #t1 set bDone = @curid where bDone = 0
	end

	/*
	 * Finally, return the objects.  Rules/Defaults must be created first so they're returned first,
	 * followed by UDDTs. followed by all other (sysdepends/DRI) dependencies.  @curid is the bDone
	 * value; we need to increment the #t1 value so our multi-result-set is in the proper sequence.
	 * Of course, these never have parents, so don't return them if asking for children.
	 */
	if (@flags & 0x40000 = 0) begin
		select @curid = 1
		if ((@flags & (power(2, 7) | power(2, 6)) != 0) and exists (select * from #t2)) begin
			update #t1 set bDone = bDone + 1
			select distinct oType = power(2, o.sysstat & 0x0f), oRuleDefName = o.name, oOwner = schema_name(syso.schema_id), oSequence = convert(smallint, @curid)
				from dbo.sysobjects o, #t2 t, sys.all_objects syso
				where o.id = t.tid and o.id = syso.object_id
				order by power(2, o.sysstat & 0x0f), o.name
			select @curid = @curid + 1
		end
		if ((@flags & power(2, 12) != 0) and exists (select * from #tempudt)) begin
			update #t1 set bDone = bDone + 1
			select distinct oType = power(2, 12), oUDDTName = c.name, oOwner = schema_name(syst.schema_id), oSequence = convert(smallint, @curid)
				from dbo.systypes c, #tempudt t, dbo.sysobjects p, sys.types syst
				where c.xusertype = t.dtype and c.xusertype = syst.user_type_id
				order by c.name
			select @curid = @curid + 1
		end
	end

	/*
	 * Select dependency-style objects, returning parents if desired.
	 * Normally sorting is in terms of who must be created first, i.e. ascending:  parent-->child-->grandchild.
	 * Descending order (child-->parent-->grandparent) would be used for a graphical-dependencies evaluator showing
	 * the parents.  Therefore we invert bDone if descending sort.  bDone is 1-based; min + max - bDone gives inversion.
	 * Note:  Always return at least this empty set.
	 */
	if (@flags & 0x20000 != 0) begin
		select @curid = max(bDone) + min(bDone) from #t1
		update #t1 set bDone = convert(smallint, @curid) - bDone
	end
	if (@flags & 0x10000 != 0)
		select distinct oType = power(2, o.sysstat & 0x0f), oObjName = o.name, oOwner = schema_name(sysoo.schema_id),
/*				RelType = power(2, p.sysstat & OBJTYPE_BITS), RelName = p.name, RelOwner = user_name(p.uid), */
				RelType = case when (p.name is not null) then power(2, p.sysstat & 0x0f) else 0 end, RelName = p.name, RelOwner = schema_name(sysop.schema_id),
				oSequence = t.bDone
			from dbo.sysobjects o, dbo.sysobjects p right join #t1 t on p.id = t.pid, sys.all_objects sysoo, sys.all_objects sysop 
			where o.id = t.tid and o.id = sysoo.object_id and p.id = sysop.object_id
			order by t.bDone, power(2, o.sysstat & 0x0f), o.name
	else
		select distinct oType = power(2, o.sysstat & 0x0f), oObjName = o.name, oOwner = schema_name(syso.schema_id),
				oSequence = t.bDone
			from dbo.sysobjects o, sys.all_objects syso, #t1 t
			where o.id = t.tid and o.id = syso.object_id
			order by t.bDone, power(2, o.sysstat & 0x0f), o.name



			WITH ref_list AS
    (SELECT o.object_id, OBJECT_SCHEMA_NAME(o.object_id) AS schema_name, o.name AS object_name, o.type_desc
       FROM sys.sql_expression_dependencies ed
       INNER JOIN sys.objects o ON ed.referenced_id = o.object_id
       WHERE 
		--ed.referencing_id = OBJECT_ID('EMS.sp_StageFullLoad_KEYS_EMS_dbo_SalesInvoice_EMS_KEYS','P') AND 
         ed.referenced_id <> ed.referencing_id

     UNION ALL

     SELECT o2.object_id, OBJECT_SCHEMA_NAME(o2.object_id) AS schema_name, o2.name AS object_name, o2.type_desc
       FROM ref_list rl
       INNER JOIN sys.sql_expression_dependencies ed2 ON rl.object_id = ed2.referencing_id
       INNER JOIN sys.objects o2 ON ed2.referenced_id = o2.object_id
       WHERE ed2.referenced_id <> ed2.referencing_id
      )
SELECT DISTINCT schema_name, object_name, type_desc
  FROM ref_list;


  SELECT DISTINCT 
   dep.status, dep.deptype,
  obj.name, obj.type, SCHEMA_NAME(obj.schema_id), obj.object_id
 , 	 objdep.name, objdep.type, SCHEMA_NAME(objdep.schema_id), objdep.object_id
FROM  sysdepends AS DEP
    INNER JOIN sys.objects OBJ ON DEP.ID = OBJ.OBJECT_ID
          INNER JOIN sys.objects OBJDEP ON DEP.DEPID = OBJDEP.OBJECT_ID
WHERE obj.type = 'P'
AND Objdep.type in ('P', 'V', 'U', 'TR', 'FN', 'IF', 'TF')
AND DEP.id = obj.object_id
AND OBJ.Name = 'HUB_SAP_S4HANA_ChangeDocumentHeader_INIT'



