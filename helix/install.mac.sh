#!/opt/homebrew/bin/bash

GREEN='\033[0;32m'
NO_COLOR='\033[0m'

info() {
  echo -e "[${GREEN}INFO${NO_COLOR}] $1"
}

declare -A npm_packages=(
  [bash]="bash-language-server"
  [docker]="dockerfile-language-server-nodejs"
  [web]="vscode-langservers-extracted typescript typescript-language-server prettier"
  [python]="pyright"
  [yaml]="yaml-language-server"
)

declare -A brew_packages=(
  [bash]="shfmt"
  [lua]="lua-language-server"
  [markdown]="marksman"
  [rust]="llvm"
)

declare -A cargo_crates=(
  [markdown]="--git https://github.com/github-language-server/github-lsp"
  [toml]="taplo-cli --locked --features lsp"
)

declare -A pypi_packages=(
  [python]="ruff-lsp black"
)

info "Installing dependencies"

for lang in "${!npm_packages[@]}"; do
  info "Installing npm packages for $lang"
  npm i -g ${npm_packages[$lang]} --silent
done

for lang in "${!brew_packages[@]}"; do
  info "Installing brew packages for $lang"
  brew install ${brew_packages[$lang]} --quiet
done

for lang in "${!cargo_crates[@]}"; do
  info "Installing cargo crates for $lang"
  cargo install ${cargo_crates[$lang]} --quiet
done

for lang in "${!pypi_packages[@]}"; do
  info "Installing pypi packages for $lang"
  pipx install ${pypi_packages[$lang]} --quiet
done
