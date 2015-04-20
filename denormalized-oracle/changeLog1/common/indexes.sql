--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1CommonIndexesAA
create bitmap index station_country on station(country_code) local parallel 4 nologging;
--rollback drop index station_country;

--changeset drsteini:1CommonIndexesAB
create bitmap index station_county on station(county_code) local parallel 4 nologging;
--rollback drop index station_county;

--changeset drsteini:1CommonIndexesAC
insert into user_sdo_geom_metadata
values ('STATION', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION';

--changeset drsteini:1CommonIndexesAD
create index station_geom on station(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"') local;
--rollback drop index station_geom;

--changeset drsteini:1CommonIndexesAE
create bitmap index station_huc10 on station(huc_10) local parallel 4 nologging;
--rollback drop index station_huc10;

--changeset drsteini:1CommonIndexesAF
create bitmap index station_huc12 on station(huc_12) local parallel 4 nologging;
--rollback drop index station_huc12;

--changeset drsteini:1CommonIndexesAG
create bitmap index station_huc2 on station(huc_2) local parallel 4 nologging;
--rollback drop index station_huc2;

--changeset drsteini:1CommonIndexesAH
create bitmap index station_huc4 on station(huc_4) local parallel 4 nologging;
--rollback drop index station_huc4;

--changeset drsteini:1CommonIndexesAI
create bitmap index station_huc6 on station(huc_6) local parallel 4 nologging;
--rollback drop index station_huc6;

--changeset drsteini:1CommonIndexesAJ
create bitmap index station_huc8 on station(huc_8) local parallel 4 nologging;
--rollback drop index station_huc8;

--changeset drsteini:1CommonIndexesAK
create bitmap index station_organization on station(organization) local parallel 4 nologging;
--rollback drop index station_organization;

--changeset drsteini:1CommonIndexesAL
create unique index station_pk on station(data_source_id, station_id) local parallel 4 nologging;
--rollback drop index station_pk;

--changeset drsteini:1CommonIndexesAM
create bitmap index station_site on station(site_id) local parallel 4 nologging;
--rollback drop index station_site;

--changeset drsteini:1CommonIndexesAN
create bitmap index station_site_type on station(site_type) local parallel 4 nologging;
--rollback drop index station_site_type;

--changeset drsteini:1CommonIndexesAO
create bitmap index station_state on station(state_code) local parallel 4 nologging;
--rollback drop index station_state;

--changeset drsteini:1CommonIndexesAP
create bitmap index station_station on station(station_id) local parallel 4 nologging;
--rollback drop index station_station;




--changeset drsteini:1CommonIndexesAQ
create bitmap index pc_result_activity on pc_result(activity) local parallel 4 nologging;
--rollback drop index pc_result_activity;

--changeset drsteini:1CommonIndexesAR
create bitmap index pc_result_analytical on pc_result(analytical_method) local parallel 4 nologging;
--rollback drop index pc_result_analytical;

--changeset drsteini:1CommonIndexesAS
create bitmap index pc_result_char_name on pc_result(characteristic_name) local parallel 4 nologging;
--rollback drop index pc_result_char_name;

--changeset drsteini:1CommonIndexesAT
create bitmap index pc_result_char_type on pc_result(characteristic_type) local parallel 4 nologging;
--rollback drop index pc_result_char_type;

--changeset drsteini:1CommonIndexesAU
create bitmap index pc_result_country on pc_result(country_code) local parallel 4 nologging;
--rollback drop index pc_result_country;

--changeset drsteini:1CommonIndexesAV
create bitmap index pc_result_county on pc_result(county_code) local parallel 4 nologging;
--rollback drop index pc_result_county;

--changeset drsteini:1CommonIndexesAW
create bitmap index pc_result_event_date on pc_result(event_date) local parallel 4 nologging;
--rollback drop index pc_result_event_date;

--changeset drsteini:1CommonIndexesAX
create bitmap index pc_result_huc10 on pc_result(huc_10) local parallel 4 nologging;
--rollback drop index pc_result_huc10;

--changeset drsteini:1CommonIndexesAY
create bitmap index pc_result_huc12 on pc_result(huc_12) local parallel 4 nologging;
--rollback drop index pc_result_huc12;

--changeset drsteini:1CommonIndexesAZ
create bitmap index pc_result_huc2 on pc_result(huc_2) local parallel 4 nologging;
--rollback drop index pc_result_huc2;

--changeset drsteini:1CommonIndexesBA
create bitmap index pc_result_huc4 on pc_result(huc_4) local parallel 4 nologging;
--rollback drop index pc_result_huc4;

--changeset drsteini:1CommonIndexesBB
create bitmap index pc_result_huc6 on pc_result(huc_6) local parallel 4 nologging;
--rollback drop index pc_result_huc6;

--changeset drsteini:1CommonIndexesBC
create bitmap index pc_result_huc8 on pc_result(huc_8) local parallel 4 nologging;
--rollback drop index pc_result_huc8;

--changeset drsteini:1CommonIndexesBD
create bitmap index pc_result_organization on pc_result(organization) local parallel 4 nologging;
--rollback drop index pc_result_organization;

--changeset drsteini:1CommonIndexesBE
create bitmap index pc_result_p_code on pc_result(p_code) local parallel 4 nologging;
--rollback drop index pc_result_p_code;

--changeset drsteini:1CommonIndexesBF
create bitmap index pc_result_sample_media on pc_result(sample_media) local parallel 4 nologging;
--rollback drop index pc_result_sample_media;

--changeset drsteini:1CommonIndexesBG
create bitmap index pc_result_site on pc_result(site_id) local parallel 4 nologging;
--rollback drop index pc_result_site;

--changeset drsteini:1CommonIndexesBH
create bitmap index pc_result_site_type on pc_result(site_type) local parallel 4 nologging;
--rollback drop index pc_result_site_type;

--changeset drsteini:1CommonIndexesBI
create bitmap index pc_result_state on pc_result(state_code) local parallel 4 nologging;
--rollback drop index pc_result_state;

--changeset drsteini:1CommonIndexesBJ
create bitmap index pc_result_station on pc_result(station_id) local parallel 4 nologging;
--rollback drop index pc_result_station;




--changeset drsteini:1CommonIndexesBK
create bitmap index station_sum_county on station_sum(county_code) local parallel 4 nologging;
--rollback drop index station_sum_county;

--changeset drsteini:1CommonIndexesBL
insert into user_sdo_geom_metadata
values ('STATION_SUM', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -180, 180, 0.005), mdsys.sdo_dim_element('Y', -90, 90, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'STATION_SUM';

--changeset drsteini:1CommonIndexesBM
create index station_sum_geom on station_sum(geom) indextype is mdsys.spatial_index parameters ('SDO_INDX_DIMS=2 LAYER_GTYPE="POINT"') local;
--rollback drop index station_sum_geom;

--changeset drsteini:1CommonIndexesBN
create bitmap index station_sum_huc10 on station_sum(huc_10) local parallel 4 nologging;
--rollback drop index station_sum_huc10;

--changeset drsteini:1CommonIndexesBO
create bitmap index station_sum_huc12 on station_sum(huc_12) local parallel 4 nologging;
--rollback drop index station_sum_huc12;

--changeset drsteini:1CommonIndexesBP
create bitmap index station_sum_huc2 on station_sum(huc_2) local parallel 4 nologging;
--rollback drop index station_sum_huc2;

--changeset drsteini:1CommonIndexesBQ
create bitmap index station_sum_huc4 on station_sum(huc_4) local parallel 4 nologging;
--rollback drop index station_sum_huc4;

--changeset drsteini:1CommonIndexesBR
create bitmap index station_sum_huc6 on station_sum(huc_6) local parallel 4 nologging;
--rollback drop index station_sum_huc6;

--changeset drsteini:1CommonIndexesBS
create bitmap index station_sum_huc8 on station_sum(huc_8) local parallel 4 nologging;
--rollback drop index station_sum_huc8;

--changeset drsteini:1CommonIndexesBT
create bitmap index station_sum_organization on station_sum(organization) local parallel 4 nologging;
--rollback drop index station_sum_organization;

--changeset drsteini:1CommonIndexesBU
create unique index station_sum_pk on station_sum(data_source_id, station_id) local parallel 4 nologging;
--rollback drop index station_sum_pk;

--changeset drsteini:1CommonIndexesBV
create bitmap index station_sum_site on station_sum(site_id) local parallel 4 nologging;
--rollback drop index station_sum_site;

--changeset drsteini:1CommonIndexesBW
create bitmap index station_sum_site_type on station_sum(site_type) local parallel 4 nologging;
--rollback drop index station_sum_site_type;

--changeset drsteini:1CommonIndexesBX
create bitmap index station_sum_state on station_sum(state_code) local parallel 4 nologging;
--rollback drop index station_sum_state;

--changeset drsteini:1CommonIndexesBY
create bitmap index station_sum_station on station_sum(station_id) local parallel 4 nologging;
--rollback drop index station_sum_station;




--changeset drsteini:1CommonIndexesBZ
create bitmap index pc_result_sum_analytical on pc_result_sum(analytical_method) local parallel 4 nologging;
--rollback drop index pc_result_sum_analytical;

--changeset drsteini:1CommonIndexesCA
create bitmap index pc_result_sum_char_name on pc_result_sum(characteristic_name) local parallel 4 nologging;
--rollback drop index pc_result_sum_char_name;

--changeset drsteini:1CommonIndexesCB
create bitmap index pc_result_sum_char_type on pc_result_sum(characteristic_type) local parallel 4 nologging;
--rollback drop index pc_result_sum_char_type;

--changeset drsteini:1CommonIndexesCD
create bitmap index pc_result_sum_country on pc_result_sum(country_code) local parallel 4 nologging;
--rollback drop index pc_result_sum_country;

--changeset drsteini:1CommonIndexesCE
create bitmap index pc_result_sum_county on pc_result_sum(county_code) local parallel 4 nologging;
--rollback drop index pc_result_sum_county;

--changeset drsteini:1CommonIndexesCF
create bitmap index pc_result_sum_event_date on pc_result_sum(event_date) local parallel 4 nologging;
--rollback drop index pc_result_sum_event_date;

--changeset drsteini:1CommonIndexesCG
create bitmap index pc_result_sum_huc10 on pc_result_sum(huc_10) local parallel 4 nologging;
--rollback drop index pc_result_sum_huc10;

--changeset drsteini:1CommonIndexesCH
create bitmap index pc_result_sum_huc12 on pc_result_sum(huc_12) local parallel 4 nologging;
--rollback drop index pc_result_sum_huc12;

--changeset drsteini:1CommonIndexesCI
create bitmap index pc_result_sum_huc2 on pc_result_sum(huc_2) local parallel 4 nologging;
--rollback drop index pc_result_sum_huc2;

--changeset drsteini:1CommonIndexesCJ
create bitmap index pc_result_sum_huc4 on pc_result_sum(huc_4) local parallel 4 nologging;
--rollback drop index pc_result_sum_huc4;

--changeset drsteini:1CommonIndexesCK
create bitmap index pc_result_sum_huc6 on pc_result_sum(huc_6) local parallel 4 nologging;
--rollback drop index pc_result_sum_huc6;

--changeset drsteini:1CommonIndexesCL
create bitmap index pc_result_sum_huc8 on pc_result_sum(huc_8) local parallel 4 nologging;
--rollback drop index pc_result_sum_huc8;

--changeset drsteini:1CommonIndexesCM
create bitmap index pc_result_sum_organization on pc_result_sum(organization) local parallel 4 nologging;
--rollback drop index pc_result_sum_organization;

--changeset drsteini:1CommonIndexesCN
create bitmap index pc_result_sum_p_code on pc_result_sum(p_code) local parallel 4 nologging;
--rollback drop index pc_result_sum_p_code;

--changeset drsteini:1CommonIndexesCO
create bitmap index pc_result_sum_sample_media on pc_result_sum(sample_media) local parallel 4 nologging;
--rollback drop index pc_result_sum_sample_media;

--changeset drsteini:1CommonIndexesCP
create bitmap index pc_result_sum_site on pc_result_sum(site_id) local parallel 4 nologging;
--rollback drop index pc_result_sum_site;

--changeset drsteini:1CommonIndexesCQ
create bitmap index pc_result_sum_site_type on pc_result_sum(site_type) local parallel 4 nologging;
--rollback drop index pc_result_sum_site_type;

--changeset drsteini:1CommonIndexesCR
create bitmap index pc_result_sum_state on pc_result_sum(state_code) local parallel 4 nologging;
--rollback drop index pc_result_sum_state;

--changeset drsteini:1CommonIndexesCS
create bitmap index pc_result_sum_station on pc_result_sum(station_id) local parallel 4 nologging;
--rollback drop index pc_result_sum_station;




--changeset drsteini:1CommonIndexesCT
create bitmap index pc_result_ct_sum_analytical on pc_result_ct_sum(analytical_method) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_analytical;

--changeset drsteini:1CommonIndexesCU
create bitmap index pc_result_ct_sum_char_name on pc_result_ct_sum(characteristic_name) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_char_name;

--changeset drsteini:1CommonIndexesCV
create bitmap index pc_result_ct_sum_char_type on pc_result_ct_sum(characteristic_type) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_char_type;

--changeset drsteini:1CommonIndexesCW
create bitmap index pc_result_ct_sum_country on pc_result_ct_sum(country_code) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_country;

--changeset drsteini:1CommonIndexesCX
create bitmap index pc_result_ct_sum_county on pc_result_ct_sum(county_code) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_county;

--changeset drsteini:1CommonIndexesCY
create bitmap index pc_result_ct_sum_huc10 on pc_result_ct_sum(huc_10) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_huc10;

--changeset drsteini:1CommonIndexesCZ
create bitmap index pc_result_ct_sum_huc12 on pc_result_ct_sum(huc_12) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_huc12;

--changeset drsteini:1CommonIndexesDA
create bitmap index pc_result_ct_sum_huc2 on pc_result_ct_sum(huc_2) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_huc2;

--changeset drsteini:1CommonIndexesDB
create bitmap index pc_result_ct_sum_huc4 on pc_result_ct_sum(huc_4) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_huc4;

--changeset drsteini:1CommonIndexesDC
create bitmap index pc_result_ct_sum_huc6 on pc_result_ct_sum(huc_6) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_huc6;

--changeset drsteini:1CommonIndexesDD
create bitmap index pc_result_ct_sum_huc8 on pc_result_ct_sum(huc_8) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_huc8;

--changeset drsteini:1CommonIndexesDE
create bitmap index pc_result_ct_sum_organization on pc_result_ct_sum(organization) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_organization;

--changeset drsteini:1CommonIndexesDF
create bitmap index pc_result_ct_sum_p_code on pc_result_ct_sum(p_code) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_p_code;

--changeset drsteini:1CommonIndexesDG
create bitmap index pc_result_ct_sum_sample_media on pc_result_ct_sum(sample_media) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_sample_media;

--changeset drsteini:1CommonIndexesDH
create bitmap index pc_result_ct_sum_site on pc_result_ct_sum(site_id) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_site;

--changeset drsteini:1CommonIndexesDI
create bitmap index pc_result_ct_sum_site_type on pc_result_ct_sum(site_type) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_site_type;

--changeset drsteini:1CommonIndexesDJ
create bitmap index pc_result_ct_sum_state on pc_result_ct_sum(state_code) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_state;

--changeset drsteini:1CommonIndexesDK
create bitmap index pc_result_ct_sum_station on pc_result_ct_sum(station_id) local parallel 4 nologging;
--rollback drop index pc_result_ct_sum_station;




--changeset drsteini:1CommonIndexesDL
create bitmap index pc_result_nr_sum_analytical on pc_result_nr_sum(analytical_method) local parallel 4 nologging;
--rollback drop index pc_result_nr_sum_analytical;

--changeset drsteini:1CommonIndexesDM
create bitmap index pc_result_nr_sum_char_name on pc_result_nr_sum(characteristic_name) local parallel 4 nologging;
--rollback drop index pc_result_nr_sum_char_name;

--changeset drsteini:1CommonIndexesDN
create bitmap index pc_result_nr_sum_char_type on pc_result_nr_sum(characteristic_type) local parallel 4 nologging;
--rollback drop index pc_result_nr_sum_char_type;

--changeset drsteini:1CommonIndexesDO
create bitmap index pc_result_nr_sum_p_code on pc_result_nr_sum(p_code) local parallel 4 nologging;
--rollback drop index pc_result_nr_sum_p_code;

--changeset drsteini:1CommonIndexesDP
create bitmap index pc_result_nr_sum_sample_media on pc_result_nr_sum(sample_media) local parallel 4 nologging;
--rollback drop index pc_result_nr_sum_sample_media;

--changeset drsteini:1CommonIndexesDQ
create bitmap index pc_result_nr_sum_station on pc_result_nr_sum(station_id) local parallel 4 nologging;
--rollback drop index pc_result_nr_sum_station;




--changeset drsteini:1CommonIndexesDR
insert into user_sdo_geom_metadata
values ('COUNTY_GEOM_LOOKUP', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -179.231086, 179.859681, 0.005), mdsys.sdo_dim_element('Y', -14.601813, 71.441059, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'COUNTY_GEOM_LOOKUP';

--changeset drsteini:1CommonIndexesDS
create index county_geom_lookup_geom on county_geom_lookup(geom) indextype is mdsys.spatial_index parameters ('sdo_indx_dims=2 , layer_gtype=MULTIPOLYGON');
--rollback drop index county_geom_lookup_geom;

--changeset drsteini:1CommonIndexesDT
insert into user_sdo_geom_metadata
values ('HUC8_GEOM_LOOKUP', 'GEOM',
        mdsys.sdo_dim_array( mdsys.sdo_dim_element('X', -179.229655487448, 179.856674735386, 0.005), mdsys.sdo_dim_element('Y', -14.424695094277, 71.439572590153, 0.005)), 4269);
--rollback delete from user_sdo_geom_metadata where table_name = 'HUC8_GEOM_LOOKUP';

--changeset drsteini:1CommonIndexesDU
create index huc8_geom_lookup_geom on huc8_geom_lookup(geom) indextype is mdsys.spatial_index parameters ('sdo_indx_dims=2 , layer_gtype=MULTIPOLYGON');
--rollback drop index huc8_geom_lookup_geom;
