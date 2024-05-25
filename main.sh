loadShellFile()
{
    if [ -f "$1" ]; then
        source "$1"
    else
        echo "Configuration file $1 not found!"
        exit 1
    fi
}

loadShellFile "config.sh"
loadShellFile "traps.sh"
loadShellFile "connection.sh"
loadShellFile "inputhelper.sh"

for file in modules/*; do
    if [ -f "$file" ]; then
        loadShellFile $file
    fi
done


