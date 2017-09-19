#set fisher_home ~/.local/share/fisherman
#set fisher_config ~/.config/fisherman
#source $fisher_home/fisher.fish

prepend_to_path "/usr/local/sbin"
prepend_to_path "$HOME/.dotfiles/bin"
prepend_to_path "$HOME/bin"
prepend_to_path "$HOME/anaconda/bin"
prepend_to_path "./bin"

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

#source $DOTFILES/fish/functions/iterm_integration.fish_manual

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
