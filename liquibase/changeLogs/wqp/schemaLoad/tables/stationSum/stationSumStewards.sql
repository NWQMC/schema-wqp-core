create table if not exists ${WQP_SCHEMA_NAME}.station_sum_stewards
partition of ${WQP_SCHEMA_NAME}.station_sum
for values in (1)
with (fillfactor = 100)
;
