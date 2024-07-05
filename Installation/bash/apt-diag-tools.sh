#!/bin/bash

# Update package lists
sudo apt update

sudo apt install -y software-properties-common
sudo apt install -y dialog apt-utils 
sudo apt --fix-broken install

# Install common diagnostic tools
sudo apt install -y htop         # Interactive system-monitor process-viewer
sudo apt install -y iotop        # Displays active I/O usage by process
sudo apt install -y iftop        # Displays bandwidth usage on network interfaces
sudo apt install -y nload        # Monitors network traffic and bandwidth usage
sudo apt install -y sysstat      # Collection of performance monitoring tools (e.g., sar, iostat)
sudo apt install -y net-tools    # Collection of network debugging tools (e.g., netstat, ifconfig)
sudo apt install -y iputils-ping # Ping utility to test network connectivity
sudo apt install -y traceroute   # Traces the route taken by packets over an IP network
sudo apt install -y qemu-guest-agent #install agent for proxmox

sudo systemctl enable qemu-guest-agent
sudo systemctl start qemu-guest-agent
# Additional tools for diagnostic purposes (optional)
# sudo apt install -y tcpdump     # Packet analyzer
# sudo apt install -y strace      # System call tracer
# sudo apt install -y lsof        # Lists open files

echo "Installation complete. Milutin, you're great!"
