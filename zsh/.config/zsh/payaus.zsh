__PAYAUS_URL="local.tanda.co"
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

function __payaus_attach() {
  __payaus_enter -t tmux a
}

function __payaus_enter() {
  ssh deployer@$__PAYAUS_URL $@
}

