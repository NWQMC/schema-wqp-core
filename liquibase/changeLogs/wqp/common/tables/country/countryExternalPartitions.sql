alter table country split partition country_garbage into
(partition country_stewards values less than (2)
,partition country_nwis values less than (3)
,partition country_storet values less than (4)
,partition country_biodata values less than (5)
,partition country_garbage
);
