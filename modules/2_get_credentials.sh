
    echo "-------------------------"
    echo "Connect to Ubuntu Server"
    echo "We need to connect to the remote server to run the commands"
    echo "Info: This script is run 100% on your local machine. Credentials will not get transferred to any servers."
    read -p 'Enter the IP of your server: ' remote_host
    read -p 'Enter the Username to connect to the server. It must be a user in the root-group: ' remote_user
    read -p 'Enter the Password to connect to the server. Leave blank, if you use SSH Keys: ' remote_password
    if [[ $remote_password == "" ]]; then
        read -p 'Enter the Path to your SSH Keys. Leave blank to use default ~/.ssh/id_rsa' remote_ssh_key
        if [[ $remote_ssh_key == "" ]]; then
            echo "Set: ~/.ssh/id_rsa"
            remote_ssh_key="~/.ssh/id_rsa"
        fi
    fi