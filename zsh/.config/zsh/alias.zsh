# Define all my aliases

# renaming
alias vi="nvim"
alias ls="exa"
alias cat="bat"

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
alias gco="echo \"use \\\`git switch\\\` (\\\`gsw\\\`) or \\\`git restore\\\` (\\\`gre\\\`) instead\""
alias gsw="git switch"
alias gre="git restore"
alias gswc="git switch -c"
alias grs="git rebase --autostash --autosquash -i origin/master"
alias glp="git log --pretty=oneline"
function gpu() {
  location=${1:-origin}
  if [[ $# -gt 0 ]]; then
    shift
  fi
  if [[ "$(git status -sb)" =~ '\.\.\.' ]]; then
    echo "Already has a remote!"
    return
  fi
  echo "Setting \`$location\` as the remote"
  git push -u $location $@ $(git rev-parse --abbrev-ref HEAD)
}
