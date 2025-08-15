#!/bin/bash

# Coments
echo "Linux Fundamentals Exercise 2 - Apache Web Server Setup"
date

# Update the package list
echo "Updating package list..."
sudo apt-get update

# Install Apache2
echo "Installing Apache2..."
sudo apt-get install -y apache2

# Start Apache2 service
echo "Starting Apache2 service..."
sudo systemctl enable  apache2
sudo systemctl start apache2

# Download unzip utility
echo "Installing unzip utility..."
sudo apt-get install -y unzip

sudo apt upgrade -y

cd /home
# Create a directory for the web server files
echo "Creating directory for web server files..."
sudo mkdir Downloads
cd Downloads

# Receive a URL as a parameter and download the file
if [ -z "$1" ]; then
  echo "Please provide the github author and web project name to download."
  #exit 1
fi
echo "Downloading file from author $1 and project name: $2"

AUTHOR="$1"
PROJECT="$2"
URL="https://github.com/$AUTHOR/$PROJECT/archive/refs/heads/main.zip"
ZIP="$2-main.zip"
DIR="$2-main"

sudo wget -O $ZIP $URL
# Unzip the downloaded file
sudo unzip $ZIP

# Move the extracted files to the Apache web server directory
echo "Moving extracted files to Apache web server directory..."
sudo mv $DIR/* /var/www/html/

cd /
# Set permissions for the web server directory
echo "Setting permissions for the web server directory..."
sudo groupadd SYSTEM_OWNER
sudo chown :SYSTEM_OWNER /var/www/html/
sudo chmod 775 /var/www/html/ -R
sudo systemctl restart apache2

echo "Apache web server setup completed successfully!"



