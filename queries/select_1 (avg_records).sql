SELECT AVG(table_row_count) AS average_records
FROM (
    SELECT table_name, 
           table_schema,
           (xpath('/row/cnt/text()', xml_count))[1]::text::int AS table_row_count
    FROM (
        SELECT table_name, 
               table_schema, 
               query_to_xml(format('SELECT COUNT(*) as cnt FROM %I.%I', table_schema, table_name), false, true, '') AS xml_count
        FROM information_schema.tables
        WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
    )
);