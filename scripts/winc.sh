#!/usr/bin/bash

PORT=$1
HEADERS=$2

categories=`echo "user resident security" | tr ' ' '\n'`
selected_category=`printf "$categories" | fzf`

if [ $selected_category == "resident" ]; then
    routes=`echo "sign-in visitors admin/residents" | tr ' ' '\n'`
    selected_route=`printf "$routes" | fzf`
    GSTR=http://192.168.0.102:$PORT/$selected_category/$selected_route
    
    response=$(curl -v $GSTR -H "$HEADERS")
    echo $response | python3 -m json.tool

    packet_size=$(wc -c <<< "$response") 
    echo "Packet size = $packet_size bytes"
fi








# PORT=$1
# URL=$2
# HEADER=$3



# GSTR=http://192.168.0.102:$PORT/$URL


# response=$(curl -v $GSTR -H "$HEADER")
# echo $response | json_pp

# byte_size=$(wc -c <<< "$response") 
# echo "packet_size = $byte_size bytes"
