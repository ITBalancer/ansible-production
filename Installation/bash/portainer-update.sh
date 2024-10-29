#!/bin/bash
sudo docker stop portainer
sudo docker rm portainer
sudo docker run -d -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.22.0