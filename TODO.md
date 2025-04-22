# 🧠 Project TODO – Database Backup Lab

A list of planned improvements and ideas for future development.

---

## ✅ Completed

- [x] Backup script for PostgreSQL
- [x] Backup script for MySQL
- [x] README documentation
- [x] Basic restore scenarios (manual)
- [x] Cronjob examples
- [x] Log directory and log files
- [x] Basic restore check script
- [x] Add restore validation script (check SQL syntax or integrity)
- [x] Push backup files to AWS S3 (using `aws s3 cp`)
- [x] Add timestamp symlink to latest backup
- [x] Encrypt backups before storing (e.g. with GPG or zip password)

---

## 🔜 In Progress / Planned

- [ ] Create automatic restore test with Docker DB container
- [ ] Implement email or Slack notification on backup failure
- [ ] Improve environment variable support for user/password
- [ ] Add Makefile or CLI wrapper for quick usage
- [ ] Add tests and CI pipeline for script linting
- [ ] Consider support for MongoDB / other engines (optional)

---

## 💬 Final thought

> "Some people wait for perfect conditions.  
> Others run the script and fix what's broken."

> „Jedni czekają, aż wszystko będzie idealne.  
> Drudzy odpalają skrypt i naprawiają po drodze.”

> author, unknown.  
> XD
