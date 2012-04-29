source /usr/local/bin/virtualenvwrapper.sh
PATH=$PATH:/usr/local/mysql/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/


#-------------------------------------------------------------------
#     Navigation Aliases 
#-------------------------------------------------------------------

function newdir() { mkdir -p "$@" && eval cd "\"\$$#\""; }
function cl { cd $1; ls; }
# alias home='cd ~'
alias desk='cd ~/Desktop'
alias list='ls -aFhlG'
function .. { cd ..; ls; }
alias c='clear'

#-------------------------------------------------------------------
#     Networking Functions and Aliases
#-------------------------------------------------------------------

#grep ifconfig to get get ip address
#link: http://www.askdavetaylor.com/how_do_i_figure_out_my_ip_address_on_a_mac.html
#alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'

#grep to find mac address http://goo.gl/8vcc4
#alias mac="ifconfig en0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'"

#get dhcp server address http://automatica.com.au/?p=463
#alias dhcp="ipconfig getoption en0 router"

alias flushdns='dscacheutil -flushcache'

#http://goo.gl/HbYyb
function ip(){ 
	ipconfig getpacket en0 | grep "yiaddr" | sed "s/yiaddr/ip/" | tr -d '\n';
}
function cpip(){
	ip; printf " (copied to clipboard)"; ipconfig getpacket en0 | grep "yiaddr" | sed "s/yiaddr = //" | tr -d '\n' | pbcopy;
}
function mac(){ 
	ipconfig getpacket en0 | grep "chaddr" | sed "s/chaddr/mac/" | tr -d '\n'; 
}
function cpmac(){ 
mac; printf " (copied to clipboard)"; ipconfig getpacket en0 | grep "chaddr" | sed "s/chaddr = //" | tr -d '\n' | pbcopy; 
}
function dns(){ ipconfig getpacket en0 | grep "domain_name_server" | sed "s/domain_name_server/DNS/"; }
function dhcp(){ ipconfig getpacket en0 | grep "router" | sed "s/router/DHCP/"; }

function net() { ip; mac; dns; dhcp; }


function capstone() { echo "192.168.246.5, SSH=44625, HTTP=44685, HTTPS=446485, MySQL=44635"; }

# print the ip and mac address on terminal startup
ip; echo ""; mac;


#-------------------------------------------------------------------
#     Other Aliases
#-------------------------------------------------------------------

alias profile="vim ~/.bash_profile"
alias sshmylink='ssh webadmin@mylink.byu.edu'
alias sshmylinkdb='ssh dbadmin@10.18.12.5'
alias sshcapstone='ssh root@192.168.246.5'
alias sshnursing='ssh -p 44625 root@it.et.byu.edu'
alias www='cd /Library/WebServer/Documents'
alias msg="vim Dropbox/Shared\ Folders/RAW/.msg"
# http://bit.ly/igCErk
alias m='mvim --remote-silent'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
