create unlogged table if not exists ${WQP_SCHEMA_NAME}.assemblage_nwis
partition of ${WQP_SCHEMA_NAME}.assemblage
for values in (2)
with (fillfactor = 100)
;
