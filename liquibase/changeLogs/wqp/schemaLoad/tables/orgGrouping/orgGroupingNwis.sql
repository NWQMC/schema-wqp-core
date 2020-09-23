create table if not exists ${WQP_SCHEMA_NAME}.org_grouping_nwis
partition of ${WQP_SCHEMA_NAME}.org_grouping
for values in (2)
with (fillfactor = 100)
;
