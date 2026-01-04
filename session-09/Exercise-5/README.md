IMPORTANT: Required Setup (Must Be Done Before Running the Script)

Before executing the script, the required directories, files, and permissions
MUST be created and configured. Skipping these steps will cause
"Permission denied" errors.

1. Create the backup directory
This directory is required before running the script.

sudo mkdir -p /var/log/passwd_backups
sudo chown $USER:$USER /var/log/passwd_backups


2. Ensure the adm group exists
Check that the adm group is present on the system.

sudo getent group adm


3. Create the log file BEFORE running the script
The log file must exist before permissions are applied.

sudo touch /var/log/passwd_script.log


4. Set group ownership and permissions on the log file
These permissions must be configured before running the script.

sudo chgrp adm /var/log/passwd_script.log
sudo chmod 664 /var/log/passwd_script.log


5. Add the user to the adm group
This allows the user to write to the log file.

sudo usermod -aG adm $USER

Log out and log back in, or apply the group immediately:
newgrp adm


6. Verify final permissions

ls -l /var/log/passwd_script.log

Expected output:
-rw-rw-r-- 1 root adm /var/log/passwd_script.log

The script MUST NOT be executed until all steps above are completed.


------------------------------------------------------------

Backup /etc/passwd Usernames and UIDs

Description
This Bash script creates a daily backup of selected fields from the
/etc/passwd file. It extracts the username and UID
(1st and 3rd fields) and saves them in a date-based file.

The script also removes backup files older than 2 days
and logs its execution.


Script File
Exercise-5.sh


What the Script Does
1. Uses /var/log/passwd_backups as the backup directory
2. Creates an output file based on the current date
3. Extracts username and UID from /etc/passwd
4. Saves the data to a backup file
5. Deletes backup files older than 2 days
6. Logs execution details to /var/log/passwd_script.log


Output Files

Backup files:
/var/log/passwd_backups/passwd_YYYY-MM-DD.txt

Log file:
/var/log/passwd_script.log


Requirements
- Linux operating system
- Bash shell
- Permission to read /etc/passwd
- Write permission to /var/log/passwd_backups
- Write permission to /var/log/passwd_script.log
- awk and find utilities


How to Run

Step 1: Give execute permission
chmod +x passwd_backup.sh

Step 2: Run the script
sudo ./passwd_backup.sh
or
sudo bash passwd_backup.sh


Example Output File Content
root 0
daemon 1
bin 2
sys 3
...


Log Example
2026-01-04 10:30:15: Script completed. Backup created:
/var/log/passwd_backups/passwd_2026-01-04.txt.
Old files cleaned.


Notes
- Backup files are stored in /var/log/passwd_backups
- Files older than 2 days are automatically removed
- Log entries are written to /var/log/passwd_script.log
- File naming is date-based for better organization

Optional: Run the Script Automatically Using Cron

To run the backup script automatically once per day, you can use cron.

1. Edit root's crontab:
sudo crontab -e

2. Add the following line to run the script every day at 01:00 AM:

0 1 * * * /full/path/to/passwd_backup.sh

Example:
0 1 * * * /usr/local/bin/passwd_backup.sh

3. Save and exit the editor.

