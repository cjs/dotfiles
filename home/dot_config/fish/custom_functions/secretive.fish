# Secretive
set -l ssh_socket /Users/cjs/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
if test -S "$ssh_socket"
  set -x SSH_AUTH_SOCK $ssh_socket
end
