--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-913-create-activity
create table activity
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,activity                       varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(4000 char)
,governmental_unit_code         varchar2(4000 char)
,organization_name              varchar2(4000 char)
,activity_id                    number
,activity_type_code             varchar2(4000 char)
,activity_media_subdiv_name     varchar2(4000 char)
,activity_start_time            varchar2(4000 char)
,act_start_time_zone            varchar2(4000 char)
,activity_stop_date             varchar2(4000 char)
,activity_stop_time             varchar2(4000 char)
,act_stop_time_zone             varchar2(4000 char)
,activity_relative_depth_name   varchar2(4000 char)
,activity_depth                 varchar2(4000 char)
,activity_depth_unit            varchar2(4000 char)
,activity_depth_ref_point       varchar2(4000 char)
,activity_upper_depth           varchar2(4000 char)
,activity_upper_depth_unit      varchar2(4000 char)
,activity_lower_depth           varchar2(4000 char)
,activity_lower_depth_unit      varchar2(4000 char)
,project_id                     varchar2(4000 char)
,activity_conducting_org        varchar2(4000 char)
,activity_comment               varchar2(4000 char)
,sample_aqfr_name               varchar2(4000 char)
,hydrologic_condition_name      varchar2(4000 char)
,hydrologic_event_name          varchar2(4000 char)
,activity_latitude              number
,activity_longitude             number
,activity_source_map_scale      number
,act_horizontal_accuracy        varchar2(4000 char)
,act_horizontal_accuracy_unit   varchar2(4000 char)
,act_horizontal_collect_method  varchar2(4000 char)
,act_horizontal_datum_name      varchar2(4000 char)
,assemblage_sampled_name        varchar2(4000 char)
,act_collection_duration        varchar2(4000 char)
,act_collection_duration_unit   varchar2(4000 char)
,act_sam_compnt_name            varchar2(4000 char)
,act_sam_compnt_place_in_series number
,act_reach_length               varchar2(4000 char)
,act_reach_length_unit          varchar2(4000 char)
,act_reach_width                varchar2(4000 char)
,act_reach_width_unit           varchar2(4000 char)
,act_pass_count                 number
,net_type_name                  varchar2(4000 char)
,act_net_surface_area           varchar2(4000 char)
,act_net_surface_area_unit      varchar2(4000 char)
,act_net_mesh_size              varchar2(4000 char)
,act_net_mesh_size_unit         varchar2(4000 char)
,act_boat_speed                 varchar2(4000 char)
,act_boat_speed_unit            varchar2(4000 char)
,act_current_speed              varchar2(4000 char)
,act_current_speed_unit         varchar2(4000 char)
,toxicity_test_type_name        varchar2(4000 char)
,sample_collect_method_id       varchar2(4000 char)
,sample_collect_method_ctx      varchar2(4000 char)
,sample_collect_method_name     varchar2(4000 char)
,act_sam_collect_meth_qual_type varchar2(4000 char)
,act_sam_collect_meth_desc      varchar2(4000 char)
,sample_collect_equip_name      varchar2(4000 char)
,act_sam_collect_equip_comments varchar2(4000 char)
,act_sam_prep_meth_id           varchar2(4000 char)
,act_sam_prep_meth_context      varchar2(4000 char)
,act_sam_prep_meth_name         varchar2(4000 char)
,act_sam_prep_meth_qual_type    varchar2(4000 char)
,act_sam_prep_meth_desc         varchar2(4000 char)
,sample_container_type          varchar2(4000 char)
,sample_container_color         varchar2(4000 char)
,act_sam_chemical_preservative  varchar2(4000 char)
,thermal_preservative_name      varchar2(4000 char)
,act_sam_transport_storage_desc varchar2(4000 char)
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
  subpartition by range (event_date)
  subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_maxx values less than (maxvalue) tablespace result2
    )
(partition activity_stewards values less than (2)
,partition activity_nwis values less than (3)
,partition activity_storet values less than (4)
,partition activity_biodata values less than (5)
,partition activity_garbage values less than (maxvalue)
);
--rollback drop table activity cascade constraints purge;


