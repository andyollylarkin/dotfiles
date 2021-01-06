#!/bin/zsh
fs_total(){
	for size in $(ls /)
	do
		du -h -d 0 /$size 1>/tmp/size_check 2>/dev/null
		cat /tmp/size_check|grep -Ei "\d{1,}[B|GB]\s{1,4}\/[^\.]\w+"
	done
	rm /tmp/size_check
	echo "DONE"
}

clean_trash(){
	local TRASH=~/.Trash
	echo "y" | rm -Rif $TRASH/* 2>/dev/null
}

activate_venv(){
    if [ -z $1 ]
    then
        echo -e "\033[101mPass venv path\033[0m";
    fi
    export OLD_PS_PROMPT=$PS1;

    if [ -z $VIRTUAL_ENV ]
    then
        local VENV_PATH=$1;
        source $VENV_PATH;
        PS1="(venv) ${OLD_PS_PROMPT}";
    fi
}

deactivate_venv(){
   if [ ! -z $VIRTUAL_ENV ]
   then
       deactivate;
       PS1=${OLD_PS_PROMPT};
   fi
}

        
