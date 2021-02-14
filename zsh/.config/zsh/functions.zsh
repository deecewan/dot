function format_js_file() {
  if ! which prettier > /dev/null; then
    echo "Install prettier first (yarn global add prettier)";
    return 1;
  fi

  prettier --single-quote --trailing-comma all $@
}

function with_amazon_keys() {
  local chosen_profile=$1
  if [ $# -gt 0 ]; then
    shift;
  fi;

  local AWS_CREDENTIAL_LOCATION="$HOME/.aws/credentials"
  local old_ifs="$IFS"
  local IFS=$'\n'
  local aws_credentials=("${(@f)$(cat $AWS_CREDENTIAL_LOCATION)}")
  local found=0
  local key
  local secret
  local name_options=()
  for line in $aws_credentials; do
    if [[ $line =~ "\[(.*)\]" ]]; then
      if [ $found -eq 1 ]; then
        break
      fi
      if [[ "$match" = "$chosen_profile" ]]; then
        found=1
      else
        name_options+=($match)
      fi
    fi

    if [ $found -eq 1 ]; then
      if [[ $line =~ "aws_access_key_id = (.*)" ]]; then
        key="$match"
      elif [[ $line =~ "aws_secret_access_key = (.*)" ]]; then
        secret="$match"
      fi
    fi
  done

  function usage() {
    opts=""
    for name in $name_options; do
      opts="$opts|$name"
    done
    opts=${opts:1}
    echo "Usage: \`[...other environment variables] with_amazon_keys <$opts> <command to run>\`"
    echo "Example: \`MY_ENV_VAR=123 with_amazon_keys ${name_options[1]} some_aws_command\`"
  }

  if [ -z $chosen_profile ]; then
    echo "ERROR: You must specify a profile"
    usage
    return 1
  fi

  if [ $# -eq 0 ]; then
    echo "ERROR: command to run not specified"
    usage
    return 1
  fi

  if [ $found -eq 0 ]; then
    echo "ERROR: Couldn't find credentials with that name"
    usage
    return 1
  fi

  if [[ -z $key || -z $secret ]]; then
    echo "ERROR: Couldn't load values for key and secret"
    usage
    return 1
  fi

  env AWS_ACCESS_KEY_ID="$key" AWS_SECRET_ACCESS_KEY="$secret" $@
}

function git-hub-clone() {
  TO_CLONE=""
  if [ $# -eq 1 ]; then
    TO_CLONE="$1"
  else
    TO_CLONE="$1/$2"
  fi

  git clone git@github.com:$TO_CLONE.git $HOME/projects/$TO_CLONE;
}

# prints a clock for random people
function gh_avatar_url() {
  echo "https://avatars1.githubusercontent.com/u/$1?v=3&s=50"
}

function clock() {
  local -A people
  names=(
    'David Buchan-Swanson'
    'Alex Ghiculescu'
    'Bryce Davies'
  )
  gh_avatar_ids=(
    '4755785'
    '509837'
    '-1'
  )
  time_zones=(
    'Australia/Brisbane'
    'America/Los_Angeles'
    'Europe/London'
  )

  for (( i = 1; i <= $#names; i++ )); do
    id=$gh_avatar_ids[$i]
    if [[ $id = "-1" ]]; then
      echo "NO IMAGE"
    else
      imgcat -u $(gh_avatar_url $id)
    fi
    echo "${names[$i]}"
    echo "Time: $(TZ=${time_zones[$i]} date)"
    echo "" # newline
  done
}

function with_aws_credentials() {
  CREDS=$(AWS_PROFILE=default aws\
    sts assume-role\
    --role-arn $ROLE_ARN\
    --role-session-name my-sls-session\
    --serial-number $MFA_SERIAL\
    --token-code $1\
    --out json)
  shift
  if [[ $# -eq 0 ]]; then
    echo "exporting credentials to this session"
    export AWS_ACCESS_KEY_ID=$(echo $CREDS | jq -r '.Credentials.AccessKeyId')
    export AWS_SECRET_ACCESS_KEY=$(echo $CREDS | jq -r '.Credentials.SecretAccessKey')
    export AWS_SESSION_TOKEN=$(echo $CREDS | jq -r '.Credentials.SessionToken')
  else
    env AWS_ACCESS_KEY_ID=$(echo $CREDS | jq -r '.Credentials.AccessKeyId')\
      AWS_SECRET_ACCESS_KEY=$(echo $CREDS | jq -r '.Credentials.SecretAccessKey')\
      AWS_SESSION_TOKEN=$(echo $CREDS | jq -r '.Credentials.SessionToken')\
      $@
  fi
}

function launch_emulator() {
  pushd "$ANDROID_SDK_ROOT/tools" || exit 1
  if ! tmux has-session -t android_emulator; then
    tmux new-session -s android_emulator -d
  fi
  tmux send -t android_emulator.0 'emulator @Nexus_5X_API_25' 'C-m'
  popd || exit 1
}

function attach_emulator() {
  if ! tmux has-session -t android_emulator; then
    echo -e "\\e[34mThe android emulator is not running\\e[0m"
    exit 1
  fi

  tmux attach-session -t android_emulator
}

source ~/.config/zsh/fzf.zsh

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
function fco() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout "$(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")"
}