--changeset drsteini:WQP-913-create-act_metric
create table act_metric
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,activity                       varchar2(4000 char)
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(4000 char)
,governmental_unit_code         varchar2(4000 char)
,organization_name              varchar2(4000 char)
,activity_id                    number
,type_identifier                varchar2(4000 char)
,identifier_context             varchar2(4000 char)
,type_name                      varchar2(4000 char)
,resource_title                 varchar2(4000 char)
,resource_creator               varchar2(4000 char)
,resource_subject               varchar2(4000 char)
,resource_publisher             varchar2(4000 char)
,resource_date                  varchar2(4000 char)
,resource_identifier            varchar2(4000 char)
,type_scale                     varchar2(4000 char)
,formula_description            varchar2(4000 char)
,measure_value                  varchar2(4000 char)
,unit_code                      varchar2(4000 char)
,score                          varchar2(4000 char)
,comment_text                   varchar2(4000 char)
,index_identifier               varchar2(4000 char)
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
  subpartition by range (event_date)
  subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_maxx values less than (maxvalue) tablespace result2
    )
(partition act_metric_stewards values less than (2)
,partition act_metric_nwis values less than (3)
,partition act_metric_storet values less than (4)
,partition act_metric_biodata values less than (5)
,partition act_metric_garbage values less than (maxvalue)
);
--rollback drop table act_metric cascade constraints purge;

--changeset drsteini:WQP-932-create-activity_sum
create table activity_sum
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,event_date                     date
,sample_media                   varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,activity_id                    number
,project_id                     varchar2(4000 char)
,act_metric_count               number
,result_count                   number
,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
  subpartition by range (event_date)
  subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')),
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')),
     subpartition y_maxx values less than (maxvalue)
    )
(partition activity_sum_stewards values less than (2)
,partition activity_sum_nwis values less than (3)
,partition activity_sum_storet values less than (4)
,partition activity_sum_biodata values less than (5)
,partition activity_sum_garbage values less than (maxvalue)
);
--rollback drop table activity_sum cascade constraints purge;

--changeset drsteini:WQP-932-alter-result-activity_id
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_columns where table_name = 'RESULT' and column_name = 'ACTIVITY_ID'
alter table result add activity_id number;
--rollback select 'cannot rollback add on compressed table need manually drop table and re-create using changeset changeLog1/common/tables/drsteini:1CommonTablesAB and 1CommonTablesBH manually' from dual;

--changeset drsteini:WQP-932-drop-result_ct_sum
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select count(*) from user_tables where table_name = 'RESULT_CT_SUM'
drop table result_ct_sum cascade constraints purge;
--rollback create table result_ct_sum
--rollback (data_source_id                 number
--rollback ,data_source                    varchar2(8 char)
--rollback ,station_id                     number
--rollback ,site_id                        varchar2(4000 char)
--rollback ,analytical_method              varchar2(4000 char)
--rollback ,p_code                         varchar2(4000 char)
--rollback ,characteristic_name            varchar2(4000 char)
--rollback ,characteristic_type            varchar2(4000 char)
--rollback ,sample_media                   varchar2(4000 char)
--rollback ,organization                   varchar2(4000 char)
--rollback ,site_type                      varchar2(4000 char)
--rollback ,huc                            varchar2(12 char)
--rollback ,governmental_unit_code         varchar2(9 char)
--rollback ,project_id                     varchar2(4000 char)
--rollback ,assemblage_sampled_name        varchar2(4000 char)
--rollback ,result_count                   number
--rollback ,huc_2                          generated always as (case when length(huc) > 1 then substr(huc,1,2) else null end)
--rollback ,huc_4                          generated always as (case when length(huc) > 3 then substr(huc,1,4) else null end)
--rollback ,huc_6                          generated always as (case when length(huc) > 5 then substr(huc,1,6) else null end)
--rollback ,huc_8                          generated always as (case when length(huc) > 7 then substr(huc,1,8) else null end)
--rollback ,huc_10                         generated always as (case when length(huc) > 9 then substr(huc,1,10) else null end)
--rollback ,huc_12                         generated always as (case when length(huc) = 12 then substr(huc,1,12) else null end)
--rollback ,country_code                   generated always as (regexp_substr(governmental_unit_code, '[^:]+'))
--rollback ,state_code                     generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+'))
--rollback ,county_code                    generated always as (regexp_substr(governmental_unit_code, '[^:]+:[^:]+:[^:]+'))
--rollback ,sample_tissue_taxonomic_name   varchar2(4000 char)
--rollback ,constraint result_ct_sum_station_fk
--rollback    foreign key (data_source_id, station_id)
--rollback      references station_sum (data_source_id, station_id)
--rollback        rely enable novalidate
--rollback ) parallel 4 compress pctfree 0 nologging cache
--rollback partition by range (data_source_id)
--rollback   subpartition by list (characteristic_type)
--rollback   subpartition template
--rollback     (subpartition biol values ('Biological'),
--rollback      subpartition info values ('Information'),
--rollback      subpartition inorg1 values ('Inorganics, Major, Metals'),
--rollback      subpartition inorg2 values ('Inorganics, Major, Non-metals'),
--rollback      subpartition inorg3 values ('Inorganics, Minor, Metals'),
--rollback      subpartition inorg4 values ('Inorganics, Minor, Non-metals'),
--rollback      subpartition micro values ('Microbiological'),
--rollback      subpartition na values ('Not Assigned'),
--rollback      subpartition nut values ('Nutrient'),
--rollback      subpartition org1 values ('Organics, Other'),
--rollback      subpartition org2 values ('Organics, PCBs'),
--rollback      subpartition org3 values ('Organics, Pesticide'),
--rollback      subpartition phys values ('Physical'),
--rollback      subpartition pop values ('Population/Community'),
--rollback      subpartition radio values ('Radiochemical'),
--rollback      subpartition sed values ('Sediment'),
--rollback      subpartition iso values ('Stable Isotopes'),
--rollback      subpartition tox values ('Toxicity'),
--rollback      subpartition def values (default)
--rollback     )
--rollback (partition rcts_stewards values less than (2)
--rollback ,partition rcts_nwis values less than (3)
--rollback ,partition rcts_storet values less than (4)
--rollback ,partition rcts_biodata values less than (5)
--rollback ,partition rcts_garbage values less than (maxvalue)
--rollback );
--rollback create bitmap index result_ct_sum_analytical on result_ct_sum(analytical_method) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_assemblage on result_ct_sum(assemblage_sampled_name) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_char_name on result_ct_sum(characteristic_name) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_char_type on result_ct_sum(characteristic_type) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_country on result_ct_sum(country_code) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_county on result_ct_sum(county_code) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_huc10 on result_ct_sum(huc_10) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_huc12 on result_ct_sum(huc_12) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_huc2 on result_ct_sum(huc_2) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_huc4 on result_ct_sum(huc_4) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_huc6 on result_ct_sum(huc_6) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_huc8 on result_ct_sum(huc_8) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_organization on result_ct_sum(organization) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_project on result_ct_sum(project_id) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_p_code on result_ct_sum(p_code) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_sample_media on result_ct_sum(sample_media) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_site on result_ct_sum(site_id) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_site_type on result_ct_sum(site_type) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_state on result_ct_sum(state_code) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_station on result_ct_sum(station_id) local parallel 4 nologging;
--rollback create bitmap index result_ct_sum_taxa_name on result_ct_sum(sample_tissue_taxonomic_name) local parallel 4 nologging;
--rollback grant select on result_ct_sum to wqp_user;

