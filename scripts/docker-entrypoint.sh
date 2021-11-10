#!/bin/sh

# Abort on any error (including if wait-for-it fails).
set -e

# Wait for hardhat to be up, if we know where it is.
if [ -n "$WAIT_HOST" ]; then
  /app/wait-for-it.sh "$WAIT_HOST" -t 0
fi

# Run the main container command.
exec "$@"
