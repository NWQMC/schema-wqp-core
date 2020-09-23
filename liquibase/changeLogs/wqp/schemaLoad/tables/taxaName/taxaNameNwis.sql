create table if not exists ${WQP_SCHEMA_NAME}.taxa_name_nwis
partition of ${WQP_SCHEMA_NAME}.taxa_name
for values in (2)
with (fillfactor = 100)
;
