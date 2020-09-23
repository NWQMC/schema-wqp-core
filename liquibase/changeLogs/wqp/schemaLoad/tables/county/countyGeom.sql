create table if not exists ${WQP_SCHEMA_NAME}.county_geom
(fips_county_code                 character varying (3)
,county_name                      character varying (256)
,geom                             geometry
,fips_state_code                  character varying (4)
,state_postal_code                character varying (2)
,state_name                       character varying (256)
,country_code                     character varying (2)
,country_name                     character varying (256)
)
with (fillfactor = 100)
;