create table if not exists ${WQP_SCHEMA_NAME}.last_etl
(data_source_id                 smallint
,completed_utc                  timestamp
)
with (fillfactor = 100)
;
