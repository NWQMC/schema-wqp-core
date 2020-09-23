create table if not exists ${WQP_SCHEMA_NAME}.station_sum_nwis
partition of ${WQP_SCHEMA_NAME}.station_sum
for values in (2)
with (fillfactor = 100)
;
