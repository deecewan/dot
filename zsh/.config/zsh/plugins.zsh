export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

function load_plugins() {
  # add all plugins here
  zplug 'zsh-users/zsh-syntax-highlighting'
  zplug 'rupa/z', as:plugin, use:"z.sh"
}

load_plugins

if ! zplug check; then
  zplug install
fi

zplug load
