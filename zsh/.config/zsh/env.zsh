export ANDROID_SDK_ROOT="/Users/david/Library/Android/sdk/"
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export EDITOR="nvim"
export KEYTIMEOUT=1
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) # default to older java

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
)
