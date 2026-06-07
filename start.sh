#!/usr/bin/env bash

echo "Booting Scramjet..."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ---- FORCE Node 22 ----
if ! nvm ls 22 >/dev/null 2>&1; then
  echo "Installing Node 22..."
  nvm install 22
fi

nvm use 22
nvm alias default 22

# ---- ensure pnpm is compatible ----
if ! command -v pnpm >/dev/null 2>&1; then
  echo "Installing pnpm..."
  npm install -g pnpm
fi

NODE_VERSION=$(node -v)
echo "Using Node: $NODE_VERSION"

# ---- go to project root ----
cd "$(dirname "$0")"

# ---- install dependencies if needed ----
if [ ! -d node_modules ]; then
  pnpm install
fi

# ---- prevent duplicate server ----
if pgrep -f "pnpm start" >/dev/null; then
  echo "Scramjet already running"
  exit 0
fi

# ---- start app ----
echo "Scramjet is running 🚀"
exec pnpm start
