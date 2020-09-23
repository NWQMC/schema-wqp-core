create table if not exists ${WQP_SCHEMA_NAME}.project_stewards
partition of ${WQP_SCHEMA_NAME}.project
for values in (1)
with (fillfactor = 100)
;