--changeset drsteini:WQP-932-drop-result_nr_sum
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:1 select count(*) from user_tables where table_name = 'RESULT_NR_SUM'
drop table result_nr_sum cascade constraints purge;
--rollback create table result_nr_sum
--rollback (data_source_id                 number
--rollback ,data_source                    varchar2(8 char)
--rollback ,station_id                     number
--rollback ,event_date                     date
--rollback ,analytical_method              varchar2(4000 char)
--rollback ,p_code                         varchar2(4000 char)
--rollback ,characteristic_name            varchar2(4000 char)
--rollback ,characteristic_type            varchar2(4000 char)
--rollback ,sample_media                   varchar2(4000 char)
--rollback ,project_id                     varchar2(4000 char)
--rollback ,assemblage_sampled_name        varchar2(4000 char)
--rollback ,result_count                   number
--rollback ,sample_tissue_taxonomic_name   varchar2(4000 char)
--rollback ,constraint result_nr_sum_station_fk
--rollback    foreign key (data_source_id, station_id)
--rollback      references station_sum (data_source_id, station_id)
--rollback        rely enable novalidate
--rollback ) parallel 4 compress pctfree 0 nologging cache
--rollback partition by range (data_source_id)
--rollback   subpartition by range (event_date)
--rollback   subpartition template
--rollback     (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')),
--rollback      subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')),
--rollback      subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')),
--rollback      subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')),
--rollback      subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')),
--rollback      subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')),
--rollback      subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')),
--rollback      subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')),
--rollback      subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')),
--rollback      subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')),
--rollback      subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')),
--rollback      subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')),
--rollback      subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')),
--rollback      subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')),
--rollback      subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')),
--rollback      subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')),
--rollback      subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')),
--rollback      subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')),
--rollback      subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')),
--rollback      subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')),
--rollback      subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')),
--rollback      subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')),
--rollback      subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')),
--rollback      subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')),
--rollback      subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')),
--rollback      subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')),
--rollback      subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')),
--rollback      subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')),
--rollback      subpartition y_maxx values less than (maxvalue)
--rollback     )
--rollback (partition res_nr_sum_stewards values less than (2)
--rollback ,partition res_nr_sum_nwis values less than (3)
--rollback ,partition res_nr_sum_storet values less than (4)
--rollback ,partition res_nr_sum_biodata values less than (5)
--rollback ,partition res_nr_sum_garbage values less than (maxvalue)
--rollback );
--rollback create bitmap index result_nr_sum_analytical on result_nr_sum(analytical_method) local parallel 4 nologging;
--rollback create bitmap index result_nr_sum_assemblage on result_nr_sum(assemblage_sampled_name) local parallel 4 nologging;
--rollback create bitmap index result_nr_sum_char_name on result_nr_sum(characteristic_name) local parallel 4 nologging;
--rollback create bitmap index result_nr_sum_char_type on result_nr_sum(characteristic_type) local parallel 4 nologging;
--rollback create bitmap index result_nr_sum_project on result_nr_sum(project_id) local parallel 4 nologging;
--rollback create bitmap index result_nr_sum_p_code on result_nr_sum(p_code) local parallel 4 nologging;
--rollback create bitmap index result_nr_sum_sample_media on result_nr_sum(sample_media) local parallel 4 nologging;
--rollback create bitmap index result_nr_sum_station on result_nr_sum(station_id) local parallel 4 nologging;
--rollback create bitmap index result_nr_sum_taxa_name on result_nr_sum(sample_tissue_taxonomic_name) local parallel 4 nologging;
--rollback grant select on result_nr_sum to wqp_user;

