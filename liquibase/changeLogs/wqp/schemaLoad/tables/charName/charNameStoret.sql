create table if not exists ${WQP_SCHEMA_NAME}.char_name_storet
partition of ${WQP_SCHEMA_NAME}.char_name
for values in (3)
with (fillfactor = 100)
;
