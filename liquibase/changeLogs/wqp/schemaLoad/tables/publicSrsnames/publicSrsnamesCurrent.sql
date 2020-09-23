create table if not exists ${WQP_SCHEMA_NAME}.public_srsnames_current
partition of ${WQP_SCHEMA_NAME}.public_srsnames
for values in (1)
with (fillfactor = 100)
;
