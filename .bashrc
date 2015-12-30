# This is .bashrc
# Latest at https://raw.githubusercontent.com/esodesod/dotfiles/master/.bashrc

# Pretty colors
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -hAlF'
alias l='ls $LS_OPTIONS -1hAF'

# Some aliases for disk hogs
alias ducks='du -cks * | sort -rn | head'
alias large1='du -hsx * | sort -rh | head -10'
alias large2='find . -printf "%s %p\n"| sort -nr | head -10'
