
    echo "---- Section: Iptables ----"
    echo "Do you want to install 'iptables'?"
    ! askInputIsYes && return

    runCommand "sudo apt-get install iptables -y"
    
    echo "Do you want to open Port 80 within 'iptables' (used for Webserver)?"
    askInputIsYes && runCommand "sudo iptables -A INPUT -p tcp -m tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT"

    echo "Do you want to open Port 22 within 'iptables' (used for SSH)?"
    echo "HIGHLY RECOMMENDED"
    askInputIsYes && runCommand "sudo iptables -A INPUT -p tcp -m tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

    echo "Do you want to ACCEPT Loopback within 'iptables'?"
    echo "HIGHLY RECOMMENDED"
    askInputIsYes && runCommand "sudo iptables -A INPUT -I lo -j ACCEPT"

    echo "Do you want to DROP all traffic not accepted?"
    echo "HIGHLY RECOMMENDED"
    askInputIsYes && runCommand "sudo iptables -A INPUT -j DROP"
    echo "---- Section 1.1 Completed ----"