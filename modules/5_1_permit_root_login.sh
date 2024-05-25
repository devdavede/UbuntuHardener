
    echo "Do you want to permit root login via SSH?"
    ! askInputIsYes && return

    if grep -q "^PermitRootLogin" "$sshd_config"; then
        sed -i '/^PermitRootLogin/s/^\(.*\)yes/\1no/' "$sshd_config"
        echo "PermitRootLogin entry updated to 'no'"
    else
        echo "PermitRootLogin no" >> "$sshd_config"
        echo "PermitRootLogin entry added"
    fi