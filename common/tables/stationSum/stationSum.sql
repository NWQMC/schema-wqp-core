create table station_sum
(data_source_id                 number
,data_source                    varchar2(8 char)
,station_id                     number
,site_id                        varchar2(4000 char)
,organization                   varchar2(4000 char)
,site_type                      varchar2(4000 char)
,huc                            varchar2(12 char)
,governmental_unit_code         varchar2(9 char)
,geom                           mdsys.sdo_geometry
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
,activity_count                 number
,summary_past_12_months         clob
,summary_past_60_months         clob
,summary_all_months             clob
,activity_count_past_12_months  number
,activity_count_past_60_months  number
,result_count_past_12_months    number
,result_count_past_60_months    number
,organization_name              varchar2(4000 char)
,station_name                   varchar2(4000 char)
,station_type_name              varchar2(4000 char)
,country_name                   varchar2(4000 char)
,state_name                     varchar2(57 char)
,county_name                    varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition station_sum_garbage values less than (maxvalue)
);
