#!/bin/bash

KEY_DIR="./docker/ssh-keys"

mkdir -p $KEY_DIR

KEY_NAME="docker_ssh_key"

KEY_PATH="$KEY_DIR/$KEY_NAME"

echo "Generating SSH key in $KEY_PATH"
ssh-keygen -t rsa -b 4096 -f $KEY_PATH -q -N ""

echo "SSH key generated at $KEY_PATH"
echo "Public key:"
cat "$KEY_PATH.pub"

echo "Remember to add the public key to the authorized_keys in your Docker container."
