#!/bin/bash

# Variables
DATE=$(date +%A-%Y-%m-%d-%H-%M)
BACKUP=db-backup-$DATE.sql
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
#BUCKET_NAME=$4

# Debugging: Print environment details
echo "AWS CLI Version: $(aws --version)"
echo "Bucket Name: $BUCKET_NAME"
echo "AWS Region: $(aws configure get region)"
echo "AWS Credentials File: $(cat ~/.aws/credentials)"
echo "Current User: $(whoami)"
echo "PATH: $PATH"
echo "Backup File Path: /var/lib/jenkins/$BACKUP"
echo "Current Working Directory: $(pwd)"

# Change to the correct working directory
cd /var/lib/jenkins

# Backup the database
echo "Starting database backup..."
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /var/lib/jenkins/$BACKUP

if [ $? -ne 0 ]; then
    echo "Database backup failed!"
    exit 1
fi

echo "Database backup successful: $BACKUP"

# Upload to S3
echo "Uploading file: /var/lib/jenkins/$BACKUP to bucket: $BUCKET_NAME"
aws s3 cp "/var/lib/jenkins/$BACKUP" s3://jenkins-sql-abinash --region us-east-2

if [ $? -ne 0 ]; then
    echo "Failed to upload backup to S3."
    exit 1
fi

echo "Backup uploaded to S3 successfully."
