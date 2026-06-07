#!/usr/bin/env bash

echo "Booting Scramjet..."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Force Node 22
nvm install 22 >/dev/null 2>&1
nvm use 22 >/dev/null 2>&1
nvm alias default 22 >/dev/null 2>&1

cd "$(dirname "$0")"

command -v pnpm >/dev/null 2>&1 || npm install -g pnpm

pnpm install

echo "Scramjet is running 🚀"

exec pnpm start
