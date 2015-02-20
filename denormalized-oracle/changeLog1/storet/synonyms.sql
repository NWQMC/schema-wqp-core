--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_district_cds_by_host for nwis_district_cds_by_host@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_district_cds_by_host;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_stage_state for state@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_stage_state;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_site_tp for site_tp@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_site_tp;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_misc_lookups for nwis_misc_lookups@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_misc_lookups;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_nat_aqfr for nat_aqfr@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_nat_aqfr;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_aqfr for aqfr@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_aqfr;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwq_stg_lu_tz for lu_tz@nwq_stg_dbstage;
--rollback drop synonym nwq_stg_lu_tz;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_fxd for fxd@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_fxd;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_tu for tu@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_tu;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_wqx_medium_cd for nwis_wqx_medium_cd@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_wqx_medium_cd;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_body_part for body_part@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_body_part;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwq_stg_lu_parm for lu_parm@nwq_stg_dbstage;
--rollback drop synonym nwq_stg_lu_parm;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwq_stg_lu_parm_seq_grp_cd for lu_parm_seq_grp_cd@nwq_stg_dbstage;
--rollback drop synonym nwq_stg_lu_parm_seq_grp_cd;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwq_stg_lu_parm_alias for lu_parm_alias@nwq_stg_dbstage;
--rollback drop synonym nwq_stg_lu_parm_alias;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwq_stg_lu_parm_meth for lu_parm_meth@nwq_stg_dbstage;
--rollback drop synonym nwq_stg_lu_parm_meth;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_proto_org for proto_org@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_proto_org;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_meth for meth@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_meth;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_wqx_rpt_lev_cd for nwis_wqx_rpt_lev_cd@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_wqx_rpt_lev_cd;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_val_qual_cd for val_qual_cd@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_val_qual_cd;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_hyd_event_cd for hyd_event_cd@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_hyd_event_cd;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_hyd_cond_cd for hyd_cond_cd@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_hyd_cond_cd;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_stage_county for county@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_stage_county;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_stage_country for country@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_stage_country;

--changeset drsteini:1NwisSynonyms
--create or replace synonym nwis_ws_stg_state_fips for state_fips@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_state_fips;

--changeset drsteini:1NwisSynonyms
create or replace synonym nwis_ws_stg_z_cit_meth for z_cit_meth@nwis_ws_stg_dbstage;
--rollback drop synonym nwis_ws_stg_z_cit_meth;

--changeset drsteini:1NwisSynonyms
create or replace synonym  for @nwis_ws_stg_dbstage;
--rollback drop synonym ;

--changeset drsteini:1NwisSynonyms
create or replace synonym  for @nwis_ws_stg_dbstage;
--rollback drop synonym ;

--changeset drsteini:1NwisSynonyms
create or replace synonym  for @nwis_ws_stg_dbstage;
--rollback drop synonym ;

--changeset drsteini:1NwisSynonyms
create or replace synonym  for @nwis_ws_stg_dbstage;
--rollback drop synonym ;

--changeset drsteini:1NwisSynonyms
create or replace synonym  for @nwis_ws_stg_dbstage;
--rollback drop synonym ;

--changeset drsteini:1NwisSynonyms
create or replace synonym  for @nwis_ws_stg_dbstage;
--rollback drop synonym ;


create synonym public_srsnames for public_srsnames_00000;
