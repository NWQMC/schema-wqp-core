create table if not exists ${WQP_SCHEMA_NAME}.organization_stewards
partition of ${WQP_SCHEMA_NAME}.organization
for values in (1)
with (fillfactor = 100)
;
