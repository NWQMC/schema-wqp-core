create unlogged table if not exists ${WQP_SCHEMA_NAME}.taxa_name_biodata
partition of ${WQP_SCHEMA_NAME}.taxa_name
for values in (4)
with (fillfactor = 100)
;
