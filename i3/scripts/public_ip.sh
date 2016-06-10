#!/usr/bin/env bash

IP=$(curl ifconfig.me/ip)

case $BLOCK_BUTTON in
  3) echo "$IP" | xclip ;;
  *) echo "$IP" ;;
esac
