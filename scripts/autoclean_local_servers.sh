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
        echo "Cleaning self: ${server}"
        sudo apt-get autoclean && sudo apt-get autoremove -y && sudo apt-get clean
    elif ! ssh -o PasswordAuthentication=no "$server" /bin/true 2> /dev/null; then
        echo "Attempted to connect to: $server"
        echo "SSH connection failed when using keys, not trying with password authentication, please copy keys to server and try again."
        echo 
        echo
        continue
    else 
        echo "Cleaning server: $server"
        echo "SSH connection successful, cleaning server now"
        ssh "$server" "sudo apt-get autoclean && sudo apt-get autoremove -y && sudo apt-get clean"
    fi
    echo
    echo
done

