.PHONY: backup restore-check restore-validate

backup:
	bash scripts/pg_backup.sh

restore-check:
	bash scripts/restore_check.sh

restore-validate:
	bash scripts/restore_validate.sh
