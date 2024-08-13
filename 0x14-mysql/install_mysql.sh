#!/usr/bin/env bash
# This script installs MySQL 5.7 on Ubuntu 16.04

# Update package index
sudo apt-get update

# Install MySQL 5.7
sudo apt-get install -y mysql-server-5.7

# Check MySQL version
mysql --version
