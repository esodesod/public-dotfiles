if status is-interactive
    # supress fish greeting
    set fish_greeting
    # vim everywhere
    function fish_user_key_bindings
        fish_vi_key_bindings
    end
    set -x MANPAGER "nvim +Man!"
    set -gx EDITOR "nvim"
    set -gx VISUAL "nvim"

    # fish_git_prompt -- https://fishshell.com/docs/current/cmds/fish_git_prompt.html
    set __fish_git_prompt_show_informative_status true
    set __fish_git_prompt_showdirtystate true
    set __fish_git_prompt_showcolorhints true
    set __fish_git_prompt_showuntrackedfiles true
    set __fish_git_prompt_showupstream verbose
    set __fish_git_prompt_showstashstate true

    # homebrew
    /opt/homebrew/bin/brew shellenv | source

    # fzf
    fzf --fish | source
end
