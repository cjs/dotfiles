function last_modified
  ls -t $argv 2> /dev/null | head -n 1
end
