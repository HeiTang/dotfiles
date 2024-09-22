#!/bin/bash
BREW_FORMULA_FILE="brew_formula.txt"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew does not exist. Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew exists."
fi

# Get Homebrew prefix
if [[ "$(uname -m)" == "arm64" ]]; then
    # Apple Silicon
    HOMEBREW_PREFIX="/opt/homebrew"
else
    # Intel
    HOMEBREW_PREFIX="/usr/local/Homebrew"
    if [ -d "/usr/local/bin" ]; then
        HOMEBREW_PREFIX="/usr/local"
    fi
fi

# Add Homebrew to PATH
BREW_PATH="$HOMEBREW_PREFIX/bin/brew"

if ! grep -q "$BREW_PATH shellenv" ~/.zprofile; then
    echo "eval \"\$($BREW_PATH shellenv)\"" >> ~/.zprofile
    eval "$($BREW_PATH shellenv)"
fi

brew update

# Check if Brewfile exists
BREWFILE="Brewfile"
if [ ! -f "$BREWFILE" ]; then
    echo "The Brewfile does not exist. Please make sure the Brewfile exists and try again."
    exit 1
fi

# Install all dependencies from Brewfile
echo "Installing packages from Brewfile..."
brew bundle install --file="$BREWFILE"

# Cleanup
brew cleanup

echo "All packages installed successfully. 🎉"