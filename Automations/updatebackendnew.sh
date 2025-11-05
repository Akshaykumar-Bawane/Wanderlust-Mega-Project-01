#!/bin/bash

# Set the IP of the Target VM (where frontend runs)
target_vm_ip="192.168.1.101"

# Path to the backend .env file
file_to_find="../backend/.env.docker"

# Check if .env file exists
if [ -f "$file_to_find" ]; then
    echo "Updating FRONTEND_URL in $file_to_find..."
    sed -i -E "s|FRONTEND_URL=.*|FRONTEND_URL=\"http://${target_vm_ip}:5173\"|g" "$file_to_find"
    echo "✅ FRONTEND_URL updated successfully."
else
    echo "❌ ERROR: File not found at $file_to_find"
    exit 1
fi
