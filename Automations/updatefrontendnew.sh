##!/bin/bash

# Set the IP of the Target VM (where backend runs)
target_vm_ip="192.168.1.101"

# Path to the frontend .env file
file_to_find="../frontend/.env.docker"

# Check if .env file exists
if [ -f "$file_to_find" ]; then
    echo "Updating BACKEND_URL in $file_to_find..."
    sed -i -E "s|VITE_BACKEND_URL=.*|VITE_BACKEND_URL=\"http://${target_vm_ip}:8080\"|g" "$file_to_find"
    echo "✅ BACKEND_URL updated successfully."
else
    echo "❌ ERROR: File not found at $file_to_find"
    exit 1
fi
