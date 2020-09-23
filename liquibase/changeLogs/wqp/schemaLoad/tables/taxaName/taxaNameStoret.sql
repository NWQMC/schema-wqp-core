create table if not exists ${WQP_SCHEMA_NAME}.taxa_name_storet
partition of ${WQP_SCHEMA_NAME}.taxa_name
for values in (3)
with (fillfactor = 100)
;
