function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
  if test -d $argv[1]
    if not contains $argv[1] $PATH
      set -gx PATH "$argv[1]" $PATH
    end
  end
end

prepend_to_path "/usr/local/bin"
prepend_to_path "$HOME/.dotfiles/bin"
prepend_to_path "$HOME/bin"
prepend_to_path "./bin"
prepend_to_path "$HOME/github/gh-helper-cli/exe"

# base-16
set base16_shell ~/.config/base16-shell/base16-eighties.dark.sh
if status --is-interactive
  if test -f $base_16_shell
    sh $base16_shell
  end
end

set -x -g DOTFILES "$HOME/.dotfiles"
set -x -g PROJECTS "$HOME/code"

for i in $DOTFILES/**/*.fish
  if echo $i |grep -vq -e 'fish.symlink' -e 'fish/functions' -e 'config.fish'
    source $i
  end
end


if type -q fzf and type -q rg
  set -x FZF_DEFAULT_COMMAND 'rg -g "" --files'
  set -x FZF_CTRL_T_COMMAND $$FZF_DEFAULT_COMMAND
  set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND

  # Base16 Eighties
  # Author: Chris Kempson (http://chriskempson.com)
  # From https://github.com/nicodebo/base16-fzf/blob/master/fish/base16-eighties.fish

  set -l color00 '#2d2d2d'
  set -l color01 '#393939'
  set -l color02 '#515151'
  set -l color03 '#747369'
  set -l color04 '#a09f93'
  set -l color05 '#d3d0c8'
  set -l color06 '#e8e6df'
  set -l color07 '#f2f0ec'
  set -l color08 '#f2777a'
  set -l color09 '#f99157'
  set -l color0A '#ffcc66'
  set -l color0B '#99cc99'
  set -l color0C '#66cccc'
  set -l color0D '#6699cc'
  set -l color0E '#cc99cc'
  set -l color0F '#d27b53'

  set -U FZF_DEFAULT_OPTS "
    --color bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
    --color fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
    --color marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
end
#source $DOTFILES/fish/functions/iterm_integration.fish_manual

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# command -v vg >/dev/null 2>&1; and vg eval --shell fish | source
# THEME PURE #
set fish_function_path /Users/cjs/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /Users/cjs/.config/fish/functions/theme-pure/conf.d/pure.fish

# zoxide
if type -q zoxide
  zoxide init fish | source
end

source /usr/local/opt/asdf/libexec/asdf.fish
