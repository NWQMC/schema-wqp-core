create table if not exists ${WQP_SCHEMA_NAME}.organization_storet
partition of ${WQP_SCHEMA_NAME}.organization
for values in (3)
with (fillfactor = 100)
;