--changeset drsteini:WQP-932-alter-result_sum-activity_id
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_columns where table_name = 'RESULT_SUM' and column_name = 'ACTIVITY_ID'
alter table result_sum add activity_id number;
--rollback select 'cannot rollback add on compressed table need manually drop table and re-create using changeset changeLog1/common/tables/drsteini:1CommonTablesAD, 1CommonTablesBK and 1CommonTablesBR manually' from dual;

--changeset drsteini:WQP-932-alter-station_sum-activity_count
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from user_tab_columns where table_name = 'STATION_SUM' and column_name = 'ACTIVITY_COUNT'
alter table station_sum add activity_count number;
--rollback select 'cannot rollback add on compressed table need manually drop table and re-create using changeset changeLog1/common/tables/drsteini:1CommonTablesAC manually' from dual;

--changeset drsteini:alter-result-subpartition-template-2017-2018
alter table result
  set subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_maxx values less than (maxvalue)
    );
--rollback alter table result
--rollback   set subpartition template
--rollback    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_maxx values less than (maxvalue)
--rollback    );

--changeset drsteini:alter-result_sum-subpartition-template-2017-2018
alter table result_sum
  set subpartition template
    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
     subpartition y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2,
     subpartition y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3,
     subpartition y_maxx values less than (maxvalue)
    );
