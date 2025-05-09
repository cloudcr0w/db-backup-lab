# 🛡️ Database Backup Lab (WIP)

This project explores backup and restore strategies for PostgreSQL and MySQL databases, both in local and cloud-hosted environments (e.g., AWS RDS). It simulates simple disaster recovery workflows using native tools like `pg_dump` and `mysqldump`.

---

## 🎯 Goals

- Automate scheduled backups using Bash scripting  
- Test backup integrity and simulate restore procedures  
- Document real-world scenarios for RDS and local databases  
- Explore monitoring and alerting around backup processes  

---

## 🧰 Tools

- PostgreSQL, MySQL  
- pg_dump, mysqldump  
- Bash  
- AWS RDS *(optional)*  

---

## 📁 Project Structure

```
.
├── Makefile
├── README.md
├── TODO.md
├── backups
│   ├── ...
├── cron-example.txt
├── logs
│   ├── restore_check.log
│   └── restore_validation.log
└── scripts
    ├── mysql_backup.sh
    ├── pg_backup.sh
    ├── restore_check.sh
    ├── restore_docker_test.sh
    └── restore_validate.sh
```

---

## 🚀 Usage

### PostgreSQL
```bash
bash scripts/pg_backup.sh
```

### MySQL
```bash
bash scripts/mysql_backup.sh
```

⚠️ Make sure your DB credentials and host access are correctly configured.

---
---

## 🔐 Backup Encryption (GPG)

Before uploading backups to S3, the PostgreSQL dump is encrypted using symmetric GPG encryption.

### How it works

- GPG uses a passphrase (currently hardcoded for demo purposes)
- The resulting file `exampledb_backup_YYYYMMDD.sql.gpg` is sent to S3
- The unencrypted `.sql` file is removed after encryption

### Decryption example

```bash
gpg --output decrypted.sql --decrypt backups/exampledb_backup_YYYYMMDD.sql.gpg
```
💡 In production, the passphrase should be stored securely (e.g. in environment variable or AWS Secrets Manager)

## 🔁 Automation with cron

To schedule daily backups automatically, see the `cron-example.txt` file:

```bash
cat cron-example.txt
```

Example:
```bash
0 2 * * * /bin/bash /home/adam/projekty/Database/scripts/pg_backup.sh
```

You can also redirect output to a log file:
```bash
0 2 * * * /bin/bash /home/adam/projekty/Database/scripts/pg_backup.sh >> /home/adam/projekty/Database/logs/pg_backup.log 2>&1
```
---

## ☁️ Upload Backups to AWS S3

The PostgreSQL backup script includes automatic upload to an AWS S3 bucket using the AWS CLI.

Make sure you have:

- Installed and configured AWS CLI (`aws configure`)
- An accessible S3 bucket (e.g. `adam-db-backups`)


---

## 🔗 Symlink to Latest Backup

Each time a PostgreSQL backup is created, a symbolic link `latest_pg_backup.sql` is updated to always point to the most recent backup file.

This allows easier referencing in restore or validation scripts.

```bash
psql exampledb < backups/latest_pg_backup.sql
```

---

## 🔐 Backup Encryption

Before uploading to S3, the PostgreSQL backup file is encrypted using GPG symmetric encryption.

```bash
gpg --symmetric --cipher-algo AES256 <file>
```
Passphrase is provided in the script (insecure – for testing only).

The result is a .sql.gpg file, which is then uploaded to S3.

To decrypt:
```bash
gpg --output decrypted.sql --decrypt exampledb_backup_xxx.sql.gpg
```

### Example

```bash
# Inside pg_backup.sh
aws s3 cp ./backups/exampledb_backup_20250401.sql s3://adam-db-backups/
```
The file will be uploaded to your S3 bucket after each backup is completed.

---

## 🧪 Restore Check Script

A helper script to validate that the latest PostgreSQL and MySQL backups:

- Exist
- Are not empty
- Are logged to a file (`logs/restore_check.log`)
- And are printed to terminal with color-coded status ✅ ❌

### Run manually:

```bash
bash scripts/restore_check.sh
```
Output:

Green ✅ means backup exists and is valid

Red ❌ means file is missing or empty

Both statuses are also logged with timestamps in logs/restore_check.log
---

## 🧪 Restore Testing

Check `restore_tests/sample_restore.md` for notes on recovery testing and restore commands.

---

## 🔜 Coming Soon

- Scheduled backups (via cron)  
- Backup to AWS S3  
- Restore validation scripts  
- Monitoring and alerting  

---

## 👨‍💻 Author

Adam Wrona – [cloudcr0w](https://github.com/cloudcr0w)  
[LinkedIn](https://www.linkedin.com/in/adam-wrona-111ba728b/)
