create table if not exists ${WQP_SCHEMA_NAME}.taxa_name_stewards
partition of ${WQP_SCHEMA_NAME}.taxa_name
for values in (1)
with (fillfactor = 100)
;
