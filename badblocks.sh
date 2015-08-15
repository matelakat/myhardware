#!/bin/bash
set -eux

DEVICE="$1"
NAME="$2"

sudo badblocks -b 1048576 -n -o "badblocks.$NAME" -s -v "$DEVICE"
