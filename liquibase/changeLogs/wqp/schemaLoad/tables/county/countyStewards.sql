create table if not exists ${WQP_SCHEMA_NAME}.county_stewards
partition of ${WQP_SCHEMA_NAME}.county
for values in (1)
with (fillfactor = 100)
;
