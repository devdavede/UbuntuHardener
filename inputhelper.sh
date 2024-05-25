
askInputIsYes(){
    read -p 'Press Y for Yes, N for No, C for Cancel (Exit Script): ' input

    if [[ $input == "Y" ]]; then
        return 0
    elif [[ $input == "N" ]]; then
        return 1
    elif [[ $input == "C" ]]; then
        echo "User exited"
        exit
    else
        askInputIsYes
    fi
}