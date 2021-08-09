#!/bin/zsh

# System independent
export PATH=/usr/local/bin:$PATH;
export HOME=~
export TERM=xterm-256color;


# MACOS
if [[ $(uname -s) == 'Darwin' ]]; then
    export CELLAR="$(brew --cellar)";
    export PATH=/usr/local/Cellar/php/7.4.10/bin:$PATH;
fi
