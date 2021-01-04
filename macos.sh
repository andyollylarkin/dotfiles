#!/bin/zsh

# Disable create .DS_Store and e.g. folders on removable media
defaults write com.apple.desktopservices DSDontWriteNetworkStores false

# Automatically hide Dock
defaults write com.apple.dock autohide -bool true

# Save screenshot to desktop
defaults write com.apple.screencapture location -string “$HOME/Desktop”

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string “png”
