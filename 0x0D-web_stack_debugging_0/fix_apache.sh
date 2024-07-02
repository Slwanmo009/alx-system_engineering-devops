#!/usr/bin/env bash
# This script installs and configures Apache to serve "Hello Holberton" on the root path

# Exit immediately if a command exits with a non-zero status
set -e

# Update package list
apt-get update

# Install Apache if not already installed
apt-get install -y apache2

# Create an index.html file with the desired content
echo "Hello Holberton" > /var/www/html/index.html

# Ensure Apache is started
service apache2 start
