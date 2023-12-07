set -x GHI_PAGER less
set -x GIT_SANDBOX $HOME/Projects/sandbox
set -x GIT_MERGE_AUTOEDIT no

if test -f (command -v hub)
  alias git "hub"
end

function git_time_since_last_commit 
  set ref (git symbolic-ref HEAD 2> /dev/null) or return
  git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/'
end

function g
  switch (count $argv)
    case "0" 
      set -l gtslc  (git_time_since_last_commit)
      printf "Last commit: (%s) ago\n" $gtslc
      git status --short --branch
    case "*"
      git $argv
  end
end

function sandbox
  pushd $GIT_SANDBOX and git clone $1 and cd (last_modified)
end
