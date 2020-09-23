create table if not exists ${WQP_SCHEMA_NAME}.public_srsnames
(data_source_id                 smallint
,parm_cd                        character varying (5)
,description                    character varying (170)
,characteristicname             character varying (1200)
,measureunitcode                character varying (10)
,resultsamplefraction           character varying (24)
,resulttemperaturebasis         character varying (12)
,resultstatisticalbasis         character varying (25)
,resulttimebasis                character varying (12)
,resultweightbasis              character varying (15)
,resultparticlesizebasis        character varying (64)
,last_rev_dt                    date
,max_last_rev_dt                date
)
with (fillfactor = 100)
;
