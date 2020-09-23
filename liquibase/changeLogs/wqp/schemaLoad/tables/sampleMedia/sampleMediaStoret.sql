create table if not exists ${WQP_SCHEMA_NAME}.sample_media_storet
partition of ${WQP_SCHEMA_NAME}.sample_media
for values in (3)
with (fillfactor = 100)
;
