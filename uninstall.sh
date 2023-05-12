#!/bin/sh

# To delete the startup configuration in the terminal
if [ -f ~/.zshrc ]; then
  sed -i '' '/# Dotfiles start/,/# Dotfiles end/d' ~/.zshrc
fi

if [ -f ~/.bashrc ]; then
  sed -i '' '/# to load zsh, start/,/# to load zsh, end/d' ~/.bashrc
fi

# To delete the runtime directory.
rm -rf src/runtime

