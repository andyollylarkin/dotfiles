#!/bin/zsh

export PATH=/usr/local/bin:$PATH;
export PATH=/usr/local/Cellar/php/7.4.10/bin:$PATH;
#export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/;
#export PATH=$PATH:$ANDROID_SDK_ROOT/tools/;
if [[ $(uname -s) == "Darwin" ]];
then
    export PATH=/usr/local/Cellar/libpq/12.4/bin:$PATH;
fi

export HOME=~
export CELLAR="$(brew --cellar)";
export TERM=xterm-256color;
#export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk;
#export STUDIO_JDK=/Applications/Android\ Studio\.app/Contents/jre/jdk/Contents/Home/;
