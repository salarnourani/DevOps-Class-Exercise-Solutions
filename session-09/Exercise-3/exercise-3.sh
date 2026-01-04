#!/bin/bash

# Exercise 3: Check SSH access and copy /etc/passwd if accessible

DESTINATION_IP="192.168.88.111"
USERNAME="$USERNAME"
LOCAL_PATH="/etc/passwd"
DESTINATION_PATH="/home/$USERNAME"

if ping -c 1 -w 2 "$DESTINATION_IP" &> /dev/null; then
echo "server is reachable"

    scp -R "$LOCAL_PATH" "$USERNAME@$DESTINATION_IP:$DESTINATIO_PATH"    

    if [ $? -eq 0 ]; then
        echo "File Transferred Succeddfully."
    else
        echo "File Transfer Failed."
    fi
else
    echo "Server is not Reacheble."

fi
