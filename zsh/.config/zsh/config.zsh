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

FZF_CTRL_T_OPTS="--preview 'bat --color always --paging never {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Prompt Setup
MNML_MAGICENTER=(mnml_me_git)
MNML_INFOLN=(mnml_err mnml_jobs mnml_uhp)
