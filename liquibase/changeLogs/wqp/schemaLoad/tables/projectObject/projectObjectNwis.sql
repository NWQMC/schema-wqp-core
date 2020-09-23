create table if not exists ${WQP_SCHEMA_NAME}.project_object_nwis
partition of ${WQP_SCHEMA_NAME}.project_object
for values in (2)
with (fillfactor = 100)
;
