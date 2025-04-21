#!/bin/bash

# === Restore Check Script v2 ===
# Checks if latest PostgreSQL and MySQL backups exist and are not empty
# Logs to file AND prints to terminal with colors

BACKUP_DIR="../backups"
LOG_FILE="./logs/restore_check.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "🔍 Restore Check – $TIMESTAMP" >> $LOG_FILE
echo "🔍 Restore Check – $TIMESTAMP"

# PostgreSQL
LATEST_PG=$(ls -t $BACKUP_DIR/*pg_backup*.sql 2>/dev/null | head -n 1)
if [[ -f "$LATEST_PG" && -s "$LATEST_PG" ]]; then
    echo "✅ PostgreSQL backup OK: $LATEST_PG" >> $LOG_FILE
    echo -e "${GREEN}✅ PostgreSQL backup OK:${NC} $LATEST_PG"
else
    echo "❌ PostgreSQL backup missing or empty!" >> $LOG_FILE
    echo -e "${RED}❌ PostgreSQL backup missing or empty!${NC}"
fi

# MySQL
LATEST_MYSQL=$(ls -t $BACKUP_DIR/*mysql_backup*.sql 2>/dev/null | head -n 1)
if [[ -f "$LATEST_MYSQL" && -s "$LATEST_MYSQL" ]]; then
    echo "✅ MySQL backup OK: $LATEST_MYSQL" >> $LOG_FILE
    echo -e "${GREEN}✅ MySQL backup OK:${NC} $LATEST_MYSQL"
else
    echo "❌ MySQL backup missing or empty!" >> $LOG_FILE
    echo -e "${RED}❌ MySQL backup missing or empty!${NC}"
fi

echo "-----------------------------" >> $LOG_FILE
echo "-----------------------------"
