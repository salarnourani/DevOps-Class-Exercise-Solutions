#!/bin/bash

BACKUP_DIR="/backup"

# Command that will run on logout
BACKUP_CMD='cp -r "$HOME" "/backup/home_$(whoami)_$(date +%Y%m%d_%H-%M-%S)"'

# Create /backup directory if it does not exist
if [ ! -d "$BACKUP_DIR" ]; then
    sudo mkdir -p "$BACKUP_DIR"
    sudo chown "$(whoami)":"$(whoami)" "$BACKUP_DIR"
    sudo chmod 700 "$BACKUP_DIR"
fi

# Ensure ~/.bash_logout exists
touch "$HOME/.bash_logout"

# Add backup command only if it is not already there
if ! grep -Fxq "$BACKUP_CMD" "$HOME/.bash_logout"; then
    echo "" >> "$HOME/.bash_logout"
    echo "# Auto backup on logout" >> "$HOME/.bash_logout"
    echo "$BACKUP_CMD" >> "$HOME/.bash_logout"
fi

echo "Setup complete. Backup will run on logout."

