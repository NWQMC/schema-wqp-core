create table if not exists ${WQP_SCHEMA_NAME}.result_stewards
partition of ${WQP_SCHEMA_NAME}.result
for values in (1)
with (fillfactor = 100)
;
