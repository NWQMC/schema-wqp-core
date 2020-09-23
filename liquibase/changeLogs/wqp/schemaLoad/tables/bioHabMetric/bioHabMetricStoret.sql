create table if not exists ${WQP_SCHEMA_NAME}.bio_hab_metric_storet
partition of ${WQP_SCHEMA_NAME}.bio_hab_metric
for values in (3)
with (fillfactor = 100)
;
