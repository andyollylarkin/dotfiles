#!/bin/zsh

user_settings="/Users/denisdavydov/Library/Application Support/Code"

local plugins=(
	alefragnani.Bookmarks
    alefragnani.project-manager
    christian-kohler.path-intellisense
    PKief.material-icon-theme
    christian-kohler.path-intellisense
    mads-hartmann.bash-ide-vscode
    ms-python.python
    ms-toolsai.jupyter
    ms-vscode.powershell
    PKief.material-icon-theme
    teabyii.ayu
    vscodevim.vim
)

rm -Rfv $user_settings;
mkdir $user_settings;
ln -s $HOME/dotfiles/app/vscode/User $user_settings/User;

for plugin in $plugins; do
	code --install-extension $plugin;
done
