create table if not exists ${WQP_SCHEMA_NAME}.sample_media
(data_source_id                 smallint
,code_value                     text
,description                    text
)
partition by list (data_source_id)
;
