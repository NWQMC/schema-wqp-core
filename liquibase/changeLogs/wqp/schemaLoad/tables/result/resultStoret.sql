create table if not exists ${WQP_SCHEMA_NAME}.result_storet
partition of ${WQP_SCHEMA_NAME}.result
for values in (3)
with (fillfactor = 100)
;
