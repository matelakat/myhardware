#!/bin/bash
set -eux

DEVICE="$1"
NAME="$2"
shift
shift

sudo smartctl -i "$DEVICE" "$@" > "$NAME"
