#!/bin/sh
# Brew install packages
apps=(xz-utils htop git youtube-dl tmux wget mc);

brew update;
brew upgrade;
brew cask upgrade;
brew doctor;
for app in $apps; do
	brew install $app;
done;
# Cask install...
brew tap homebrew/cask-fonts;

cask_apps=(visual-studio-code font-fira-code qbittorrent vlc google-chrome speedcrunch);
for app in $cask_apps; do
    brew cask install $app
done;



brew cleanup --force -s > /dev/nul 2>&1;
brew cask cleanup > /dev/null 2>&1;
