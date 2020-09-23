create table if not exists ${WQP_SCHEMA_NAME}.project_object_storet
partition of ${WQP_SCHEMA_NAME}.project_object
for values in (3)
with (fillfactor = 100)
;
