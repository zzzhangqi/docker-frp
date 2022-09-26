#!/bin/bash


if [[ "$1" == "server" ]]; then
  /app/frp/frps -c /app/frp/frps.ini
elif [[ "$1" == "client" ]]; then
  /app/frp/frpc -c /app/frp/frpc.ini
else
  echo "Usage: $0 {server|client}"
fi
