#! /bin/bash

# Load environment variables
if [ -f ../.env ]; then
    . ../.env
else
    echo "Error: .env file not found. Please create it before running the script."
    exit 1
fi

for server in ${LOCAL_SERVERS[@]}; do

    if [[ -z "${server}" ]]; then
        continue
    elif [[ "${server}" == $(hostname) ]]; then
        echo "Upgrading self: ${server}"
        sudo apt-get update && sudo apt-get upgrade -y
    elif ! ssh -o PasswordAuthentication=no "$server" /bin/true 2> /dev/null; then
        echo "Attempted to connect to: $server"
        echo "SSH connection failed when using keys, not trying with password authentication, please copy keys to server and try again."
        echo
        echo
        continue
    else 
        echo "Updating server: $server"
        echo "SSH connection successful, updating server now"
        ssh "$server" "sudo apt-get update && sudo apt-get upgrade -y"
    fi
    echo
    echo
done
