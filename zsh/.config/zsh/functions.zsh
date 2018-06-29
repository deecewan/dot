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
    TO_CLONE="$1/$1"
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

function release_test_builds() {
  if [[ "-h" = $1 ]]; then
    cat <<EOF
      release_test_builds
        -> Releases beta builds from your computer to Github, via S3

      usage: release_test_builds <pr number> [android|ios]
        pr number: the number of the PR to comment on on GH
        [platform]: Optional, the platform to release. Defaults both.

      options:
        -h: print this help text
EOF
    echo "release_test_builds"
    return 1;
  fi

  if [[ -z $DANGER_GITHUB_API_TOKEN ]]; then
    echo "You must provide a github API token"
    echo "Try adding DANGER_GITHUB_API_TOKEN=<token> to the start of the command"
    echo "Like: \`DANGER_GITHUB_API_TOKEN=<token> $0 $@\`"
    return 1
  fi

  if [[ -z $1 ]]; then
    echo "ERROR: PR number not provided"
    release_test_builds -h
    return 1
  fi

  CIRCLE_SHA1="$(git rev-parse HEAD)"\
    QA_BUILD=true\
    CIRCLE_BRANCH="$(git rev-parse --abbrev-ref HEAD)"\
    CIRCLE_PR_NUMBER="$1"\
    CI_PULL_REQUEST="test/$1"\
    with_amazon_keys SandboxAdmin\
    bundle exec fastlane "$2" branches
}

function with_aws_credentials() {
  CREDS=$(AWS_PROFILE=default aws\
    sts assume-role\
    --role-arn $ROLE_ARN\
    --role-session-name my-sls-session\
    --serial-number $MFA_SERIAL\
    --token-code $1\
    --out json)
  env AWS_ACCESS_KEY_ID=$(echo $CREDS | jq -r '.Credentials.AccessKeyId')\
    AWS_SECRET_ACCESS_KEY=$(echo $CREDS | jq -r '.Credentials.SecretAccessKey')\
    AWS_SESSION_TOKEN=$(echo $CREDS | jq -r '.Credentials.SessionToken')\
    $@
}

source ~/.config/zsh/payaus.zsh
