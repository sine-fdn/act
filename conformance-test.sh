#!/bin/bash

endpoint=$1
user=$2
password=$3

curl "https://actbin.blob.core.windows.net/act-bin/conformance" --output conformance

chmod +x ./conformance
./conformance --endpoint "$endpoint" --user "$user" --password "$password" --check-events
