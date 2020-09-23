create table if not exists ${WQP_SCHEMA_NAME}.etl_threshold
(data_source_id                 smallint
,table_name                     character varying (30)
,min_rows                       integer
,max_diff                       integer
)
with (fillfactor = 100)
;
