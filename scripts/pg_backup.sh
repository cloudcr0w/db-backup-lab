#!/bin/bash

# === PostgreSQL Backup Script with Encryption & S3 Upload ===
# Author: Adam Wrona

DB_NAME="exampledb"
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_${TIMESTAMP}.sql"
ENCRYPTED_FILE="${BACKUP_FILE}.gpg"
SYMLINK="$BACKUP_DIR/latest_pg_backup.sql.gpg"

# Use passphrase from env or fallback to default
PASSPHRASE="${GPG_PASSPHRASE:-supersecret}"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Dump the PostgreSQL database
echo "📦 Creating backup..."
pg_dump "$DB_NAME" > "$BACKUP_FILE"

# Encrypt the backup
echo "🔐 Encrypting backup..."
gpg --batch --yes --passphrase "$PASSPHRASE" -c "$BACKUP_FILE"

# Remove unencrypted file
rm "$BACKUP_FILE"

# Create or update symlink to latest encrypted backup
ln -sf "$(pwd)/$ENCRYPTED_FILE" "$SYMLINK"

# Upload encrypted file to S3
echo "☁️ Uploading to S3..."
aws s3 cp "$ENCRYPTED_FILE" s3://adam-db-backups-project/

echo "✅ Backup complete: $ENCRYPTED_FILE"