--rollback alter table result_sum
--rollback   set subpartition template
--rollback    (subpartition p_1990 values less than (to_date('01-JAN-1990', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_1990 values less than (to_date('01-JAN-1991', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_1991 values less than (to_date('01-JAN-1992', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_1992 values less than (to_date('01-JAN-1993', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_1993 values less than (to_date('01-JAN-1994', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_1994 values less than (to_date('01-JAN-1995', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_1995 values less than (to_date('01-JAN-1996', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_1996 values less than (to_date('01-JAN-1997', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_1997 values less than (to_date('01-JAN-1998', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_1998 values less than (to_date('01-JAN-1999', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_1999 values less than (to_date('01-JAN-2000', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2000 values less than (to_date('01-JAN-2001', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_2001 values less than (to_date('01-JAN-2002', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_2002 values less than (to_date('01-JAN-2003', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_2003 values less than (to_date('01-JAN-2004', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2004 values less than (to_date('01-JAN-2005', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_2005 values less than (to_date('01-JAN-2006', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_2006 values less than (to_date('01-JAN-2007', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_2007 values less than (to_date('01-JAN-2008', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2008 values less than (to_date('01-JAN-2009', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_2009 values less than (to_date('01-JAN-2010', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_2010 values less than (to_date('01-JAN-2011', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_2011 values less than (to_date('01-JAN-2012', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2012 values less than (to_date('01-JAN-2013', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_2013 values less than (to_date('01-JAN-2014', 'DD-MON-YYYY')) tablespace result1,
--rollback     subpartition y_2014 values less than (to_date('01-JAN-2015', 'DD-MON-YYYY')) tablespace result2,
--rollback     subpartition y_2015 values less than (to_date('01-JAN-2016', 'DD-MON-YYYY')) tablespace result3,
--rollback     subpartition y_2016 values less than (to_date('01-JAN-2017', 'DD-MON-YYYY')) tablespace result4,
--rollback     subpartition y_maxx values less than (maxvalue)
--rollback    );

--changeset drsteini:alter-result-split-stewards-2017-2018
alter table result split subpartition result_stewards_y_maxx into 
(subpartition result_stewards_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_stewards_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_stewards_y_maxx);
--rollback alter table result merge subpartitions result_stewards_y_2017, result_stewards_y_2018, result_stewards_y_maxx into subpartition result_stewards_y_maxx;

--changeset drsteini:alter-result-split-nwis-2017-2018
alter table result split subpartition result_nwis_y_maxx into 
(subpartition result_nwis_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_nwis_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_nwis_y_maxx);
--rollback alter table result merge subpartitions result_nwis_y_2017, result_nwis_y_2018, result_nwis_y_maxx into subpartition result_nwis_y_maxx;

--changeset drsteini:alter-result-split-storet-2017-2018
alter table result split subpartition result_storet_y_maxx into 
(subpartition result_storet_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_storet_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_storet_y_maxx);
--rollback alter table result merge subpartitions result_storet_y_2017, result_storet_y_2018, result_storet_y_maxx into subpartition result_storet_y_maxx;

--changeset drsteini:alter-result-split-biodata-2017-2018
alter table result split subpartition result_biodata_y_maxx into 
(subpartition result_biodata_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_biodata_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_biodata_y_maxx);
--rollback alter table result merge subpartitions result_biodata_y_2017, result_biodata_y_2018, result_biodata_y_maxx into subpartition result_biodata_y_maxx;

--changeset drsteini:alter-result-split-garbage-2017-2018
alter table result split subpartition result_garbage_y_maxx into 
(subpartition result_garbage_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_garbage_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_garbage_y_maxx);
--rollback alter table result merge subpartitions result_garbage_y_2017, result_garbage_y_2018, result_garbage_y_maxx into subpartition result_garbage_y_maxx;

--changeset drsteini:alter-result_sum-split-stewards-2017-2018
alter table result_sum split subpartition result_sum_stewards_y_maxx into 
(subpartition result_sum_stewards_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_sum_stewards_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_sum_stewards_y_maxx);
--rollback alter table result_sum merge subpartitions result_sum_stewards_y_2017, result_sum_stewards_y_2018, result_sum_stewards_y_maxx into subpartition result_sum_stewards_y_maxx;

--changeset drsteini:alter-result_sum-split-nwis-2017-2018
alter table result_sum split subpartition result_sum_nwis_y_maxx into 
(subpartition result_sum_nwis_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_sum_nwis_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_sum_nwis_y_maxx);
--rollback alter table result_sum merge subpartitions result_sum_nwis_y_2017, result_sum_nwis_y_2018, result_sum_nwis_y_maxx into subpartition result_sum_nwis_y_maxx;

--changeset drsteini:alter-result_sum-split-storet-2017-2018
alter table result_sum split subpartition result_sum_storet_y_maxx into 
(subpartition result_sum_storet_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_sum_storet_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_sum_storet_y_maxx);
--rollback alter table result_sum merge subpartitions result_sum_storet_y_2017, result_sum_storet_y_2018, result_sum_storet_y_maxx into subpartition result_sum_storet_y_maxx;

--changeset drsteini:alter-result_sum-split-biodata-2017-2018
alter table result_sum split subpartition result_sum_biodata_y_maxx into 
(subpartition result_sum_biodata_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_sum_biodata_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_sum_biodata_y_maxx);
--rollback alter table result_sum merge subpartitions result_sum_biodata_y_2017, result_sum_biodata_y_2018, result_sum_biodata_y_maxx into subpartition result_sum_biodata_y_maxx;

--changeset drsteini:alter-result_sum-split-garbage-2017-2018
alter table result_sum split subpartition result_sum_garbage_y_maxx into 
(subpartition result_sum_garbage_y_2017 values less than (to_date('01-JAN-2018', 'DD-MON-YYYY')) tablespace result2
,subpartition result_sum_garbage_y_2018 values less than (to_date('01-JAN-2019', 'DD-MON-YYYY')) tablespace result3
,subpartition result_sum_garbage_y_maxx);
--rollback alter table result_sum merge subpartitions result_sum_garbage_y_2017, result_sum_garbage_y_2018, result_sum_garbage_y_maxx into subpartition result_sum_garbage_y_maxx;
