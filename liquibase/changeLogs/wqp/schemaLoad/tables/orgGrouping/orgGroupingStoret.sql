create table if not exists ${WQP_SCHEMA_NAME}.org_grouping_storet
partition of ${WQP_SCHEMA_NAME}.org_grouping
for values in (3)
with (fillfactor = 100)
;
