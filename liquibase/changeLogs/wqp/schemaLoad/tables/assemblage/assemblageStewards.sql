create table if not exists ${WQP_SCHEMA_NAME}.assemblage_stewards
partition of ${WQP_SCHEMA_NAME}.assemblage
for values in (1)
with (fillfactor = 100)
;
