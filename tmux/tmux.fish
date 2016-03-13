# Wrap ssh commmand to allow smart pane behavior in tmux.
#
# Lifted from https://github.com/moonboots/tmux-ssh/blob/master/tmux-sshrc
#
# After opening a tmux window and ssh-ing into another server, new panes will
# open already ssh-ed to the server.
function ssh
  if test  -n "$TMUX"  # set only if within running tmux
    set window_index (tmux display-message -p '#I')

    # arbitrary environment variable name to remember ssh args like server
    # hostname so we can connect again.
    set session_variable_name "window_{$window_index}_ssh_args"

    # save in tmux session variable
    tmux setenv $session_variable_name "$argv"

    # set window title
    tmux rename-window $argv

    # run ssh
    /usr/bin/ssh $argv

    # unset variable so new panes don't continue ssh-ing to this server
    tmux setenv -u $session_variable_name
  else
    /usr/bin/ssh $argv
  end

  # rename title back
  tmux rename-window fish
end


