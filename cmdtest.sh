remote_host=""
remote_user=""
remote_ssh_key="/Users/david/.ssh/id_rsa"

cleanup() {
    echo "Cleaning up before exiting..."
    ssh -o ControlPath=~/.ssh/control-debug:%h:%p -O exit "$remote_user@$remote_host"
}

trap cleanup EXIT

connect()
{
    ssh -i "$remote_ssh_key" -q -o ControlMaster=yes -o ControlPath=~/.ssh/control-debug:%h:%p -N "$remote_user@$remote_host" &
}


runCommand() {
    #echo $(ssh -o ControlPath=~/.ssh/control:%h:%p "$remote_user@$remote_host" "$@" 2>&1)
    ssh -o ControlPath=~/.ssh/control-debug:%h:%p "$remote_user@$remote_host" "$@"
}


connect
runCommand "sudo cat /etc/shadow | awk -F: '($2==""){print $1}'"