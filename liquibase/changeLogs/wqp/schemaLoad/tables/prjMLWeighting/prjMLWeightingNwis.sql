create table if not exists ${WQP_SCHEMA_NAME}.prj_ml_weighting_nwis
partition of ${WQP_SCHEMA_NAME}.prj_ml_weighting
for values in (2)
with (fillfactor = 100)
;
