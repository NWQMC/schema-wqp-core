create table if not exists ${WQP_SCHEMA_NAME}.bio_hab_metric_nwis
partition of ${WQP_SCHEMA_NAME}.bio_hab_metric
for values in (2)
with (fillfactor = 100)
;
