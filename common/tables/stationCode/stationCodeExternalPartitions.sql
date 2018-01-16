alter table station_code split partition station_code_garbage into
(partition station_code_stewards values less than (2)
,partition station_code_nwis values less than (3)
,partition station_code_storet values less than (4)
,partition station_code_biodata values less than (5)
,partition station_code_garbage
);
