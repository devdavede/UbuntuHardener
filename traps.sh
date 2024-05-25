cleanup() {
    echo "Cleaning up before exiting..."
    ssh -o ControlPath=~/.ssh/control:%h:%p -O exit "$remote_user@$remote_host"
}

trap cleanup EXIT