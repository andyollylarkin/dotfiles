#!/bin/zsh

export PATH=/usr/local/bin:$PATH;
export PATH=/usr/local/Cellar/php@7.3/7.3.21/bin:$PATH;
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/;
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/;
export HOME=~
export CELLAR="$(brew --cellar)";
export TERM=xterm-256color;
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk;
export STUDIO_JDK=/Applications/Android\ Studio\.app/Contents/jre/jdk/Contents/Home/;
