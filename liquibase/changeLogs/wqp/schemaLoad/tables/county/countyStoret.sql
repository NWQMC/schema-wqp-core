create table if not exists ${WQP_SCHEMA_NAME}.county_storet
partition of ${WQP_SCHEMA_NAME}.county
for values in (3)
with (fillfactor = 100)
;
