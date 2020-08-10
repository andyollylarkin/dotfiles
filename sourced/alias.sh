#!/bin/zsh

alias ..="cd .."
alias cls="clear"
alias ydlplist="youtube-dl --yes-playlist -x --audio-format mp3 $1"
alias ydlmp3="youtube-dl --no-playlist -x --audio-format mp3 $1"
alias duhr="du -sh $1"
# alias sleepNow="shutdown -s now"
alias xz_best_compress="xz --verbose --format=xz --compress -'$3' '$1' '$2'"
alias getip="ipconfig getifaddr $1"
