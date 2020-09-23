create table if not exists ${WQP_SCHEMA_NAME}.organization_nwis
partition of ${WQP_SCHEMA_NAME}.organization
for values in (2)
with (fillfactor = 100)
;
