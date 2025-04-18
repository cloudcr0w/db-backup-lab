#!/bin/bash

# === MySQL Backup Script ===
# Author: Adam Wrona
# Description: Backs up a local MySQL database to ./backups

DB_NAME="exampledb"     # Change this
USER="root"             # Adjust user as needed
PASSWORD="yourpassword" # Set password or use .my.cnf for security
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p $BACKUP_DIR

mysqldump -u $USER -p$PASSWORD $DB_NAME > "$BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql"

echo "✅ Backup completed: ${DB_NAME}_backup_$TIMESTAMP.sql"
