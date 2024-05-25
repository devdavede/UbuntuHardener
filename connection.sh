runCommand() {
    #echo $(ssh -o ControlPath=~/.ssh/control:%h:%p "$remote_user@$remote_host" "$@" 2>&1)
    ssh -o ControlPath=~/.ssh/control:%h:%p "$remote_user@$remote_host" "$@"
}

checkSSHCredentials() {
    ssh -i "$remote_ssh_key" "$remote_user@$remote_host" exit >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Successfully connected"
    else
        echo "Failed to connect. Exit script."
        exit 1
    fi
}

connectSSH() {
    ssh -i "$remote_ssh_key" -q -o ControlMaster=yes -o ControlPath=~/.ssh/control:%h:%p -N "$remote_user@$remote_host" &
}