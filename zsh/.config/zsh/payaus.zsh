__PAYAUS_URL="local.tanda.co"
__PAYAUS_LOCATION=~/projects/TandaHQ/payaus

function _payaus_get_names() {
  local raw_fns=${(Mok)functions:#__payaus_*}
  local -a fns
  for i in $raw_fns; do
    fns+=(${i:gs/__payaus_//})
  done
}

function payaus() {
  if [[ $# -eq 0 ]]; then
    echo "Please select an operation"
    local raw_fns=${(Mok)functions:#__payaus_*}
    local -a fns
    for i in $raw_fns; do
      fns+=(${i:gs/__payaus_//})
    done
    echo "Available operations: ${(j:,:)fns}"
    return 1
  fi
  local selected=$1
  echo "selected is $selected"
  shift
  __payaus_$selected $@
}

# to add new functionality, create a `__payaus_<name>` ZSH function
# to add a description to the root completion, create a
# `_payaus_<name>_description` function and `print` a string
# to add completions to your new functions, create a
# `_payaus_<name>_completion` function that creates some completion candidates
# see `_payaus_sync_completion` for an example
# NOTE: for completions to work, you'll need the completion file (_payaus) in
# your fpath

function _payaus_attach_description() {
  print "attach description"
}
function __payaus_attach() {
  __payaus_enter -t tmux a
}

function _payaus_enter_description() {
  print "enter description"
}
function __payaus_enter() {
  ssh deployer@$__PAYAUS_URL $@
}

function _payaus_sync_description() {
  print "sync description"
}
function _payaus_sync_completion() {
  local -a subcmds
  subcmds=('start:start the syncer' 'stop:stop the syncer')
  _describe 'command' subcmds
}
function __payaus_sync() {
  if [[ $# -eq 0 ]]; then
    echo "Select one of: start|stop"
    echo "Example: payaus sync start"
    return 1;
  fi

  local tmux_session_name="payaus-sync-session"
  local tmux_command="tmux new-session -s '$tmux_session_name'"
  function has_session() {
    if tmux has-session -t $tmux_session_name >> /dev/null; then
      return 0;
    fi
    return 1;
  }

  case $1 in
    start)
      if has_session; then
        echo "tmux session for the syncer already started"
        echo "restarting currently not supported"
        return 1;
      fi

      tmux new-session -s $tmux_session_name -d "cd $__PAYAUS_LOCATION && ./useful_scripts/dev-server/start-sync.sh entangler"
      ;;
    stop)
      if ! has_session; then
        echo "no session started - can't stop"
        return 1;
      fi
      tmux kill-session -t $tmux_session_name
      ;;
    *)
      echo "supported options: start, stop"
      return 1
      ;;
  esac
}
