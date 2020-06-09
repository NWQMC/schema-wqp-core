#!/bin/bash
# The set -e tells bash to exit immediately if a simple command fails.
# The set -o pipefail tells bash to set pipeline's return status to status of the last (rightmost) command.
# Both should be used in scripts meant to be called by Jenkins or another job runner.
set -e
set -o pipefail

${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE_WQP}/wqp/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${WQP_DATABASE_ADDRESS}:5432/${WQP_DATABASE_NAME} \
	--username=${WQP_SCHEMA_OWNER_USERNAME} \
	--password=${WQP_SCHEMA_OWNER_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug\
	--liquibaseCatalogName=${WQP_SCHEMA_NAME} \
	--liquibaseSchemaName=${WQP_SCHEMA_NAME} \
	update \
	-DWQP_SCHEMA_OWNER_USERNAME=${WQP_SCHEMA_OWNER_USERNAME} \
	-DWQP_SCHEMA_NAME=${WQP_SCHEMA_NAME} \
	-DWQP_READ_ONLY_USERNAME=${WQP_READ_ONLY_USERNAME} \
	-DNWIS_SCHEMA_OWNER_USERNAME=${NWIS_SCHEMA_OWNER_USERNAME} \
	-DNWIS_SCHEMA_OWNER_PASSWORD=${NWIS_SCHEMA_OWNER_PASSWORD}
