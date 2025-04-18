#!/bin/bash

DB_NAME="exampledb"
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p $BACKUP_DIR
pg_dump $DB_NAME > "$BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql"

echo "Backup completed: ${DB_NAME}_backup_$TIMESTAMP.sql"
