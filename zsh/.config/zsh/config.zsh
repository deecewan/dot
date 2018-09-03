bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey -M vicmd "k" history-beginning-search-backward
bindkey -M vicmd "j" history-beginning-search-forward

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

