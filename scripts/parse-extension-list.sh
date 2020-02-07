#!/bin/bash

jq -r '.[] | select(.publisher != "ms-vscode-remote").metadata.publisherId' ../extensions.json > ../extensions.list

