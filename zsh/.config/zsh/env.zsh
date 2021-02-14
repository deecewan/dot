export ANDROID_SDK_ROOT="/Users/david/Library/Android/sdk/"
export ANDROID_SDK_HOME="$ANDROID_SDK_ROOT"
export ANDROID_NDK_HOME="$ANDROID_SDK_ROOT/ndk/21.0.6113669"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export EDITOR="nvim"
export KEYTIMEOUT=1
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) # default to older java
export GPG_TTY=$(tty)
export DOCKER=false

export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

path=(
  $path
  $HOME/.cargo/bin
  /Library/TeX/Distributions/Programs/texbin/
  $HOME/.dotnet/tools
  $HOME/flutter/bin
  $HOME/.deno/bin
  $ANDROID_HOME/platform-tools
  $ANDROID_HOME/tools
  $ANDROID_HOME/tools/bin
  $ANDROID_NDK_HOME/build
  $HOME/.yarn/bin
  $HOME/.config/yarn/global/node_modules/.bin
)
