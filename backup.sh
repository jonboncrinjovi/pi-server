#!/bin/sh
# exit immediately if any command fails, so a broken dump never looks like a success
set -e

BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

cd "$HOME/book-delivery-app"

# run pg_dump inside the db container, compress the output, save with today's date
# -T: no interactive terminal, required when cron runs it 
docker compose exec -T db pg_dump -U app books | gzip > "$BACKUP_DIR/books-$(date +%F).sql.gz"

find "$BACKUP_DIR" -name 'books-*.sql.gz' -mtime +14 -delete
