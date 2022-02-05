function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
  if test -d $argv[1]
    if not contains $argv[1] $PATH
      set -gx PATH "$argv[1]" $PATH
    end
  end
end

prepend_to_path "/usr/local/bin"
prepend_to_path "$HOME/bin"
prepend_to_path "./bin"
prepend_to_path "$HOME/github/gh-helper-cli/exe"

# base-16
if status --is-interactive
   source $HOME/.config/base16-shell/profile_helper.fish
end

base16-nord

set -x -g DOTFILES "$HOME/.dotfiles"
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

source (brew --prefix asdf)/libexec/asdf.fish
