
    echo "Section 2: Apache"
    read -p 'Are you using Apache and want to harden it? Press Y: ' input
    if [ $input == "Y" ]; then
        echo "Do you want to install 'libapache2-mod-security2'?"
        askInputIsYes && runCommand "sudo apt install libapache2-mod-security2 -y"
    fi