create table if not exists ${WQP_SCHEMA_NAME}.sample_media_stewards
partition of ${WQP_SCHEMA_NAME}.sample_media
for values in (1)
with (fillfactor = 100)
;
