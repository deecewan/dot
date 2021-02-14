#     zmodload zsh/zprof
fpath=(/usr/local/share/zsh-completions ~/.config/zsh/completions $fpath)
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd
bindkey -v
# End of lines configured by zsh-newuser-install

autoload -U promptinit && promptinit

zstyle ':completion:*' menu select

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# OPAM configuration
source /Users/david/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

[ -f ~/projects/ferocia/up/.zsh-up-completion/init.zsh ] && source ~/projects/ferocia/up/.zsh-up-completion/init.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Plugins
zinit ice pick"minimal.zsh"
zinit load subnixr/minimal

zinit wait lucid for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions \
  pick"z.sh" \
      rupa/z

zinit ice wait lucid
zinit snippet OMZL::history.zsh
zinit ice wait lucid
zinit load asdf-vm/asdf
#     zprof

source ~/.env
source ~/.config/zsh/env.zsh
source ~/.config/zsh/config.zsh
source ~/.config/zsh/alias.zsh
source ~/.config/zsh/functions.zsh

