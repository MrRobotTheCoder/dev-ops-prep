#!/bin/bash
#
# Add the yum repo - Long Term Support Release:
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
#
# Add required dependencies for the jenkins package:
sudo yum install -y fontconfig java-21-openjdk
sudo yum install -y jenkins
sudo systemctl daemon-reload
# 
# Start Jenkins :
#
# enable the Jenkins service
sudo systemctl enable jenkins
#
# start the Jenkins service
sudo systemctl start jenkins
#
# check the status of the Jenkins service
sudo systemctl status jenkins
