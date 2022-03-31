#!/bin/sh
# deploy.sh <target-host>:
#  Builds flake locally and deploys to target-host

nixos-rebuild --flake .#rpi3 --target-host $1 \
  --build-host localhost switch
