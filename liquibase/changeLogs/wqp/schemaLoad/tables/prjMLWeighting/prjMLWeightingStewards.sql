create table if not exists ${WQP_SCHEMA_NAME}.prj_ml_weighting_stewards
partition of ${WQP_SCHEMA_NAME}.prj_ml_weighting
for values in (1)
with (fillfactor = 100)
;
