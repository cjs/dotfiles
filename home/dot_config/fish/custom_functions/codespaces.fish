alias cslog="less /workspaces/.codespaces/.persistedshare/creation.log"

function chezmoi_refresh
  git -C /workspaces/.codespaces/.persistedshare/dotfiles pull
  chezmoi init --apply --source /workspaces/.codespaces/.persistedshare/dotfiles
end
