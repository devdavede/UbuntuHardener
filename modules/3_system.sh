
    echo "Section 1: System"
    echo "Do you want to apt-update?"
    askInputIsYes && runCommand "sudo apt update -y"
    echo "Do you want to apt-upgrade?"
    askInputIsYes && runCommand "sudo apt upgrade -y"
    section1_1iptables