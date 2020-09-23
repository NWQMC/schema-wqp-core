create table if not exists ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt_stewards
partition of ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt
for values in (1)
with (fillfactor = 100)
;
