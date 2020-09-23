create table if not exists ${WQP_SCHEMA_NAME}.activity_sum_nwis
partition of ${WQP_SCHEMA_NAME}.activity_sum
for values in (2)
with (fillfactor = 100)
;
