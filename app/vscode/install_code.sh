#!/bin/zsh

user_settings="/Users/denisdavydov/Library/Application Support/Code"

plugins=(
	alefragnani.Bookmarks
	alefragnani.project-manager
	bmewburn.vscode-intelephense-client
	felixfbecker.php-debug
	felixfbecker.php-intellisense
	felixfbecker.php-pack
	mads-hartmann.bash-ide-vscode
	mhutchie.git-graph
	ms-azuretools.vscode-docker
	mtxr.sqltools
	PKief.material-icon-theme
	teabyii.ayu
	vscodevim.vim
)
for plugin in $plugins; do
	/usr/local/bin/code --install-extensions $plugin
done

ln -s $INSTALL_PATH/app/vscode/User $user_settings/User
