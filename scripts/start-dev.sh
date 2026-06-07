#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
else
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    . "$HOME/.nvm/nvm.sh"
fi

if ! nvm ls 20 >/dev/null 2>&1; then
    echo "Installing Node 20..."
    nvm install 20
fi

nvm use 20

if ! command -v pnpm >/dev/null 2>&1; then
    npm install -g pnpm
fi

if [ ! -d node_modules ]; then
    pnpm install
fi

pnpm start
