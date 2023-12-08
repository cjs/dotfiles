alias cslog="less /workspaces/.codespaces/.persistedshare/creation.log"

function chezmoi_refresh
    git -C /workspaces/.codespaces/.persistedshare/dotfiles pull
    chezmoi init --apply --source /workspaces/.codespaces/.persistedshare/dotfiles
end

if type -e /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

eval (rbenv init -)
