create table if not exists ${WQP_SCHEMA_NAME}.country_nwis
partition of ${WQP_SCHEMA_NAME}.country
for values in (2)
with (fillfactor = 100)
;
