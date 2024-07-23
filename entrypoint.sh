#!/bin/bash

endpoint=$1
user=$2
password=$3
token=$4

if [[ "$token" == "foobar" ]]; then
    # sudo apt install curl
    curl "https://actbin.blob.core.windows.net/act-bin/conformance" --output conformance

    chmod +x ./conformance
    ./conformance --endpoint "$endpoint" --user "$user" --password "$password" --check-events
else
    echo "Token is incorrect"
    exit 1
fi
