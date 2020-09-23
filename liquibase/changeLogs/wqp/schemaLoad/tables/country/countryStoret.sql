create table if not exists ${WQP_SCHEMA_NAME}.country_storet
partition of ${WQP_SCHEMA_NAME}.country
for values in (3)
with (fillfactor = 100)
;
