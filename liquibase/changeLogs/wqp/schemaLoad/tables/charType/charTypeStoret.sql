create table if not exists ${WQP_SCHEMA_NAME}.char_type_storet
partition of ${WQP_SCHEMA_NAME}.char_type
for values in (3)
with (fillfactor = 100)
;
