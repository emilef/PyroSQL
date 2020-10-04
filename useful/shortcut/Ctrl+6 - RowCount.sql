/* Row Info */ SELECT  tb.object_id AS ObjectID, sc.name AS SchemaName, tb.name AS TableName, tb.max_column_id_used AS NumberOfColumns, pa.rows AS NumberOfRows FROM   sys.tables tb INNER JOIN   sys.schemas sc ON sc.schema_id = tb.schema_id INNER JOIN   sys.partitions pa ON tb.object_id = pa.object_id INNER JOIN   sys.indexes ix ON pa.object_id = ix.object_id AND pa.index_id = ix.index_id AND ix.index_id < 2 GROUP BY tb.object_id, tb.name, sc.name, tb.max_column_id_used, pa.rows ORDER BY sc.name, tb.name