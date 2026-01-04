Exercise 7 – Ping Scanner with Logging

Prerequisites – Directory Creation and Permissions

Before running the script, the log directory must be created and proper
permissions must be set so the script can write log files.

Step 1: Create the log directory
sudo mkdir -p /var/log/ping_scanner

This directory stores all ping result log files.


Step 2: Set directory ownership
sudo chown root:adm /var/log/ping_scanner

- Owner: root
- Group: adm

The "adm" group is commonly used for system log access under /var/log.


Step 3: Set directory permissions
sudo chmod 775 /var/log/ping_scanner

Permission 775 means:
- Owner (root): read, write, execute
- Group (adm): read, write, execute
- Others: read and execute

This allows the script to create log files while keeping the directory secure.


Step 4: (Optional) Verify permissions
ls -ld /var/log/ping_scanner

Expected output example:
drwxrwxr-x  root adm  /var/log/ping_scanner


--------------------------------------------------

Script Information

This Bash script reads IP addresses or hostnames from a file and performs
ping tests on each one. All output is written silently to a daily log file.


Script File
exercise-7.sh


Required Input File

ip_list.txt

This file must exist in the same directory as the script and contain one
IP address or hostname per line.

Example:
8.8.8.8
1.1.1.1
google.com
# comment lines are ignored


Log File Location and Format

Log directory:
/var/log/ping_scanner

Log file name format:
ping_results_<hostname>_YYYYMMDD.log

Example:
ping_results_2020_20260104.log


What the Script Does

1. Checks if ip_list.txt exists
2. Creates the log directory if it does not exist
3. Verifies write permission to the log directory
4. Logs the start time
5. Pings each IP or hostname (2 packets, 4-second timeout)
6. Redirects all output to the log file
7. Logs the finish time


How to Run

Step 1: Make the script executable
chmod +x exercise-7.sh

Step 2: Run the script
./exercise-7.sh

If permission errors occur during setup:
sudo ./exercise-7.sh


Verification

List log files:
ls -l /var/log/ping_scanner

View a log file:
cat /var/log/ping_scanner/ping_results_<hostname>_YYYYMMDD.log


Notes

- Empty lines and lines starting with # in ip_list.txt are ignored
- The script does not print ping results to the console
- Logs are created once per day
- Safe to run multiple times


Troubleshooting

- Ensure ip_list.txt exists in the script directory
- Ensure /var/log/ping_scanner has correct permissions
- Use sudo if directory creation or write access fails

