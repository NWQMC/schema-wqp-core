create table if not exists ${WQP_SCHEMA_NAME}.activity_sum_storet
partition of ${WQP_SCHEMA_NAME}.activity_sum
for values in (3)
with (fillfactor = 100)
;
