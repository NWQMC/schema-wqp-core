create table if not exists ${WQP_SCHEMA_NAME}.project_data_nwis
partition of ${WQP_SCHEMA_NAME}.project_data
for values in (2)
with (fillfactor = 100)
;
