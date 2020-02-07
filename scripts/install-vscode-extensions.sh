#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Installing $line using VSCode";
    if [ "$line" = "ms-vscode.cpptools" ]; then
        # Install C/C++ extension from VSIX to aviod downloading additional dependencies on extension activation
        # Get latest version from GitHub
        tag="$(curl --silent "https://api.github.com/repos/microsoft/vscode-cpptools/releases/latest" | jq -r .tag_name)"
        # Download offline installer
        echo "Downloading offline installer for ms-vscode.cpptools"
        curl -fsSL "https://github.com/microsoft/vscode-cpptools/releases/download/${tag}/cpptools-linux.vsix" -o ./cpptools-linux.vsix
        code --user-data-dir /root/.config/Code --install-extension ./cpptools-linux.vsix
    else
        code --user-data-dir /root/.config/Code --install-extension $line
    fi

    # Extension installation may result in exit code 0, so check if extension
    # folder exists. The issue may be related to
    # https://github.com/microsoft/vscode/issues/80065
    count=$(find /root/.vscode/extensions -maxdepth 1 -iname "${line}*" -type d | wc -l)
    if [ $count -eq 0 ]; then exit 1; fi
done < "$1"
