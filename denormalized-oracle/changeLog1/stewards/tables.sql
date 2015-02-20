--liquibase formatted sql

--This is for the wqp_core schema


--changeset drsteini:1StewardsTables
create table ars_raw_station
(file_name                      varchar2(100 char)
,load_timestamp                 timestamp(6)
,raw_xml                        xmltype
,constraint ars_raw_station_pk
  primary key (file_name)
);
--rollback drop table raw_station_xml cascade constraints purge;

--changeset drsteini:1StewardsTables
create table ars_raw_result
(file_name                      varchar2(100 char)
,load_timestamp                 timestamp(6)
,raw_xml                        xmltype
,constraint ars_raw_result_pk
  primary key (file_name)
);
--rollback drop table raw_result_xml cascade constraints purge;

--changeset drsteini:1StewardsTables
create table ars_site_type_to_primary
(site_type                      varchar2(500 char)
,primary_site_type              varchar2(500 char)
,constraint ars_site_type_to_primary_pk
  primary key (site_type)
);
--rollback drop table site_type_to_primary cascade constraints purge;

--changeset drsteini:1StewardsTables
create table ars_char_name_to_type
(characteristic_name            varchar2(500 char)
,characteristic_type            varchar2(500 char)
,constraint ars_char_name_type_pk
   primary key (characteristic_name)
);
--rollback drop table ars_char_name_to_type cascade constraints purge;

