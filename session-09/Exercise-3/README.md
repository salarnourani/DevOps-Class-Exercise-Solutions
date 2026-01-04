# Exercise 3 – Check SSH Access and Copy /etc/passwd

## Description
This Bash script checks whether a remote server is reachable via the network.
If the server is reachable, the script attempts to copy the `/etc/passwd` file
to the remote system using SSH (scp).

## Script File
exercise-3.sh

## How It Works
1. The script pings the destination server to check network connectivity.
2. If the server is reachable, it tries to copy `/etc/passwd` to the user's home
   directory on the remote server.
3. The script checks the exit status of the `scp` command.
4. A success or failure message is displayed based on the result.

## Requirements
- SSH access to the destination server
- SSH key-based authentication or password access
- Network connectivity to the destination IP
- Permission to read `/etc/passwd`

## Variables Used
- `DESTINATION_IP` : IP address of the remote server
- `USERNAME` : Remote system username (taken from environment variable)
- `LOCAL_PATH` : Local file path (`/etc/passwd`)
- `DESTINATION_PATH` : Target directory on the remote server

## How to Run

### Step 1: Give execute permission
chmod +x exercise-3.sh

### Step 2: Run the script
./exercise-3.sh

or

bash exercise-3.sh

## Example Output
server is reachable  
File Transferred Successfully.

## Notes
- The script assumes the `USERNAME` environment variable is already set.
- SSH access must be properly configured on the destination server.
- The `/etc/passwd` file is public-readable on most Linux systems.

