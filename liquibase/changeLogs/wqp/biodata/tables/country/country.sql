create table country_swap_biodata
(data_source_id                 number
,code_value                     varchar2(500 char)
,description                    varchar2(4000 char)
) parallel 4 compress pctfree 0 nologging cache;
