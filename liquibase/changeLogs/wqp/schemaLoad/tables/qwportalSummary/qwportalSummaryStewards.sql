create table if not exists ${WQP_SCHEMA_NAME}.qwportal_summary_stewards
partition of ${WQP_SCHEMA_NAME}.qwportal_summary
for values in (1)
with (fillfactor = 100)
;
