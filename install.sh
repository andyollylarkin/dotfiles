#!/bin/zsh

#Grand superuser privileges
while true; do
	sudo -v;
	sleep 300;
	kill -0 "$$" || exit;
done 2>/dev/null &

declare SYSTEM=$(uname -s);
declare DOTFILES_PATH="~/dotfiles";

function s_links(){
	for target_dir in $2; do
		for targer_source in $1; do

}

#Install xcode cmd-line tools
if [[ $SYSTEM == "Darwin" ]]; then
	if [ -z "$(xcode-select -p 2>/dev/null)" ]; then
		xcode-select --install;
	else
		echo "\033[101mXcode Command Line Tools already installed\033[0m";

	fi
fi


if [[ $SYSTEM == "Darwin" ]]; then
	source ./macos.sh;
fi




#Install homebrew
if [ -z "$(brew --version)" ]; then
	"$SHELL" -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/\
								install/master/install.sh)";
else
	echo "\033[101mHomebrew already installed\033[0m";
fi

#Install OhMyZsh
if [[ $SHELL != "/bin/zsh" ]]; then
	chsh -s "/bin/zsh";
	"$SHELL" -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/\
 								master/tools/install.sh)";
else
	"$SHELL" -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/\
 								master/tools/install.sh)";
fi

#Install PowerLine fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts\
	&& chmod u+rwx /tmp/fonts/install.sh;
"$SHELL" -c "/tmp/fonts/install.sh";
rm -Rf /tmp/fonts;


if [[ $SYSTEM == "Darwin" ]]; then
	source ./brew.sh;
	brew_install_app;
fi

#Install symlinks
declare dotfiles=($(ls -a|grep -Ev "(^\.git|\.swp$)"|grep -E "(^\.\w+|\w+\.conf)"));
for file in $dotfiles[@]; do
    ln -s $DOTFILES_PATH/"$file" $HOME/"$file";
done

# Declare array of command for make slink for applicatons config
declare mk_link_path=(
	"ln -s $DOTFILES_PATH/app/mc $HOME/.config/mc"
);
for command in $soft_conf_path[@]; do
	$SHELL -c $command; 


#Finilize
unset SYSTEM;
unset ISNTALL_PATH;
source "~/.zshrc";
echo "\033[96m==========\033[0m\033[5m\033[95mFINISH INSTALL\033[0m\033[96m\==========";
sleep 8;
kill -9 %1;
