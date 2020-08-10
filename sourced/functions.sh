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

mk_slink(){
	local sourse=""
	local destination=""


}