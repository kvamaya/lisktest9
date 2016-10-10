#!/bin/bash

DB_NAME="lisk_test"
DB_DATA="$(pwd)/pgsql/data"
DB_LOG_FILE="$(pwd)/pgsql.log"

#start postgres
pg_ctl -D $DB_DATA -l $DB_LOG_FILE start
    sleep 1
    if [ $? != 0 ]; then
      echo "X Failed to start Postgresql."
      exit 1
    else
      echo "√ Postgresql started successfully."
    fi

#drop database
dropdb --if-exists "$DB_NAME"

#create database
createdb "$DB_NAME"
if [ $? != 0 ]; then
  echo "X Failed to create postgres database."
  exit 0
else
  echo "√ Postgres database created successfully."
fi

