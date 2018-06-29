fpath=(~/.config/zsh/completions $fpath)
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit && promptinit
prompt filthy

zstyle ':completion:*' menu select

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Plugins Go Here
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'rupa/z', as:plugin, use:"z.sh"

if ! zplug check; then
  zplug install
fi

zplug load
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.env
source ~/.config/zsh/alias.zsh
source ~/.config/zsh/functions.zsh

export PATH="$HOME/.cargo/bin:$PATH:/Library/TeX/Distributions/Programs/texbin/"
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

function zle-line-init zle-keymap-select {
  local CURSOR_SHAPE=0
  local MODE="INSERT"
  local COLOR=42;
  case $KEYMAP in
    vicmd)
      MODE="NORMAL"
      COLOR=44
      CURSOR_SHAPE=0
      ;;
    *)
      MODE="INSERT"
      COLOR=42
      CURSOR_SHAPE=1
      ;;
  esac

  printf "\u001b]50;CursorShape=$CURSOR_SHAPE\x7"

  (( start = $COLUMNS - 9 ))
  printf "\033[s" # save the cursor position
  printf "\033[0;${start}f" # move the cursor to the top right
  printf " " # space the indicator by 1
  printf "\u001b[${COLOR}m" # make the text the correct color
  printf "\u001b[30m" # make the foreground black
  printf " $MODE " # print what more we're in
  printf "\u001b[0m" # reset the text
  printf "\033[u" # reset the cursor position
}

zle -N zle-keymap-select
zle -N zle-line-init

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

# OPAM configuration
. /Users/david/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
