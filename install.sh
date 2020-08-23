#!/bin/sh
# Grand superuser privileges
while true; do
	sudo -v;
	sleep 300;
	kill -0 "$$" || exit;
done 2>/dev/null &

export CURRENT_SYSTEM=$(uname -s);
export INSTALL_PATH="~/dotfiles"

# Install Xcode command line tools
if [ -z "$(xcode-select -p 2>/dev/null)" ]; then
	xcode-select --install;
else
	echo "\033[101mXcode Command Line Tools already installed";
fi
# Install homebrew 
if [[ $CURRENT_SYSTEM == "Darwin" ]]; then
	"$SHELL" -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/\
    install/master/install.sh)"
fi

# Install brew formulae OR update apt
if [ $? -eq 0 ]; then
	"$SHELL" -c "./brew.sh";
elif [[ $CURRENT_SYSTEM == "Linux" ]]; then
	apt-get update && apt-get upgrade -y
elif [ -z "brew --version" ]; then
	echo "\033[101mCurrent system not Linux or Brew wasn\'t installed"
	sleep 8;
	exit 1;
fi


# Install ZSH
if [[ $CURRENT_SYSTEM == "Linux" ]]; then
	apt-get install zsh -y && "$SHELL" -c "$(curl -fsSL https://raw.github.\
    com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	if ! [ "$CURRENT_SYSTEM" = "/bin/zsh" ]; then
		chsh -s "/bin/zsh";
		# source ~/.zshrc
	fi
elif [[ $CURRENT_SYSTEM == "Darwin" ]]; then
	if [[ $SHELL == "/bin/sh" || "/bin/bash"]]; then
		"$SHELL" -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/\
        master/tools/install.sh)";
		chsh -s "/bin/zsh";
		# source ~/.zshrc
	fi
fi

# Install powerline font
if [[ $CURRENT_SYSTEM == "Linux" ]]; then
	apt-get install -y fonts-powerline
elif [[ $CURRENT_SYSTEM == "Darwin" ]]; then
	git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts\
     && chmod u+rwx /tmp/fonts/install.sh;
	"$SHELL" -c "/tmp/fonts/install.sh"
	rm -Rf /tmp/fonts


# Install symlinks for .files
declare slink=($(find . -maxdepth 1 -name ".*" -name "*.conf" -not -name .\
-not -name ".gitignore"));
for link in $slink; do
    ln -s $INSTALL_PATH/$link $HOME/
done

# Configure if OSX
if [ $CURRENT_SYSTEM = "Darwin" ]; then
	"$SHELL" -c "./macos.sh";
fi
# Configure vscode
"$SHELL" -c "app/vscode/install_code.sh";

# Finilize
unset CURRENT_SYSTEM;
unset INSTALL_PATH;
"$SHELL" && source "~/.zshrc";
echo "\033[96m==========\033[0m\033[5m\033[95mFINISH INSTALL\033[0m\033[96m\
==========";
sleep 8;
kill -9 %1;
