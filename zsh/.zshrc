fpath=(/usr/local/share/zsh-completions ~/.config/zsh/completions $fpath)
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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.env
source ~/.config/zsh/env.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/config.zsh
source ~/.config/zsh/alias.zsh
source ~/.config/zsh/functions.zsh

# OPAM configuration
source /Users/david/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
