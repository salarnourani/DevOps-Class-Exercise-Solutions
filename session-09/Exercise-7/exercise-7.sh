#!/bin/bash

# Configuration
IP_FILE="ip_list.txt"
LOG_DIR="/var/log/ping_scanner"
LOG_FILE="${LOG_DIR}/ping_results_$(hostname)_$(date +%Y%m%d).log"

## --- Script Start ---

# Check if the IP file
if [ ! -f "$IP_FILE" ]; then
    # This error must be printed to console since the script failed to start
    echo "Error: IP list file '$IP_FILE' not found."
    echo "Please create a file named '$IP_FILE' with one IP/hostname per line."
    exit 1
fi

# Create log directory 
if [ ! -d "$LOG_DIR" ]; then
    # The user must run the setup part with sudo
    mkdir -p "$LOG_DIR"
    chown "$(whoami)":"$(whoami)" "$LOG_DIR"
    chmod 775 "$LOG_DIR"
fi

if [ ! -w "$LOG_DIR" ]; then
    echo "Error: Cannot write to log directory '$LOG_DIR'."
    echo "You might need to run this script using 'sudo ./exercise-7.sh' for setup."
    exit 1
fi

# Log start time
echo "--- Ping Test Started on $(date) ---" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

while IFS= read -r IP; do
    # Skip empty lines and comments
    if [[ -z "$IP" || "$IP" =~ ^# ]]; then
        continue
    fi

    # Log ping start
    echo "--- Pinging: $IP (2 packets, 4s timeout) ---" >> "$LOG_FILE"
    
    # Output is fully redirected to log file
    ping -c 2 -W 4 "$IP" 2>&1 >> "$LOG_FILE"
    
    echo "" >> "$LOG_FILE"

done < "$IP_FILE"

# Log finish time
echo "--- Ping Test Finished on $(date) ---" >> "$LOG_FILE"
# message printed to console
echo "Ping test complete. Logs saved silently to: $LOG_FILE"
