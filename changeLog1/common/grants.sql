--liquibase formatted sql

--This is for the wqp_core schema
 
--changeset drsteini:1GrantsAA
grant select on char_name to wqp_user;
--rollback revoke select on char_name from wqp_user;
 
--changeset drsteini:1GrantsAB
grant select on char_type to wqp_user;
--rollback revoke select on char_type from wqp_user;
 
--changeset drsteini:1GrantsAC
grant select on country to wqp_user;
--rollback revoke select on country from wqp_user;
 
--changeset drsteini:1GrantsAD
grant select on county to wqp_user;
--rollback revoke select on county from wqp_user;
 
--changeset drsteini:1GrantsAE
grant select on data_source to wqp_user;
--rollback revoke select on data_source from wqp_user;
 
--changeset drsteini:1GrantsAG
grant select on last_etl to wqp_user;
--rollback revoke select on last_etl from wqp_user;
 
--changeset drsteini:1GrantsAH
grant select on organization to wqp_user;
--rollback revoke select on organization from wqp_user;
 
--changeset drsteini:1GrantsAI
grant select on result to wqp_user;
--rollback revoke select on result from wqp_user;
 
--changeset drsteini:1GrantsAJ
grant select on result_ct_sum to wqp_user;
--rollback revoke select on result_ct_sum from wqp_user;
 
--changeset drsteini:1GrantsAK
grant select on result_nr_sum to wqp_user;
--rollback revoke select on result_nr_sum from wqp_user;
 
--changeset drsteini:1GrantsAL
grant select on result_sum to wqp_user;
--rollback revoke select on result_sum from wqp_user;
 
--changeset drsteini:1GrantsAN
grant select on qwportal_summary to wqp_user;
--rollback revoke select on qwportal_summary from wqp_user;
 
--changeset drsteini:1GrantsAO
grant select on sample_media to wqp_user;
--rollback revoke select on sample_media from wqp_user;
 
--changeset drsteini:1GrantsAP
grant select on site_type to wqp_user;
--rollback revoke select on site_type from wqp_user;
 
--changeset drsteini:1GrantsAQ
grant select on state to wqp_user;
--rollback revoke select on state from wqp_user;
 
--changeset drsteini:1GrantsAR
grant select on station to wqp_user;
--rollback revoke select on station from wqp_user;
 
--changeset drsteini:1GrantsAS
grant select on station_sum to wqp_user;
--rollback revoke select on station_sum from wqp_user;
 
--changeset drsteini:1GrantsAT
grant execute on log_helper to wqp_user;
--rollback revoke execute on log_helper from wqp_user;
 
--changeset drsteini:1GrantsAU
grant select on project to wqp_user;
--rollback revoke select on project from wqp_user;
 
--changeset drsteini:1GrantsAV
grant select on assemblage to wqp_user;
--rollback revoke select on assemblage from wqp_user;

--changeset drsteini:1GrantsAW
grant select on taxa_name to wqp_user;
--rollback revoke select on taxa_name from wqp_user;

--changeset drsteini:WQP-788-grant_select_project_dim_wqp_user
grant select on project_dim to wqp_user;
--rollback revoke select on project_dim from wqp_user;

--changeset drsteini:WQP-767-grant_select_states_wqp_user
grant select on states to wqp_user;
--rollback revoke select on states from wqp_user;

--changeset drsteini:WQP-788-grant_select_huc8_conus_hi_ak_pr_dis_wqp_user
grant select on huc8_conus_hi_ak_pr_dis to wqp_user;
--rollback revoke select on huc8_conus_hi_ak_pr_dis from wqp_user;

--changeset drsteini:WQP-788-grant_select_us_counties_dis_20121015_wqp_user
grant select on us_counties_dis_20121015 to wqp_user;
--rollback revoke select on us_counties_dis_20121015 from wqp_user;
