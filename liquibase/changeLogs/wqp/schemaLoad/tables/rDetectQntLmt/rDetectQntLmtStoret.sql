create table if not exists ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt_storet
partition of ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt
for values in (3)
with (fillfactor = 100)
;
