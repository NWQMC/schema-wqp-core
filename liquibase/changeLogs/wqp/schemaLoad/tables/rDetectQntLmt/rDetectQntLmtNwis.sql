create table if not exists ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt_nwis
partition of ${WQP_SCHEMA_NAME}.r_detect_qnt_lmt
for values in (2)
with (fillfactor = 100)
;
