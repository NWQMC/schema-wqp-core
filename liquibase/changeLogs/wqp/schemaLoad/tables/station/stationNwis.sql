create table if not exists ${WQP_SCHEMA_NAME}.station_nwis
partition of ${WQP_SCHEMA_NAME}.station
for values in (2)
with (fillfactor = 100)
;
