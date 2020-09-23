create table if not exists ${WQP_SCHEMA_NAME}.station_object_storet
partition of ${WQP_SCHEMA_NAME}.station_object
for values in (3)
with (fillfactor = 100)
;
