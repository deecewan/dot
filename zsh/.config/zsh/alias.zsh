# Define all my aliases

# renaming
alias vi="nvim"
alias ls="exa"

# ls
alias l="ls -alh"

# almost always want this
alias fastlane="bundle exec fastlane"

# shorthand for paket
alias paket="mono ./.paket/paket.exe"

# cheeky shorthand to open the current directory in finder
alias o="open ."

# Git
alias gst="git status"
alias gs="gst"
alias gd="git diff"
alias gds="gd --staged"
alias gc="git commit -v"
alias gca="gc -a"
alias gcm="gc -m"
alias gcam="gca -m"
alias gp="git push"
alias ga="git add"
alias gap="ga -p"
alias gco="git checkout"
alias gcon="git checkout -b"
alias gclear="git checkout --"
function gpu() {
  location=${1:-origin}
  if [[ $# -gt 0 ]]; then
    shift
  fi
  echo "Setting \`$location\` as the remote"
  git push -u $location $@ $(git rev-parse --abbrev-ref HEAD)
}
