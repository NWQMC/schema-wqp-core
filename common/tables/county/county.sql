create table county
(data_source_id                 number
,code_value                     varchar2(500 char)
,description                    varchar2(4000 char)
,country_code                   generated always as (regexp_substr(code_value, '[^:]+'))
,state_code                     generated always as (regexp_substr(code_value, '[^:]+:[^:]+'))
) parallel 4 compress pctfree 0 nologging cache
partition by range (data_source_id)
(partition county_garbage values less than (maxvalue)
);
