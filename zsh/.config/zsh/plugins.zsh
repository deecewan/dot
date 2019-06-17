export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

function load_plugins() {
  # add all plugins here
  zplug 'rupa/z', as:plugin, use:"z.sh"
  zplug 'subnixr/minimal', from:github, use:minimal.zsh, as:theme
  zplug 'lib/history', from:oh-my-zsh
  zplug 'zdharma/fast-syntax-highlighting'
}

load_plugins

if ! zplug check; then
  zplug install
fi

zplug load
