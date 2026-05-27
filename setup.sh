#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo_blue() {
    echo -e "${BLUE}$1${NC}"
}

echo_green() {
    echo -e "${GREEN}$1${NC}"
}

echo_yellow() {
    echo -e "${YELLOW}$1${NC}"
}

echo_red() {
    echo -e "${RED}$1${NC}"
}

install_homebrew() {
    if command -v brew &>/dev/null; then
        echo_green "Homebrew already installed"
        return 0
    fi

    echo_blue "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        if ! grep -q 'brew shellenv' "$HOME/.zprofile" 2>/dev/null; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
        fi
    fi

    echo_green "Homebrew installed"
}

install_stow() {
    if command -v stow &>/dev/null; then
        echo_green "GNU Stow already installed"
        return 0
    fi

    echo_blue "Installing GNU Stow..."
    brew install stow
    echo_green "GNU Stow installed"
}

stow_dotfiles() {
    echo_blue "Symlinking dotfiles with stow..."

    cd "$DOTFILES_DIR"

    # Stow all dotfiles to $HOME
    # The repo is already structured correctly for stow:
    #   .zshrc -> ~/.zshrc
    #   .config/nvim -> ~/.config/nvim
    stow --adopt . --target="$HOME"

    # Use the original files in this repository
    git restore .

    echo_green "Dotfiles symlinked"
}

install_brew_packages() {
    echo_blue "Installing packages from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
    echo_green "Brew packages installed"
}

install_rust() {
    if command -v rustc &>/dev/null; then
        echo_green "Rust already installed"
        return 0
    fi

    echo_blue "Installing Rust via rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # shellcheck source=/dev/null
    source "$HOME/.cargo/env"
    echo_green "Rust installed"
}

install_nvm() {
    if [[ -d "$HOME/.nvm" ]]; then
        echo_green "NVM already installed"
        return 0
    fi

    echo_blue "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    echo_green "NVM installed"
}

install_node() {
    if command -v node &>/dev/null; then
        echo_green "Node already installed"
        return 0
    fi

    echo_blue "Installing Node LTS via NVM..."
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts
    echo_green "Node installed"
}

install_npm_globals() {
    echo_blue "Installing global npm packages..."
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm install -g typescript @mdx-js/mdx
    echo_green "Global npm packages installed"
}

post_install() {
    echo_blue "Running post-install steps..."

    if [[ "$SHELL" != */zsh ]]; then
        echo_blue "Setting zsh as default shell..."
        chsh -s "$(which zsh)"
    fi

    echo_green "Post-install complete"
}

main() {
    echo -e "${GREEN}Starting MacBook setup...${NC}"
    echo ""

    install_homebrew
    install_stow
    stow_dotfiles
    install_brew_packages
    install_rust
    install_nvm
    install_node
    install_npm_globals
    post_install

    echo ""
    echo_green "Setup complete! 🎉"
    echo ""
    echo_blue "Next steps:"
    echo "  1. Restart your terminal"
    echo "  2. Run 'p10k configure' to set up Powerlevel10k"
    echo ""
}

main "$@"
