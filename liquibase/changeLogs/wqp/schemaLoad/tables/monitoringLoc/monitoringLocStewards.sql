create unlogged table if not exists ${WQP_SCHEMA_NAME}.monitoring_loc_stewards
partition of ${WQP_SCHEMA_NAME}.monitoring_loc
for values in (1)
with (fillfactor = 100)
;
