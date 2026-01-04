#!/bin/bash

# 1. Define the directory to save the files
BACKUP_DIR="/var/log/passwd_backups" 

# 2. Get today's date for the filename
TODAY=$(date +%Y-%m-%d)
OUTPUT_FILE="$BACKUP_DIR/passwd_$TODAY.txt"

# 3. Extract first and third fields from /etc/passwd
awk -F: '{print $1, $3}' /etc/passwd > "$OUTPUT_FILE"

# 4. Delete files older than 2 days
find "$BACKUP_DIR" -type f -name "passwd_fields_*.txt" -mtime +2 -delete

echo "$(date): Script completed. Backup created: $OUTPUT_FILE. Old files cleaned." >> /var/log/passwd_script.log

