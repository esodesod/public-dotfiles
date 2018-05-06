# esod : default .bashrc

# Pretty colors
alias ll='ls -hAlF'
alias l='ls -1hAF'

# histcontrol
export HISTCONTROL=ignorespace # cause you can't unsee some things..
shopt -s histappend 
PROMPT_COMMAND="history -n; history -a" # reload history and append new (old actually, get it?) history
unset HISTFILESIZE # more history
HISTSIZE=2000 # wait, how much?

# Save time, save the world! Use aliases
alias ducks='du -cks * | sort -rn | head'
alias largefolders='du -hsx * | sort -rh | head'
alias largefiles1='find . -type f -size +1M -exec du -h '{}' + | sort -hr | head'
alias largefiles2='find . -printf "%s %p\n"| sort -nr | head'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias flushdns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
alias remove_ds='find . -type f -name '*.DS_Store' -ls -delete'

# Just being lazy
alias esx-01='ssh root@esx-01.esod.local'
alias esx-02='ssh root@esx-02.esod.local'
alias esx-03='ssh root@esx-03.esod.local'
alias esx-04='ssh root@esx-04.esod.local'
alias vc='ssh root@vc.esod.local'
