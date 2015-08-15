#!/bin/bash
set -eux

DEVICE="$1"
NAME="$2"

sudo smartctl -i "$DEVICE" > "$NAME"
