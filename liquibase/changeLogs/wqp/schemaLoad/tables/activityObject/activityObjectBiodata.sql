create unlogged table if not exists ${WQP_SCHEMA_NAME}.activity_object_biodata
partition of ${WQP_SCHEMA_NAME}.activity_object
for values in (4)
with (fillfactor = 100)
;
