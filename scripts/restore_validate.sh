#!/bin/bash

# === Restore validation script ===
# Checks if latest backup exists and looks syntactically correct (basic check)

BACKUP_FILE="./backups/latest_pg_backup.sql"
LOG_FILE="./logs/restore_validation.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "🔍 Restore Validation – $TIMESTAMP" >> $LOG_FILE

if [[ ! -f "$BACKUP_FILE" ]]; then
    echo "❌ Backup file not found: $BACKUP_FILE" | tee -a $LOG_FILE
    exit 1
fi

# Simple sanity check – look for basic SQL structure
if grep -qEi "create|insert|copy|table" "$BACKUP_FILE"; then
    echo "✅ Backup seems to contain valid SQL structure" | tee -a $LOG_FILE
else
    echo "⚠️ Backup file does not contain expected SQL keywords!" | tee -a $LOG_FILE
fi

echo "-----------------------------" >> $LOG_FILE
