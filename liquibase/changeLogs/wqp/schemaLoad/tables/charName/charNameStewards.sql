create table if not exists ${WQP_SCHEMA_NAME}.char_name_stewards
partition of ${WQP_SCHEMA_NAME}.char_name
for values in (1)
with (fillfactor = 100)
;
