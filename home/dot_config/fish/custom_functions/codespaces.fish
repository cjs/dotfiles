fish_add_path ~/.local/bin
alias cslog="less /workspaces/.codespaces/.persistedshare/creation.log"

function chezmoi_refresh
    git -C /workspaces/.codespaces/.persistedshare/dotfiles pull
    chezmoi init --apply --source /workspaces/.codespaces/.persistedshare/dotfiles
end

if type -f /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

rbenv init - | source
