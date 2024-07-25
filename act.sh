#!/bin/bash

endpoint=$1
user=$2
password=$3

curl "https://actbin.blob.core.windows.net/act-bin/conformance_arm64" --output /tmp/conformance

chmod +x /tmp/conformance
exec /tmp/conformance --endpoint "$endpoint" --user "$user" --password "$password" --check-events
