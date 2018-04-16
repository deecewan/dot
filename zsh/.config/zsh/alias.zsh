# Define all my aliases

# renaming
alias vi="nvim"
alias ls="exa"

# ls
alias l="ls -alh"

# Git
alias gst="git status"
alias gd="git diff"
alias gc="git commit -v"
alias gca="gc -a"
alias gcam="gca -m"
alias gp="git push"
function gpu() {
  location=${1:-origin}
  echo "Setting \`$location\` as the remote"
  git push -u $location $(git rev-parse --abbrev-ref HEAD)
}
