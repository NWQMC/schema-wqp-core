create table if not exists ${WQP_SCHEMA_NAME}.country_stewards
partition of ${WQP_SCHEMA_NAME}.country
for values in (1)
with (fillfactor = 100)
;
