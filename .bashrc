# This is .bashrc
# Latest at https://raw.githubusercontent.com/esodesod/dotfiles/master/.bashrc

# Pretty colors
#export LS_OPTIONS='--color=auto'
#eval "`dircolors`"
#alias ls='ls $LS_OPTIONS'
#alias ll='ls $LS_OPTIONS -hAlF'
#alias l='ls $LS_OPTIONS -1hAF'
alias ll='ls -hAlF'
alias l='ls -1hAF'

# Some aliases for disk hogs
alias ducks='du -cks * | sort -rn | head'
alias largefolders='du -hsx * | sort -rh | head'
alias largefiles1='find . -type f -size +1M -exec du -h '{}' + | sort -hr | head'
alias largefiles2='find . -printf "%s %p\n"| sort -nr | head'

# histcontrol
export HISTCONTROL=ignorespace # cause you can't unsee some things..
shopt -s histappend 
PROMPT_COMMAND="history -n; history -a" # reload history and append new (old actually, get it?) history
unset HISTFILESIZE # more history
HISTSIZE=2000 # wait, how much?
