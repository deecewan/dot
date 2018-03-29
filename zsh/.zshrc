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

# my common aliases
alias ls="exa"
alias l="ls -alh"
alias vi="nvim"

export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="vi"
export KEYTIMEOUT=1

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
