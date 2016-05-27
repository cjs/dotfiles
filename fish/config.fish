set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

prepend_to_path "/usr/local/sbin"
prepend_to_path "$HOME/.dotfiles/bin"
prepend_to_path "$HOME/bin"
prepend_to_path "./bin"

# base-16
set base16_shell ~/.config/base16-shell/base16-eighties.dark.sh
if test -f $base16_shell
  eval sh $base16_shell
end

set -x -g DOTFILES "$HOME/.dotfiles"
set -x -g PROJECTS "$HOME/code"

for i in $DOTFILES/**/*.fish
  if echo $i |grep -vq -e 'fish.symlink' -e 'fish/functions' -e 'config.fish'
    source $i
  end
end
