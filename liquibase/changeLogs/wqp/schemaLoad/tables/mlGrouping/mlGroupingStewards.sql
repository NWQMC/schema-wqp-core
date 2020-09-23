create table if not exists ${WQP_SCHEMA_NAME}.ml_grouping_stewards
partition of ${WQP_SCHEMA_NAME}.ml_grouping
for values in (1)
with (fillfactor = 100)
;
