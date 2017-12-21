# CLI prompt, only shows current dir, less is more
PS1='\W $ '

# When 'tree' is not available, enter the poor man's treee
alias treee="find | sed 's|[^/]*/|- |g'"

# Override 'cd', detect if git project if so display branches
function cd {
  builtin cd "$@"
  RET=$?
  if [ -d .git ]; then
    echo " Git project: getting branches..."
    git branch -v -a
  fi;
  return $RET
}
