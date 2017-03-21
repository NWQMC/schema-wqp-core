--liquibase formatted sql

--This is for the wqp_core schema

--changeset drsteini:WQP-916-grant-activity-to-wqp_user
grant select on activity to wqp_user;
--rollback revoke select on activity from wqp_user;

--changeset drsteini:WQP-916-grant-act_metric-to-wqp_user
grant select on act_metric to wqp_user;
--rollback revoke select on act_metric from wqp_user;

--changeset drsteini:WQP-1023-grant-activity_sum-to-wqp_user
grant select on activity_sum to wqp_user;
--rollback revoke select on activity_sum from wqp_user;

--changeset drsteini:WQP-1033.grant.r_detect_qnt_lmt.to.wqp_user
grant select on r_detect_qnt_lmt to wqp_user;
--rollback revoke select on r_detect_qnt_lmt from wqp_user;
