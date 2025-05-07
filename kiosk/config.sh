#! /bin/bash

# Add kiosk-user 
useradd -m kioskuser 

# Install required packages
sudo apt install \
	vim \
	xorg \
	openbox \
	lightdm \
	chromium

# Configure autologin
sudo echo "[SeatDefaults]
autologin-user=kiosk-user
user-session=openbox
" > /etc/lightdm/lightdm.conf

# Create directories and set permissions
sudo mkdir -p /home/kiosk-user/.config/openbox
sudo chown -R kiosk-user:kiosk-user /home/kiosk-user/.config

# Create sym link of the autostart script
ln -s /home/kiosk-user/kiosk/autostart /home/kiosk-user/.config/openbox/autostart

# Make sure the script is executable
sudo chmod +x /home/kiosk-user/.config/openbox/autostart
