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

# use ripgrep for searching files
FZF_CTRL_T_COMMAND="rg --hidden --files"
# use fzf-preview.sh
FZF_DEFAULT_OPTS="--preview='fzf-preview.sh {}' --height=100% --layout=reverse"
