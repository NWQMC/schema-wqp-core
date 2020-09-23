create table if not exists ${WQP_SCHEMA_NAME}.result_object_stewards
partition of ${WQP_SCHEMA_NAME}.result_object
for values in (1)
with (fillfactor = 100)
;
