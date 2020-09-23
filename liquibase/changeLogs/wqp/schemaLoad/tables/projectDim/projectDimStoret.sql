create table if not exists ${WQP_SCHEMA_NAME}.project_dim_storet
partition of ${WQP_SCHEMA_NAME}.project_dim
for values in (3)
with (fillfactor = 100)
;
