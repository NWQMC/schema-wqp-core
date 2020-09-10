#!/bin/bash 

# Restart postgres to make sure we can connect

psql ${WQP_DATABASE_NAME} -c "alter system set work_mem='32MB'"
pg_ctl -D "$PGDATA" -m fast -o "$LOCALONLY" -w restart