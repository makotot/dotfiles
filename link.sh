#!/usr/bin/env bash

ln -sfv $(pwd)/git/.gitconfig ~/.gitconfig

mkdir -p ~/.claude
ln -sfv $(pwd)/.claude/settings.json ~/.claude/settings.json
ln -sfv $(pwd)/.claude/statusline-command.sh ~/.claude/statusline-command.sh

ln -sfv $(pwd)/.config/ghostty ~/.config/ghostty
ln -sfv $(pwd)/.config/zellij ~/.config/zellij
ln -sfv $(pwd)/.config/helix ~/.config/helix
ln -sfv $(pwd)/.config/starship.toml ~/.config/starship.toml