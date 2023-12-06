fish_add_path /usr/local/bin
fish_add_path ~/bin
fish_add_path ./bin
fish_add_path ~/github/gh-helper-cli/exe
fish_add_path go/bin
fish_add_path .local/bin

# base-16
#if status --is-interactive
#   source $HOME/.config/base16-shell/profile_helper.fish
#   base16-nord
#end


set -x -g PROJECTS "$HOME/code"


for i in ~/.config/fish/custom_functions/*.fish
  source $i
end


if type -q fzf and type -q rg
  set -x FZF_DEFAULT_COMMAND 'rg -g "" --files'
  set -x FZF_CTRL_T_COMMAND $$FZF_DEFAULT_COMMAND
  set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND

  source  ~/.config/base16-fzf/fish/base16-nord.fish
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
source (brew --prefix asdf)/libexec/asdf.fish

#direnv
if type -q direnv
  direnv hook fish | source
end
  
# vscode 
string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)

# Secretive

set -x SSH_AUTH_SOCK /Users/cjs/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
