create table if not exists ${WQP_SCHEMA_NAME}.act_metric_stewards
partition of ${WQP_SCHEMA_NAME}.act_metric
for values in (1)
with (fillfactor = 100)
;
