fish_add_path /usr/local/bin
fish_add_path "$HOME/bin"
fish_add_path ~/.local/bin
fish_add_path "./bin"
fish_add_path "$HOME/github/gh-helper-cli/exe"

# base-16
#if status --is-interactive
#   source $HOME/.config/base16-shell/profile_helper.fish
#   base16-nord
#end


set -x -g DOTFILES "$HOME/.dotfiles"
set -x -g PROJECTS "$HOME/code"


for i in ~/.config/fish/custom_functions/*.fish
    source $i
end


if type -q fzf and type -q rg
    set -x FZF_DEFAULT_COMMAND 'rg -g "" --files'
    set -x FZF_CTRL_T_COMMAND $$FZF_DEFAULT_COMMAND
    set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND

    source ~/.config/base16-fzf/fish/base16-nord.fish
end

# command -v vg >/dev/null 2>&1; and vg eval --shell fish | source

# THEME PURE #
#set fish_function_path /Users/cjs/.config/fish/functions/theme-pure/functions/ $fish_function_path
#source /Users/cjs/.config/fish/functions/theme-pure/conf.d/pure.fish

# zoxide
if type -q zoxide
    zoxide init fish | source
end

#asdf
if type -q asdf
    source (brew --prefix asdf)/libexec/asdf.fish
end


#direnv
if type -q direnv
    direnv hook fish | source
end

# vscode 
if string match -q "$TERM_PROGRAM" vscode
    source (code --locate-shell-integration-path fish)
end

# Secretive
if type -s $secretive_socketfile
    set -l secretive_socketfile /Users/cjs/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
    set -x SSH_AUTH_SOCK $secretive_socketfile
end
