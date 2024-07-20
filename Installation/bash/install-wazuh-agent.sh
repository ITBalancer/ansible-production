#!/bin/bash

#Install the GPG key
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && chmod 644 /usr/share/keyrings/wazuh.gpg

#Add the repository
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list

#Update the package information
apt-get update

#Deploy wazuh agent
WAZUH_MANAGER="10.0.0.132" apt-get install wazuh-agent

#Enable and start the Wazuh agent service
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent