#!/usr/bin/env bash

echo $1 $2

cd $1
tmux new -s frn

cd ..
cd $2
tmux new -d -s bck

selected=`printf "frn\nbck" | fzf`
tmux a -t $selected
