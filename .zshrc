# zshrc for esod
#
# aliases
source ~/.zsh_aliases

# vi mode enable
bindkey -v
# vi mode settings
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

# zsh profiling, if needed
zmodload zsh/zprof

# plugins
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# WARNING: seems like autoload and compinit is needed. TBD researc.
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
fpath=($HOME/.zsh/zsh-completions/src $fpath)
autoload -U compinit promptinit
compinit

# I really like nvim
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi


# nvim as pager for man
export MANPAGER='nvim +Man!'

# zsh-vi-mode initialization mode overwriters previous keybindings, let's load them after.
# define an init function and append to zvm_after_init_commands
function my_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(my_init)

# zsh history options
setopt hist_ignore_space
setopt hist_ignore_dups
# setopt hist_verify
unset HISTFILESIZE
HISTSIZE=20000

# theme via oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/powerlevel10k_rainbow-esod.omp.json)"

# zoxide aka `z` for `cd`
eval "$(zoxide init zsh)"
