#!/bin/zsh

#Grant superuser privileges
while true; do
	sudo -v;
	sleep 300;
	kill -0 "$$" || exit;
done 2>/dev/null &;

export SYSTEM=$(uname -s);
export DOTFILES_PATH="${HOME}/dotfiles/";
export DESTRIBUTOR = lsb_release --id|grep -Eo "(Ubuntu|Debian)";
set TZ=Europe/Moscow

#Update system
apt update;
apt dist-upgrade;

#Install required software
apt install -y \
curl \
apt-transport-https \
zsh \
zsh-common \
net-tools \
remmina \
openssh-client \
openssh-server \
git \
lsb_release


if [[ $(cat /etc/os_release|grep --max-count=1 -Eo "(Ubuntu|Debian|LinuxMint)" ]]
echo "\033[101mInstall vscode?\033[0m";
while true; do
    read REPLY;
        case "$REPLY" in
    		y|Y|Yes) "$SHELL" <<-EOF
                wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg;
                install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/;
                "$SHELL" -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list';
                rm -f packages.microsoft.gpg;
                apt install code;
            EOF
    		n|N|No) break;;
    		*) echo "Pass y|n"; continue;;
    	esac
done




#Install timezone
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo $TZ > /etc/timezone



#Install OhMyZsh
if [[ $SHELL != "/bin/zsh" ]]; then
    if [[ -d ~/.oh-my-zsh ]]; then
        echo "Oh my Zsh already installed";
        chsh -s "/bin/zsh";
    fi
else
	"$SHELL" -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi

#Install PowerLine fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts\
	&& chmod u+rwx /tmp/fonts/install.sh;
"$SHELL" -c "/tmp/fonts/install.sh" 2>/dev/null;
rm -Rf /tmp/fonts;

# Configure vscode if exist
if [[ $(which code) 2>/dev/null ]]; then
    echo "\033[101mConfigure vscode?\033[0m";
    while true; do
        read REPLY;
        case "$REPLY" in
    		y|Y|Yes) "$SHELL" -c "${DOTFILES_PATH}configure_vscode.sh"; break;;
    		n|N|No) break;;
    		*) echo "Pass y|n"; continue;;
    	esac
    done
fi

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
