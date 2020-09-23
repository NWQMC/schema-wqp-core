create table if not exists ${WQP_SCHEMA_NAME}.huc8_conus_hi_ak_pr_dis
(cat_num                        character varying (8)
,first_cat_                     character varying (60)
,geom                           geometry
)
with (fillfactor = 100)
;
