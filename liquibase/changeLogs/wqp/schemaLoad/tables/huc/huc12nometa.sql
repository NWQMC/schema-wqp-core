create table if not exists ${WQP_SCHEMA_NAME}.huc12nometa
(objectid                       numeric
,huc12                          character varying (12)
,geometry                       geometry
)
with (fillfactor = 100)
;
