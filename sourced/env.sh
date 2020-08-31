#!/bin/zsh

export PATH=/usr/local/bin:$PATH;
export PATH=/usr/local/Cellar/php@7.3/7.3.21/bin:$PATH;
#export HOME=~
export CELLAR="$(brew --cellar)";
export TERM=xterm-256color;

# Configure PHP path
# function set_php(){
#     print "Set path to PHP interpreter"
#     read $PHP;
#     return 0;
# }