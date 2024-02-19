#!/bin/bash

NO_COLOR='\033[0m'
GREEN='\033[0;32m'

echo -e "[${GREEN}INFO${NO_COLOR}] Installing dependencies"

# Bash
echo -e "[${GREEN}INFO${NO_COLOR}] bash"
npm i -g bash-language-server --silent

# CSS
echo -e "[${GREEN}INFO${NO_COLOR}] css"
npm i -g vscode-langservers-extracted --silent

# Docker
echo -e "[${GREEN}INFO${NO_COLOR}] docker"
npm install -g dockerfile-language-server-nodejs --silent

# HTML
echo -e "[${GREEN}INFO${NO_COLOR}] html"
npm i -g vscode-langservers-extracted --silent

# JSON
echo -e "[${GREEN}INFO${NO_COLOR}] json"
npm i -g vscode-langservers-extracted --silent

# JS/TS
echo -e "[${GREEN}INFO${NO_COLOR}] js/ts"
npm install -g typescript typescript-language-server --silent
npm i -g prettier --silent
npm install -g eslint_d --silent

# Markdown
echo -e "[${GREEN}INFO${NO_COLOR}] markdown"
brew install marksman --quiet

# Python
echo -e "[${GREEN}INFO${NO_COLOR}] python"
npm install pyright -g --silent
pipx install ruff-lsp
pipx install black

# Rust
echo -e "[${GREEN}INFO${NO_COLOR}] rust"
rustup component add rust-analyzer
brew install llvm --quiet
ln -s $(brew --prefix)/opt/llvm/bin/lldb-vscode $(brew --prefix)/bin/

# Tailwindcss
echo -e "[${GREEN}INFO${NO_COLOR}] tailwindcss"
npm install @tailwindcss/language-server -g --silent

# TOML
echo -e "[${GREEN}INFO${NO_COLOR}] toml"
cargo install taplo-cli --locked --features lsp --quiet

# Vue
echo -e "[${GREEN}INFO${NO_COLOR}] vue"
npm install @vue/language-server -g --silent

# YAML
echo -e "[${GREEN}INFO${NO_COLOR}] yaml"
npm install yaml-language-server -g --silent

# health check
echo -e "[${GREEN}INFO${NO_COLOR}] 🧬 health"
hx --health
