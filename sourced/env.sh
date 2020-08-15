#!/bin/zsh

export PATH=/usr/local/bin:$PATH;
export PATH=/usr/local/Cellar/php@7.3/7.3.20/bin:$PATH;
#export HOME=~
export CELLAR="$(brew --cellar)";
export PHP="$(which php)";
export TERM=xterm-256color;