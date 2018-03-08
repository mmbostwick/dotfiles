set -x PAGER vimpager
set -x LPASS_AGENT_TIMEOUT 1800

alias whatismyip "dig +short myip.opendns.com @resolver1.opendns.com"
alias tree "tree -C"

set fish_greeting ""
#fortune -n 70 |  cowsay -f (ls /usr/local/Cellar/cowsay/3.03/share/cows | gshuf -n1) | toilet -F gay -f term
#if fping -q google.com
#	wget "http://api.icndb.com/jokes/random" -qO- | jshon -e value -e joke -u |  cowsay -f (ls /usr/local/Cellar/cowsay/3.03/share/cows | gshuf -n1) | toilet -F gay -f term
#	else 
#		fortune -s -n 70 |  cowsay -f (ls /usr/local/Cellar/cowsay/3.03/share/cows | gshuf -n1) | toilet -F gay -f term | recode html
#end
#curl -s 'http://tambal.azurewebsites.net/joke/random' | jq -r '.joke' | cowsay -f (ls /usr/local/Cellar/cowsay/3.03/share/cows | gshuf -n1) | toilet -F gay -f term | recode html
#echo

neofetch

uptime
#top -l 1 -s 0 | grep PhysMem
echo
#echo System IPs:  (ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1')
#echo External IP: (whatismyip)

#wget randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*;\1;"
