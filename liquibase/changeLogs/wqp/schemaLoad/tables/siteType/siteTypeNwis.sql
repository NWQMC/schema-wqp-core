create table if not exists ${WQP_SCHEMA_NAME}.site_type_nwis
partition of ${WQP_SCHEMA_NAME}.site_type
for values in (2)
with (fillfactor = 100)
;
