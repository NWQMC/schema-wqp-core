create table if not exists ${WQP_SCHEMA_NAME}.act_metric_storet
partition of ${WQP_SCHEMA_NAME}.act_metric
for values in (3)
with (fillfactor = 100)
;
