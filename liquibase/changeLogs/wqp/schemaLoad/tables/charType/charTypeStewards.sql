create table if not exists ${WQP_SCHEMA_NAME}.char_type_stewards
partition of ${WQP_SCHEMA_NAME}.char_type
for values in (1)
with (fillfactor = 100)
;
