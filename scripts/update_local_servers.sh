#! /bin/bash

# Load environment variables
if [ -f ../.env ]; then
    . ../.env
else
    echo "Error: .env file not found. Please create it before running the script."
    exit 1
fi

for server in ${LOCAL_SERVERS[@]}; do

    if [[ -z "$server" || "${server}" == ${hostname} ]]; then
        echo "Skipping self: $server"
        continue
    fi

    echo "Updating server: $server"
    if ! ssh -o PasswordAuthentication=no "$server" /bin/true; then
        echo "SSH connection failed when using keys, not trying with password authentication, please copy keys to server and try again."
        continue
    else 
        echo "SSH connection successful, updating server now"
        ssh "$server" "sudo apt-get update && sudo apt-get upgrade -y"
    fi
done
