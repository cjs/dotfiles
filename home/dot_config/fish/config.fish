fish_add_path /usr/local/bin
fish_add_path "$HOME/bin"
fish_add_path ~/.local/bin
fish_add_path "./bin"
fish_add_path "$HOME/github/gh-helper-cli/exe"

set -x -g PROJECTS "$HOME/code"

for i in ~/.config/fish/custom_functions/*.fish
    source $i
end

if type -q fzf and type -q rg
    set -x FZF_DEFAULT_COMMAND 'rg -g "" --files'
    set -x FZF_CTRL_T_COMMAND $$FZF_DEFAULT_COMMAND
    set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND

    # Nord color scheme for fzf (base16-nord palette)
    set -Ux FZF_DEFAULT_OPTS \
        "--color=bg+:#3b4252,bg:#2e3440,spinner:#88c0d0,hl:#81a1c1" \
        "--color=fg:#d8dee9,header:#81a1c1,info:#ebcb8b,pointer:#88c0d0" \
        "--color=marker:#88c0d0,fg+:#eceff4,prompt:#ebcb8b,hl+:#81a1c1"
end

# command -v vg >/dev/null 2>&1; and vg eval --shell fish | source

# zoxide
if type -q zoxide
    zoxide init fish | source
end

# gh hubber-skills
gh hubber-skills completion fish | source

#direnv
if type -q direnv
    direnv hook fish | source
end

# vscode 
if string match -q "$TERM_PROGRAM" vscode
    source (code --locate-shell-integration-path fish)
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/cjs/.lmstudio/bin
# End of LM Studio CLI section

# GitHub Ace
fish_add_path $HOME/.ace/bin
