create table if not exists ${WQP_SCHEMA_NAME}.char_type_nwis
partition of ${WQP_SCHEMA_NAME}.char_type
for values in (2)
with (fillfactor = 100)
;
