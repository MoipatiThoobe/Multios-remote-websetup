#!/bin/bash

set -e  # Exit on error

#######################################
# Variables
#######################################
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
TEMP_DIR="/tmp/webfiles"
WEB_ROOT="/var/www/html"

#######################################
# Logging Function
#######################################
log() {
    echo -e "\n########################################"
    echo -e "$1"
    echo -e "########################################"
}

#######################################
# Detect OS
#######################################
detect_os() {
    if command -v yum &> /dev/null; then
        PKG_MANAGER="yum"
        PACKAGE="httpd wget unzip"
        SERVICE="httpd"
    elif command -v apt &> /dev/null; then
        PKG_MANAGER="apt"
        PACKAGE="apache2 wget unzip"
        SERVICE="apache2"
    else
        echo "Unsupported OS"
        exit 1
    fi
}

#######################################
# Install Packages
#######################################
install_packages() {
    log "Installing packages"

    if [ "$PKG_MANAGER" == "yum" ]; then
        sudo yum install -y $PACKAGE
    else
        sudo apt update -y
        sudo apt install -y $PACKAGE
    fi
}

#######################################
# Start & Enable Service
#######################################
manage_service() {
    log "Starting and enabling service"

    sudo systemctl start $SERVICE
    sudo systemctl enable $SERVICE
}

#######################################
# Deploy Application
#######################################
deploy_app() {
    log "Deploying application"

    mkdir -p $TEMP_DIR
    cd $TEMP_DIR

    wget -q $URL
    unzip -q "${ART_NAME}.zip"

    sudo cp -r ${ART_NAME}/* $WEB_ROOT/
}

#######################################
# Restart Service
#######################################
restart_service() {
    log "Restarting service"
    sudo systemctl restart $SERVICE
}

#######################################
# Cleanup
#######################################
cleanup() {
    log "Cleaning up temporary files"
    rm -rf $TEMP_DIR
}

#######################################
# Verify Deployment
#######################################
verify() {
    log "Verifying deployment"

    sudo systemctl status $SERVICE --no-pager
    ls -l $WEB_ROOT
}

#######################################
# Main Execution
#######################################
main() {
    detect_os
    install_packages
    manage_service
    deploy_app
    restart_service
    cleanup
    verify
}

main