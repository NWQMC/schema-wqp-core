create table if not exists ${WQP_SCHEMA_NAME}.state_stewards
partition of ${WQP_SCHEMA_NAME}.state
for values in (1)
with (fillfactor = 100)
;
