# esod : default .bashrc

# Pretty colors
alias ll='ls -hAlF'
alias l='ls -1hAF'

# HISTORY: Cause I forget stuff
# ignore command starting with spaces & duplicates
export HISTCONTROL=ignorespace:ignoredups:erasedups
# append & reload in any window
PROMPT_COMMAND="history -a; history -r" 
# increase history size
unset HISTFILESIZE
HISTSIZE=20000 # wait, how much?
# ignore this for now
#shopt -s histappend 
#PROMPT_COMMAND="history -n; history -a"

# ALIASES: Save time, save the world!
alias ducks='du -cks * | sort -rn | head'
alias largefolders='du -hsx * | sort -rh | head'
alias largefiles1='find . -type f -size +1M -exec du -h '{}' + | sort -hr | head'
alias largefiles2='find . -printf "%s %p\n"| sort -nr | head'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias flushdns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
alias remove_ds='find . -type f -name '*.DS_Store' -ls -delete'
alias httpd='python -m SimpleHTTPServer'

# Just being lazy
alias esx-01='ssh root@esx-01.esod.local'
alias esx-02='ssh root@esx-02.esod.local'
alias esx-03='ssh root@esx-03.esod.local'
alias esx-04='ssh root@esx-04.esod.local'
alias esx-05='ssh root@esx-05.esod.local'
alias esx-vdi-01='ssh root@esx-vdi-01.esod.local'
alias esx-backup-01='ssh root@esx-backup-01.esod.local'
alias vc='ssh root@vc.esod.local'
alias gw='ssh root@gw.esod.local'
alias takemehome='sudo route -n add -net 10.0.1.0/24 192.168.100.1 && sudo route -n add -net 192.168.1.0/24 192.168.100.1'
