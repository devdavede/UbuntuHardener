
    echo "-------------------------"
    echo "Welcome to Ubuntu Hardener"
    echo "This script tries to protect your Ubuntu Server"
    echo "!! Warning !!: This is an Alpha Version. Use with caution! You should know the consequences of the actions taken."
    read -p 'Press Y to continue, anything else to abort: ' input
        if [ ! $input == "Y" ]; then
        echo "Abort. Bye."
        exit
    fi