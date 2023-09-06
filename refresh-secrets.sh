#!/bin/bash

# Directory containing secrets
SECRETS_DIR="/vault/secrets"

# Check if the directory exists
if [ -d "$SECRETS_DIR" ]; then
  # Iterate through the files in the directory
  for SECRET_FILE in $SECRETS_DIR/*; do

    # Check if it's a file and not a directory
    if [ -f "$SECRET_FILE" ]; then
      # Increment the counter
      SECRETS_COUNT=$((SECRETS_COUNT + 1))

      # Extract the variable name from the filename
      source $SECRET_FILE
    fi
  done

  echo "Found and exported $SECRETS_COUNT secrets from $SECRETS_DIR."
else
  echo "Directory $SECRETS_DIR does not exist. Continuing without exporting secrets."
fi