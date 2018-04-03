# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit && promptinit
prompt filthy

source ~/.config/zsh/alias.zsh
source ~/.config/zsh/functions.zsh

# my common aliases
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="vi"
export KEYTIMEOUT=1
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) # default to older java
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey -M vicmd "k" history-beginning-search-backward
bindkey -M vicmd "j" history-beginning-search-forward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TODO move these somewhere else
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin"

# Add rust to path
export PATH="$HOME/.cargo/bin:$PATH"
