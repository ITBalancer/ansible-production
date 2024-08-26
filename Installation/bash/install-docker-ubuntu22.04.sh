bash
#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Update the system
echo "Updating system package list..."
sudo apt update && sudo apt upgrade -y

# Install required packages
echo "Installing required packages..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Install Docker if not already installed
if command_exists docker; then
    echo "Docker is already installed."
else
    echo "Installing Docker..."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    echo "Docker installed successfully."
fi

# Add the current user to the Docker group
echo "Adding user to the Docker group..."
sudo usermod -aG docker $USER

# Install Docker Compose (optional)
if command_exists docker-compose; then
    echo "Docker Compose is already installed."
else
    echo "Installing Docker Compose..."
    DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
    sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose installed successfully."
fi

# Install Portainer
echo "Installing Portainer..."
sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 --name portainer --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce

echo "Portainer is now running on http://localhost:9000"

# Feedback to the user
echo "Installation completed! Please log out and log back in for the Docker group changes to take effect."