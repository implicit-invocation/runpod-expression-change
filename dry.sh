#!/bin/bash

python3 /comfyui/main.py --cpu &

echo "Waiting for comfyui to start for the first time"
for _ in `seq 1 60`; do
  echo "Comfyui is still not up, waiting..."
  if nc -z localhost 8188; then
	  echo "Ok, kill the process now!"
	  kill $!
    exit 0
  fi
  sleep 1
done

exit 1