--changeset drsteini:1StewardsTables
create table station_swap_stewards
(data_source_id                 number
,data_source                    varchar2(4000 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc_12                         varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,geom                           mdsys.sdo_geometry
,station_name                   varchar2(4000 char)
,organization_name              varchar2(4000 char)
,description_text               varchar2(4000 char)
,station_type_name				varchar2(4000 char)
,latitude                       number
,longitude                      number
,map_scale                      varchar2(4000 char)
,geopositioning_method          varchar2(4000 char)
,hdatum_id_code                 varchar2(4000 char)
,elevation_value                varchar2(4000 char)
,elevation_unit                 varchar2(4000 char)
,elevation_method               varchar2(4000 char)
,vdatum_id_code                 varchar2(4000 char)
,coordinates                    varchar2(4000 char)
,drain_area_value               number
,drain_area_unit                varchar2(4000 char)
,contrib_drain_area_value       number
,contrib_drain_area_unit        varchar2(4000 char)
,geoposition_accy_value         varchar2(4000 char)
,geoposition_accy_unit          varchar2(4000 char)
,vertical_accuracy_value        varchar2(4000 char)
,vertical_accuracy_unit         varchar2(4000 char)
,nat_aqfr_name                  varchar2(4000 char)
,aqfr_name                      varchar2(4000 char)
,aqfr_type_name                 varchar2(4000 char)
,construction_date              varchar2(4000 char)
,well_depth_value               number
,well_depth_unit                varchar2(4000 char)
,hole_depth_value               number
,hole_depth_unit                varchar2(4000 char)
,huc_2                          generated always as (substr(huc_12,1,2))
,huc_4                          generated always as (substr(huc_12,1,4))
,huc_6                          generated always as (substr(huc_12,1,6))
,huc_8                          generated always as (substr(huc_12,1,8))
,huc_10                         generated always as (substr(huc_12,1,10))
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table station_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table pc_result_swap_stewards
(wqp_id 						number
,data_source_id					number
,data_source					varchar2(4000 char)
,station_id 					number
,site_id						varchar2(4000 char)
,event_date						date
,analytical_method				varchar2(4000 char)
,p_code							varchar2(4000 char)
,activity						varchar2(4000 char)
,characteristic_name			varchar2(4000 char)
,characteristic_type			varchar2(4000 char)
,sample_media					varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc_12							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,organization_name              varchar2(4000 char)
,activity_type_code             varchar2(4000 char)
,activity_media_subdiv_name     varchar2(4000 char)
,activity_start_time            varchar2(4000 char)
,act_start_time_zone            varchar2(4000 char)
,activity_stop_date             varchar2(4000 char)
,activity_stop_time             varchar2(4000 char)
,act_stop_time_zone             varchar2(4000 char)
,activity_depth                 varchar2(4000 char)
,activity_depth_unit            varchar2(4000 char)
,activity_depth_ref_point       varchar2(4000 char)
,activity_upper_depth           varchar2(4000 char)
,activity_upper_depth_unit      varchar2(4000 char)
,activity_lower_depth           varchar2(4000 char)
,activity_lower_depth_unit      varchar2(4000 char)
,activity_uprlwr_depth_ref_pt   varchar2(4000 char)
,project_id                     varchar2(4000 char)
,activity_conducting_org        varchar2(4000 char)
,activity_comment               varchar2(4000 char)
,sample_aqfr_name               varchar2(4000 char)
,hydrologic_condition_name      varchar2(4000 char)
,hydrologic_event_name          varchar2(4000 char)
,sample_collect_method_id       varchar2(4000 char)
,sample_collect_method_ctx      varchar2(4000 char)
,sample_collect_method_name     varchar2(4000 char)
,sample_collect_equip_name      varchar2(4000 char)
,result_id                      varchar2(4000 char)
,result_detection_condition_tx  varchar2(4000 char)
,sample_fraction_type           varchar2(4000 char)
,result_measure_value           varchar2(4000 char)
,result_unit                    varchar2(4000 char)
,result_meas_qual_code          varchar2(4000 char)
,result_value_status            varchar2(4000 char)
,statistic_type                 varchar2(4000 char)
,result_value_type              varchar2(4000 char)
,weight_basis_type              varchar2(4000 char)
,duration_basis                 varchar2(4000 char)
,temperature_basis_level        varchar2(4000 char)
,particle_size                  varchar2(4000 char)
,precision                      varchar2(4000 char)
,result_comment                 varchar2(4000 char)
,result_depth_meas_value        varchar2(4000 char)
,result_depth_meas_unit_code    varchar2(4000 char)
,result_depth_alt_ref_pt_txt    varchar2(4000 char)
,sample_tissue_taxonomic_name   varchar2(4000 char)
,sample_tissue_anatomy_name     varchar2(4000 char)
,analytical_procedure_id        varchar2(4000 char)
,analytical_procedure_source    varchar2(4000 char)
,analytical_method_name         varchar2(4000 char)
,analytical_method_citation     varchar2(4000 char)
,lab_name                       varchar2(4000 char)
,analysis_date_time             varchar2(4000 char)
,lab_remark                     varchar2(4000 char)
,myql                           varchar2(4000 char)
,myqlunits                      varchar2(4000 char)
,myqldesc                       varchar2(4000 char)
,analysis_prep_date_tx          varchar2(4000 char)
,huc_2                          generated always as (substr(huc_12,1,2))
,huc_4                          generated always as (substr(huc_12,1,4))
,huc_6                          generated always as (substr(huc_12,1,6))
,huc_8                          generated always as (substr(huc_12,1,8))
,huc_10                         generated always as (substr(huc_12,1,10))
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
(partition pc_result_stewards_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
 partition pc_result_stewards_y_maxx values less than (maxvalue)
);
--rollback drop table pc_result_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table station_sum_swap_stewards
(data_source_id					number
,data_source					varchar2(4000 char)
,station_id 					number
,site_id						varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc_12							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,geom							mdsys.sdo_geometry
,pc_result_count				number
,biological_result_count		number
,huc_2                          generated always as (substr(huc_12,1,2))
,huc_4                          generated always as (substr(huc_12,1,4))
,huc_6                          generated always as (substr(huc_12,1,6))
,huc_8                          generated always as (substr(huc_12,1,8))
,huc_10                         generated always as (substr(huc_12,1,10))
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
)
parallel 4 compress pctfree 0 nologging cache;
--rollback drop table station_sum_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table pc_result_sum_swap_stewards
(data_source_id                 number
,data_source                    varchar2(4000 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,analytical_method              varchar2(4000 char)
,p_code                         varchar2(4000 char)
,characteristic_name            varchar2(4000 char)
,characteristic_type            varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc_12                         varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,pc_result_count                number
,huc_2                          generated always as (substr(huc_12,1,2))
,huc_4                          generated always as (substr(huc_12,1,4))
,huc_6                          generated always as (substr(huc_12,1,6))
,huc_8                          generated always as (substr(huc_12,1,8))
,huc_10                         generated always as (substr(huc_12,1,10))
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
    (partition pc_result_sum_stewards_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
     partition pc_result_sum_stewards_y_maxx values less than (maxvalue)
    );
--rollback drop table pc_result_sum_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table pc_result_ct_sum_swap_stewards
(data_source_id					number
,data_source					varchar2(4000 char)
,station_id 					number
,site_id						varchar2(4000 char)
,analytical_method				varchar2(4000 char)
,p_code							varchar2(4000 char)
,characteristic_name			varchar2(4000 char)
,characteristic_type			varchar2(4000 char)
,sample_media					varchar2(4000 char)
,organization					varchar2(4000 char)
,site_type						varchar2(4000 char)
,huc_12							varchar2(12 char)
,governmental_unit_code			varchar2(9 char)
,pc_result_count				number
,huc_2                          generated always as (substr(huc_12,1,2))
,huc_4                          generated always as (substr(huc_12,1,4))
,huc_6                          generated always as (substr(huc_12,1,6))
,huc_8                          generated always as (substr(huc_12,1,8))
,huc_10                         generated always as (substr(huc_12,1,10))
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by list (characteristic_type)
    (partition pcrcts_stewards_biol values ('Biological'),
     partition pcrcts_stewards_info values ('Information'),
     partition pcrcts_stewards_inorg1 values ('Inorganics, Major, Metals'),
     partition pcrcts_stewards_inorg2 values ('Inorganics, Major, Non-metals'),
     partition pcrcts_stewards_inorg3 values ('Inorganics, Minor, Metals'),
     partition pcrcts_stewards_inorg4 values ('Inorganics, Minor, Non-metals'),
     partition pcrcts_stewards_micro values ('Microbiological'),
     partition pcrcts_stewards_na values ('Not Assigned'),
     partition pcrcts_stewards_nut values ('Nutrient'),
     partition pcrcts_stewards_org1 values ('Organics, Other'),
     partition pcrcts_stewards_org2 values ('Organics, PCBs'),
     partition pcrcts_stewards_org3 values ('Organics, Pesticide'),
     partition pcrcts_stewards_phys values ('Physical'),
     partition pcrcts_stewards_pop values ('Population/Community'),
     partition pcrcts_stewards_radio values ('Radiochemical'),
     partition pcrcts_stewards_sed values ('Sediment'),
     partition pcrcts_stewards_iso values ('Stable Isotopes'),
     partition pcrcts_stewards_tox values ('Toxicity'),
     partition pcrcts_stewards_def values (default)
);
--rollback drop table pc_result_ct_sum cascade constraints purge;


--changeset drsteini:1StewardsTables
create table pc_result_nr_sum_swap_stewards
(data_source_id					number
,data_source					varchar2(4000 char)
,station_id 					number
,event_date						date
,analytical_method				varchar2(4000 char)
,p_code							varchar2(4000 char)
,characteristic_name			varchar2(4000 char)
,characteristic_type			varchar2(4000 char)
,sample_media					varchar2(4000 char)
,pc_result_count				number
) parallel 4 compress pctfree 0 nologging cache
partition by range (event_date)
    (partition pc_res_nr_sum_stewards_p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
     partition pc_res_nr_sum_stewards_y_maxx values less than (maxvalue)
    );
--rollback drop table pc_result_nr_sum_swap_stewards cascade constraints purge;

    
--changeset drsteini:1StewardsTables
create table char_name_swap_stewards
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table char_name_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table char_type_swap_stewards
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table char_type_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table country_swap_stewards
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table country_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table county_swap_stewards
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
,country_code                   generated always as (regexp_substr(code_value, '[^:]+'))
,state_code                     generated always as (regexp_substr(code_value, '[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table county_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table sample_media_swap_stewards
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table sample_media_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table organization_swap_stewards
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table organization_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table site_type_swap_stewards
(data_source_id					number
,code_value						varchar2(500 char)
,description					varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table site_type_swap_stewards cascade constraints purge;


--changeset drsteini:1StewardsTables
create table state_swap_stewards
(data_source_id					number
,code_value						varchar2(500 char)
,description_with_country		varchar2(57 char)
,description_with_out_country	varchar2(53 char)
,country_code                   generated always as (regexp_substr(code_value, '[^:]+'))
) parallel 4 compress pctfree 0 nologging cache;
--rollback drop table state_swap_stewards cascade constraints purge;



