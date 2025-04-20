#!/bin/bash

# === Basic restore check script ===
# Checks if latest PostgreSQL and MySQL backups exist and are not empty

BACKUP_DIR="../backups"
LOG_FILE="./logs/restore_check.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "🔍 Restore Check – $TIMESTAMP" >> $LOG_FILE

# Check PostgreSQL backup
LATEST_PG=$(ls -t $BACKUP_DIR/*pg_backup*.sql 2>/dev/null | head -n 1)
if [[ -f "$LATEST_PG" && -s "$LATEST_PG" ]]; then
    echo "✅ PostgreSQL backup OK: $LATEST_PG" >> $LOG_FILE
else
    echo "❌ PostgreSQL backup missing or empty!" >> $LOG_FILE
fi

# Check MySQL backup
LATEST_MYSQL=$(ls -t $BACKUP_DIR/*mysql_backup*.sql 2>/dev/null | head -n 1)
if [[ -f "$LATEST_MYSQL" && -s "$LATEST_MYSQL" ]]; then
    echo "✅ MySQL backup OK: $LATEST_MYSQL" >> $LOG_FILE
else
    echo "❌ MySQL backup missing or empty!" >> $LOG_FILE
fi

echo "-----------------------------" >> $LOG_FILE
