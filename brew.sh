#!/bin/zsh
function brew_install_app(){
	local apps=(xz htop git youtube-dl wget mc);

	brew update;
	brew upgrade;
	brew upgrade --cask;
	brew doctor;

	for app in $apps; do
		brew install $app;
	done;

	brew tap homebrew/cask-fonts;

	local cask_apps=(visual-studio-code font-fira-code qbittorrent vlc google-chrome speedcrunch);

	for app in $cask_apps; do
		brew install --cask $app;
	done;

	brew cleanup --force -s > /dev/null 2>&1;
}
