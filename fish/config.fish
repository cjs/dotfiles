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
  if echo $i |grep -vq -e 'fish.symlink' -e 'fish/functions' -e 'config.fish' -e 'fisher.fish'
    source $i
  end
end


if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    # curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    # fish -c fisher
    echo fisher not installed
end
#source $DOTFILES/fish/functions/iterm_integration.fish_manual

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

command -v vg >/dev/null 2>&1; and vg eval --shell fish | source
