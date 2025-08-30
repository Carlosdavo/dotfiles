# aliases
alias ls "eza --icons"
alias treelist "tree -a -I '.git'"

# prevents apps from closing when closing terminal
# usage: stay <command>
function stay
    nohup $argv >/dev/null 2>&1 </dev/null & disown
end

# custom greeting
set KERNEL (uname -r)
set fish_greeting (set_color --bold efcf40)">"(set_color ef9540)"<"(set_color ea3838)">" \
    (set_color normal)"fish $FISH_VERSION" \
    (set_color normal)"| $KERNEL"

function fish_user_key_bindings
    fish_vi_key_bindings

    # set kj to <Esc>
    bind -M insert -m default kj backward-char force-repaint
end

starship init fish | source
zoxide init fish | source
atuin init fish | source
fzf --fish | source

# UNCOMMENT FOR RIGHT PROMPT 
# function fish_right_prompt
#   echo (set_color 71717a)"$USER"@(prompt_hostname)
# end

# indicator for vi
function fish_mode_prompt
    switch "$fish_bind_mode"
        case default
            echo -n (set_color --bold f43f5e)"N"
        case insert
            echo -n (set_color --bold 84cc16)"I"
        case visual
            echo -n (set_color --bold 8b5cf6)"V"
        case "*"
            echo -n (set_color --bold)"?"
    end

    echo -n " "
end

# always use block caret (vimode)
set -U fish_cursor_default block

# custom prompt
function fish_prompt
    set_color --bold 4086ef

    set transformed_pwd (prompt_pwd | string replace -r "^~" (set_color --bold 06b6d4)"~"(set_color --bold 3b82f6))

    echo -n $transformed_pwd

    # git branch  
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        #space
        echo -n " "

        echo -n (set_color --bold 4338ca)"("

        set_color f0abfc
        echo -n (git branch --show-current)

        echo -n (set_color --bold 4338ca)")"
        set_color normal
    end

    # space
    echo -n " "

    # arrows
    # echo -n (set_color --bold efcf40)"❱"
    # echo -n (set_color --bold ef9540)"❱"
    # echo -n (set_color --bold ea3838)"❱"

    echo -n (set_color --bold 14b8a6)"→"

    #space
    echo -n " "

    set_color normal

end

# Init Starship
if status --is-interactive
    starship init fish | source
end

# set environment variables
fish_add_path /usr/local/bin
fish_add_path /opt/bin

# set editor
set -x EDITOR vim

set QT_QPA_PLATFORM xcb

# fzf
# export FZF_DEFAULT_OPTS="
# --bind='ctrl-j:down,ctrl-k:up,ctrl-t:toggle-all,ctrl-v:toggle-preview,ctrl-space:toggle-preview'
# --color=fg:#ffffff,hl:#00ff00,fg+:#a5b4fc,bg+:#737373,hl+:#ffff00,info:#14b8a6,spinner:#00ffff,pointer:#f59e0b
# "
# if not test -d ~/.config/fish/completions
# mkdir -p ~/.config/fish/completions
#end

# if not test -f ~/.config/fish/completions/.initialized
#    if not test -d ~/.config/fish/completions
#        mkdir -p ~/.config/fish/completions
#    end
#    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish
#    touch ~/.config/fish/completions/.initialized
# end

# carapace _carapace | source

set -g fish_greeting ""

# Enable vi mode
fish_vi_key_bindings
#!/usr/bin/fish

# Kanagawa Fish shell theme
# A template was taken and modified from Tokyonight:
# https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish
set -l foreground DCD7BA normal
set -l selection 2D4F67 brcyan
set -l comment 727169 brblack
set -l red C34043 red
set -l orange FF9E64 brred
set -l yellow C0A36E yellow
set -l green 76946A green
set -l purple 957FB8 magenta
set -l cyan 7AA89F cyan
set -l pink D27E99 brmagenta

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
clear
alias spotify=spotify-launcher
