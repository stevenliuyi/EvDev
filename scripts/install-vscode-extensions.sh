#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Installing $line using VSCode";
    code --user-data-dir /root/.config/Code --install-extension $line
    # Extension installation may result in exit code 0, so check if extension
    # folder exists. The issue may be related to
    # https://github.com/microsoft/vscode/issues/80065
    count=$(find /root/.vscode/extensions -maxdepth 1 -iname "${line}*" -type d | wc -l)
    if [ $count -eq 0 ]; then exit 1; fi
done < "$1"
