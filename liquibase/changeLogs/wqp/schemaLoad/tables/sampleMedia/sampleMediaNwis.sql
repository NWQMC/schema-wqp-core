create table if not exists ${WQP_SCHEMA_NAME}.sample_media_nwis
partition of ${WQP_SCHEMA_NAME}.sample_media
for values in (2)
with (fillfactor = 100)
;
