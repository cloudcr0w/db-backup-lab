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
scripts/
├── pg_backup.sh         # PostgreSQL backup script
├── mysql_backup.sh      # MySQL backup script

restore_tests/
└── sample_restore.md    # Notes & test scenarios

README.md                # Project overview and instructions
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
