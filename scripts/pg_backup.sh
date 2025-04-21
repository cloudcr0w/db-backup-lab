#!/bin/bash

# === PostgreSQL Backup Script ===
# Author: Adam Wrona
# Description: Backs up a local PostgreSQL database to ./backups

DB_NAME="exampledb"  # Change this to your database name
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Run pg_dump and save output with timestamp
pg_dump $DB_NAME > "$BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql"

echo "✅ Backup completed: ${DB_NAME}_backup_$TIMESTAMP.sql"

# Upload to S3
aws s3 cp "$BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql" s3://adam-db-backups/
