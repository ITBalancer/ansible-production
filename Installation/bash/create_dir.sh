bash
#!/bin/bash

# Define the directory path
DIR="/home/milutin/data"

# Function to create a directory
create_directory() {
    if [ -d "$DIR" ]; then
        echo "Directory '$DIR' already exists."
    else
        mkdir "$DIR"
        if [ $? -eq 0 ]; then
            echo "Directory '$DIR' created successfully."
        else
            echo "Failed to create directory '$DIR'. Please check your permissions."
        fi
    fi
}

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
else
    create_directory
fi