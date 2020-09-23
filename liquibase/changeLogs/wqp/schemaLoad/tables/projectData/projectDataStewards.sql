create table if not exists ${WQP_SCHEMA_NAME}.project_data_stewards
partition of ${WQP_SCHEMA_NAME}.project_data
for values in (1)
with (fillfactor = 100)
;
