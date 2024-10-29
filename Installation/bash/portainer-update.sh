---
- name: Deploy portainer-ce latest image
  hosts: all
  become: true
  become_method: sudo
  become_user: root
  tasks:
    - name: Copy bash script to target host
      copy:
        src: /home/ansible/portainer-update.sh     # Path to the script on the Ansible control node
        dest: /tmp/portainer-update.sh
        mode: '0755'

    - name: Execute the bash script
      command: /tmp/portainer-update.sh
