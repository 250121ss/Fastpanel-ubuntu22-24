#!/bin/bash

# Update package lists
echo -e "\e[32mUpdating package lists...\e[0m"
apt-get update

# Install wget
echo -e "\e[32mInstalling wget...\e[0m"
apt-get install -y wget

# Disable SELinux
echo -e "\e[32mDisabling SELinux...\e[0m"
SELINUX_CONFIG="/etc/selinux/config"

if [ -f "$SELINUX_CONFIG" ]; then
    sed -i 's/^SELINUX=.*/SELINUX=disabled/' "$SELINUX_CONFIG"
    echo -e "\e[32mSELinux has been disabled in the configuration file.\e[0m"
else
    echo -e "\e[31mSELinux configuration file not found at $SELINUX_CONFIG.\e[0m"
    echo -e "\e[32mCreating a new SELinux configuration file with SELINUX=disabled.\e[0m"
    echo -e "SELINUX=disabled\nSELINUXTYPE=targeted" > "$SELINUX_CONFIG"
fi

# Install FastPanel
echo -e "\e[32mInstalling FastPanel...\e[0m"
wget http://repo.fastpanel.direct/install_fastpanel.sh -O - | bash -

# Print completion message with FastPanel URL
echo -e "\e[32mFastPanel installation complete. Access it at https://your_server_ip:8888\e[0m"

# Prompt the user to reboot for changes to take effect
echo -e "\e[33mPlease reboot your system for the SELinux changes to take effect.\e[0m"

# Print YouTube channel link
echo -e "\e[34mYouTube: https://www.youtube.com/@linuxnetworkinghelp\e[0m"
