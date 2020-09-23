create table if not exists ${WQP_SCHEMA_NAME}.prj_ml_weighting_storet
partition of ${WQP_SCHEMA_NAME}.prj_ml_weighting
for values in (3)
with (fillfactor = 100)
;
