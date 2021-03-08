#!/bin/zsh

#Grand superuser privileges
while true; do
	sudo -v;
	sleep 300;
	kill -0 "$$" || exit;
done 2>/dev/null &;

 SYSTEM=$(uname -s);
 DOTFILES_PATH="${HOME}/dotfiles/";

#Install xcode cmd-line tools
if [[ $SYSTEM == "Darwin" ]]; then
	if [ -z "$(xcode-select -p 2>/dev/null)" ]; then
		xcode-select --install;
	else
		echo "\033[101mXcode Command Line Tools already installed\033[0m";

	fi
fi

if [[ $SYSTEM == "Darwin" ]]; then
    "$SHELL" -c ./macos.sh;
fi

#Install homebrew
if [ -z "$(brew --version 2>/dev/null)" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
else
	echo "\033[101mBrew already installed\033[0m";
fi
    

#Install OhMyZsh
if [[ $SHELL != "/bin/zsh" ]]; then
	chsh -s "/bin/zsh";
	"$SHELL" -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
	/bin/zsh -c "compaudit | xargs chmod g-w,o-w";
else
	"$SHELL" -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
	/bin/zsh -c "compaudit | xargs chmod g-w,o-w";
fi

#Install PowerLine fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts\
	&& chmod u+rwx /tmp/fonts/install.sh;
"$SHELL" -c "/tmp/fonts/install.sh" 2>/dev/null;
rm -Rf /tmp/fonts;

if [[ $SYSTEM == "Darwin" ]]; then
	source ./brew.sh;
	brew_install_app;
fi

# Configure vscode
echo "\033[101mConfigure vscode?\033[0m";
while true; do
    read REPLY;
    case "$REPLY" in
		y|Y|Yes) "$SHELL" -c "${HOME}/dotfiles/configure_vscode.sh"; break;;
		n|N|No) break;;
		*) echo "Pass y|n"; continue;;
	esac
done

#Install configs
cd $DOTFILES_PATH/configs;
rsync -aRvh --exclude=.git --exclude=.gitignore --exclude=.DS_Store . ~;

#Finilize
unset SYSTEM;
unset ISNTALL_PATH;
source ~/.zshrc;
echo "\033[96m==========\033[0m\033[5m\033[95mFINISH INSTALL\
	\033[0m\033[96m\==========";
sleep 8;
kill -9 %1;
