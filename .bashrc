# File: .bashrc for esod
# See https://github.com/esodesod/dotfiles/

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -hAlF'
alias l='ls $LS_OPTIONS -1hAF'