#!/usr/bin/env bash

set -e

echo "Starting Scramjet..."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

cd "$(dirname "$0")"

# install pnpm if missing
if ! command -v pnpm >/dev/null 2>&1; then
  npm install -g pnpm
fi

# install deps if needed
pnpm install

# start app
echo "Scramjet is running 🚀"
exec pnpm start
