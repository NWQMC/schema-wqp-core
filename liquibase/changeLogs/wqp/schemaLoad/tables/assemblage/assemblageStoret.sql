create table if not exists ${WQP_SCHEMA_NAME}.assemblage_storet
partition of ${WQP_SCHEMA_NAME}.assemblage
for values in (3)
with (fillfactor = 100)
;
