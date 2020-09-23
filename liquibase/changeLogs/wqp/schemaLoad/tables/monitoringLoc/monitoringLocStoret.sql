create table if not exists ${WQP_SCHEMA_NAME}.monitoring_loc_storet
partition of ${WQP_SCHEMA_NAME}.monitoring_loc
for values in (3)
with (fillfactor = 100)
;
