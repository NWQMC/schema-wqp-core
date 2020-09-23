create table if not exists ${WQP_SCHEMA_NAME}.activity_stewards
partition of ${WQP_SCHEMA_NAME}.activity
for values in (1)
with (fillfactor = 100)
;
