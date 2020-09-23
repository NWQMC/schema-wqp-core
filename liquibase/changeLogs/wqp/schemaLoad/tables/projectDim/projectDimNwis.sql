create table if not exists ${WQP_SCHEMA_NAME}.project_dim_nwis
partition of ${WQP_SCHEMA_NAME}.project_dim
for values in (2)
with (fillfactor = 100)
;
