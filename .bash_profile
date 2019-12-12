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
	if ! [ -x "$(command -v git)" ]; then
	  echo "  ...argh, you don't have git installed"
	else
	  git branch -v -a
	fi
  fi;
  return $RET
}

# Handy wrap of grep
grepp() {
  # For easier grepping: preceeding and following lines, line numbers, ignore case, recursive
  #   Defaults to current directory
  #   Ex: grepp query_term ~/dir1      (last param optional)
  variable2=${2:-"."}
  echo ${variable2}
  grep --color=always -A 2 -B 2 -irn $1 ${variable2}
}

