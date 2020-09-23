create table if not exists ${WQP_SCHEMA_NAME}.data_source
(data_source_id                 smallint
,text                           character varying (8)
,primary key (data_source_id)
)
with (fillfactor = 100)
;
