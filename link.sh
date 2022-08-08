#!/usr/bin/env bash

if [ ! -d ~/.config/wezterm ]; then
  mkdir -p ~/.config/wezterm
fi

ln -sfv $(pwd)/git/.gitconfig ~/.gitconfig
ln -sfv $(pwd)/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua