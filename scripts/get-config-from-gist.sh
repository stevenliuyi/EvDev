#!/bin/bash

gistid=`cat ../sync.gist`
gisturl="https://gist.githubusercontent.com/${gistid}/raw"

mkdir -p ../snippets
curl -o ../extensions.json "${gisturl}/extensions.json"
curl -o ../settings.json "${gisturl}/settings.json"
curl -o ../snippets/latex.json "${gisturl}/snippets%257Clatex.json"
