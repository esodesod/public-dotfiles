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
alias largefolders='du -hsx * | sort -rh | head'
alias largefiles1='find . -type f -size +1M -exec du -h '{}' + | sort -hr | head'
alias largefiles2='find . -printf "%s %p\n"| sort -nr | head'
