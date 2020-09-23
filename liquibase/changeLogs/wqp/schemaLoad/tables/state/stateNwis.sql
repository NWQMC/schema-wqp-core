create table if not exists ${WQP_SCHEMA_NAME}.state_nwis
partition of ${WQP_SCHEMA_NAME}.state
for values in (2)
with (fillfactor = 100)
;
