alter table station_code split partition station_code_garbage into
(partition station_code_nwis values less than (2)
,partition station_code_garbage
);
