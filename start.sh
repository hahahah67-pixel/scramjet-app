#!/usr/bin/env bash

echo "Booting Scramjet..."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Force Node 22
if ! nvm ls 22 >/dev/null 2>&1; then
  echo "Installing Node 22..."
  nvm install 22
fi

nvm use 22 >/dev/null 2>&1
nvm alias default 22

cd "$(dirname "$0")"

# Ensure pnpm exists
if ! command -v pnpm >/dev/null 2>&1; then
  echo "Installing pnpm..."
  npm install -g pnpm
fi

# Install dependencies once
pnpm install

echo "Scramjet is running 🚀"

# --- AUTO-HEAL LOOP (this is the key upgrade) ---
while true; do
  pnpm start

  echo "Scramjet stopped. Restarting in 2 seconds..."
  sleep 2
done
