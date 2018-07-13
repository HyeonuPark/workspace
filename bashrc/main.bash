
# extract current git branch name if exist
function git-current-branch {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

# return true if this script has not been executed within this session
# note that bashrc should be idempotent
function is-init {
  if [[ "$WORKSPACE_BASHRC" == "DEFINED" ]]
    then return 1
    else return 0
  fi
}

BASHRC="$WORKSPACE_DIR/bashrc"

source "$BASHRC/git.bash"
source "$BASHRC/cargo.bash"
source "$BASHRC/misc.bash"

export WORKSPACE_BASHRC="DEFINED"
