create unlogged table if not exists ${WQP_SCHEMA_NAME}.monitoring_loc_nwis
partition of ${WQP_SCHEMA_NAME}.monitoring_loc
for values in (2)
with (fillfactor = 100)
;
