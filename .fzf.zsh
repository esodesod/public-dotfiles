# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# default ctrl-t options
FZF_CTRL_T_COMMAND="fd --hidden --follow --exclude .git"
# use fzf-preview.sh
FZF_CTRL_T_OPTS="--bind='ctrl-k:page-up' --bind='ctrl-j:page-down' --bind='ctrl-u:preview-half-page-up' --bind='ctrl-d:preview-half-page-down' --preview='fzf-preview.sh {}' --height=100% --layout=default"

FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'
