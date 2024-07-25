#!/bin/bash

case $ARCH in
arm64 | x86-64)
    echo "Downloading $ARCH binary."
    ;;
*)
    echo "No architecture specified. Defaulting to arm64."
    ARCH="arm64"
    ;;
esac

conformance_bin=$(mktemp)

curl -o ${conformance_bin} "https://actbin.blob.core.windows.net/act-bin/conformance_$ARCH"

chmod +x ${conformance_bin}
exec ${conformance_bin} "$@" --check-events
