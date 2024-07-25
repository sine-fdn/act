#!/bin/bash

endpoint=$1
user=$2
password=$3
option=$4

if [[ $option != --skip-http-check ]]; then
    echo "Testing HTTP connection. If this is not intended, please use --skip-http-check option."
    option=""
fi

if [[ $ARCH != "arm64" && $ARCH != "x86-64" ]]; then
    echo "No architecture specified. Defaulting to arm64."
    ARCH="arm64"
else
    echo "Downloading $ARCH binary."
fi

curl "https://actbin.blob.core.windows.net/act-bin/conformance_$ARCH" --output /tmp/conformance

chmod +x /tmp/conformance
exec /tmp/conformance --endpoint "$endpoint" --user "$user" --password "$password" --check-events $option
