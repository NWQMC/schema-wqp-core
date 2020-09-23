create table if not exists ${WQP_SCHEMA_NAME}.bio_hab_metric_stewards
partition of ${WQP_SCHEMA_NAME}.bio_hab_metric
for values in (1)
with (fillfactor = 100)
;
