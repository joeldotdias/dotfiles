#!/usr/bin/bash

languages=`echo "rust go c cpp typescript javascript nodejs python lua" | tr ' ' '\n'`

selected=`printf "$languages\ncore_utils" | fzf`
read -p "ask: " query

query=`echo $query | tr ' ' '+'`

if printf "$languages" | grep -qs $selected; then
    curl cht.sh/$selected/$query
else
    curl cht.sh/$query
fi
