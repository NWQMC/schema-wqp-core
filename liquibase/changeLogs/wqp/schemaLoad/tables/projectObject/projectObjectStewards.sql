create table if not exists ${WQP_SCHEMA_NAME}.project_object_stewards
partition of ${WQP_SCHEMA_NAME}.project_object
for values in (1)
with (fillfactor = 100)
;
