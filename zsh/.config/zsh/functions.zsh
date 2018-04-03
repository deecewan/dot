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
