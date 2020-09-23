create table if not exists ${WQP_SCHEMA_NAME}.state_storet
partition of ${WQP_SCHEMA_NAME}.state
for values in (3)
with (fillfactor = 100)
;
