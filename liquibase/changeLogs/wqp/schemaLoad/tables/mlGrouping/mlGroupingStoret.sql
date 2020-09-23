create table if not exists ${WQP_SCHEMA_NAME}.ml_grouping_storet
partition of ${WQP_SCHEMA_NAME}.ml_grouping
for values in (3)
with (fillfactor = 100)
;
