# 🧪 Restore Testing Notes

## PostgreSQL

### Scenario: Restore from local backup

```bash
psql exampledb < backups/exampledb_backup_20250418.sql
```

✅ Restore successful – tested on 2025-04-18  
📝 TODO: Automate restore verification

---

## MySQL

### Scenario: Manual restore

```bash
mysql -u root -p exampledb < backups/exampledb_backup_20250418.sql
```

🕒 Restore scheduled for: 2025-04-19  
📝 TODO: Create script for automated restore check

---

## General Notes

- Backup files are stored in `./backups` with timestamp format  
- Manual restore tested with PostgreSQL  
- MySQL requires secure password handling (improvement needed)  
- Next steps: add cronjob, backup to S3, restore validation script
