Exercise 6 – Backup Home Directory on Logout

Description
This Bash script configures the system to automatically create a backup
of the user’s home directory every time the user logs out.

It works by adding a backup command to the user’s ~/.bash_logout file.
When the logout event occurs, the entire home directory is copied into
the /backup directory with a unique timestamped name.

The script is idempotent: it will not add duplicate backup commands if
it is executed multiple times.


Script File
exercise-6.sh


What the Script Does
1. Defines /backup as the backup directory
2. Creates /backup if it does not already exist
3. Sets owner, group, and secure permissions on /backup
4. Ensures ~/.bash_logout exists
5. Adds a logout backup command only if it is not already present
6. Copies the user’s home directory on each logout
7. Displays a success message after setup


Backup Location and File Naming
Backup directory:
$HOME → /backup

Backup folder format:
home_USERNAME_YYYYMMDD_HH-MM-SS

Example:
 /backup/home_alice_20260104_22-15-09


Requirements
- Linux operating system
- Bash shell
- sudo privileges (required to create /backup)
- Read permission to the user’s home directory
- Write permission to /backup


Setup and Usage

Step 1: Give execute permission to the script
chmod +x exercise6_backup_on_logout.sh

Step 2: Run the script
./exercise6_backup_on_logout.sh

You may be prompted for your sudo password when /backup is created.


How It Works (Logout Behavior)
- When the user logs out of the shell
- ~/.bash_logout is automatically executed by Bash
- The home directory is recursively copied to /backup
- A new timestamped backup folder is created for each logout


Verification
1. Log out from your current shell session
2. Log back in
3. Check the backup directory:

ls -l /backup

You should see a directory similar to:
home_USERNAME_YYYYMMDD_HH-MM-SS


Important Notes
- Each logout creates a full backup of the home directory
- Existing backups are never overwritten
- This may consume significant disk space for large home directories
- The script modifies ~/.bash_logout (user-level change)
- To disable the behavior, remove the added lines from ~/.bash_logout


Cleanup / Disable
To stop automatic backups on logout, edit the file:

vim ~/.bash_logout

And remove the lines:
# Exercise 6: backup home directory on logout
cp -r "$HOME" "/backup/home_$(whoami)_$(date +%Y%m%d_%H-%M-%S)"


Security Considerations
- /backup is protected with permission 700
- Only the owning user can access backed-up data
- Ensure sufficient disk space is available before use

