# esod : default bash_profile

# source bashrc if exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# some exports & pretty colors
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# histcontrol (more goodies in the bashrc)
export HISTTIMEFORMAT='%F %T '
