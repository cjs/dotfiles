alias chezcom="git commit -m (chezmoi generate git-commit-message)"

set -g chezmoi_sourcepath (chezmoi execute-template '{{ .chezmoi.sourceDir }}')
