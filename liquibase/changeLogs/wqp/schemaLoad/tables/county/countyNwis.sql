create table if not exists ${WQP_SCHEMA_NAME}.county_nwis
partition of ${WQP_SCHEMA_NAME}.county
for values in (2)
with (fillfactor = 100)
;
