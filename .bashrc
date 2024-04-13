# esod default .bashrc

# vi mode
set -o vi

# aliases
alias ll='ls -hAlF'
alias l='ls -1hAF'
alias ducks='du -cks * | sort -rn | head'
alias largefolders='du -hsx * | sort -rh | head'
alias largefiles1='find . -type f -size +1M -exec du -h '{}' + | sort -hr | head'
alias largefiles2='find . -printf "%s %p\n"| sort -nr | head'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias flushdns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
alias httpd='python -m SimpleHTTPServer'

# vpn routes, if needed
alias route66='sudo route -n add -net 10.0.1.0/24 192.168.100.1 && sudo route -n add -net 192.168.1.0/24 192.168.100.1'
alias takemehome='sudo route -n add -net 10.0.1.0/24 192.168.1.1' # Fix IIT, please.

# history: cause i forget stuff
# ignore command starting with spaces & duplicates
export HISTCONTROL=ignorespace:ignoredups:erasedups
# append & reload in any window
PROMPT_COMMAND="history -a; history -r" 
# increase history size
unset HISTFILESIZE
HISTSIZE=20000 # wait, how much?
