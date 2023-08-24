# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# For more template settings, see ~/.oh-my-zsh/templates/zshrc.zsh-template
# For zstyle settings, see output from zstyle -L

# omz auto-update behavior (disabled, auto, reminder)
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# omz auto-update (in days)
zstyle ':omz:update' frequency 10

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  vi-mode
  zsh-syntax-highlighting
  zsh-autosuggestions
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# aliases
source ~/.zsh_aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable profiling zsh with zprof
zmodload zsh/zprof

# Obsidian OCR path workaround
# source /opt/homebrew/Cellar/tesseract/5.2.0/bin
# source /opt/homebrew/Cellar/tesseract/5.2.0/bin
# source /opt/homebrew/Cellar/graphicsmagick/1.3.38/bin
# source /opt/homebrew/Cellar/imagemagick/7.1.0-43/bin
# source /opt/homebrew/Cellar/ghostscript/9.56.1/bin

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubectl completion for zsh
source <(kubectl completion zsh)

# enable vi mode for zsh
bindkey -v

# vi mode settings
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

# nvim as pager for man
export MANPAGER='nvim +Man!'
