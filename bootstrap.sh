#!/bin/zsh

# Set this flag to enable debug mode
DEBUG=0

if [ $DEBUG -eq 1 ]; then
  set -x
fi

# --- SETUP COLORS ---
color() {
  echo -n "\u001b[38;5;$1m"
}

cyan() {
  color 45
}

green() {
  color 82
}

red() {
  color 196
}

yellow() {
  color 226
}

reset() {
  echo -n "\u001b[0m"
}

# --- END COLORS ---

# --- HELPERS ---
# prints a welcome message for a step
print_message() {
  echo "$(cyan)$@$(reset)"
}

# runs the command but silences the output
silent() {
  $@ > /dev/null
}

# --- STEPS ---
verify_location() {
  if [ ! -f Brewfile ]; then
    # pretty weak check, but oh well!
    echo "$(red)Bootstrap Failed!$(clear)"
    echo "$(red)You must be in the dotfiles folder$(clear)"
    exit 1
  fi
}

request_sudo_access() {
  echo "  $(yellow)Requesting sudo access to perform bootstrap$(reset)"
  if sudo -v; then # verify sudo access
    echo "  $(green)sudo access provided$(reset)" # literally just requests sudo
  else
    echo "  $(red)ERROR: sudo is required to continue$(reset)"
    exit 1
  fi
}

install_homebrew() {
  print_message "Installing homebrew..."
  # this is more or less static
  silent /usr/bin/ruby -e\
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"\
    </dev/null # go non-interactive
}

install_homebrew_packages() {
  print_message "Installing homebrew packages from Brewfile"
  silent brew bundle install
}

unpack_from_stow() {
  print_message "Restoring stowpoints..."
  STOW_POINTS=($(echo */))

  for point in $STOW_POINTS; do
    echo -n "  $(cyan)--> stow point: $point...$(reset)"
    stow $point
    echo "$(green)complete!$(reset)"
  done
}

setup_shell() {
  print_message "Setting shell to ZSH"
  SHELL_PATH="$(brew --prefix)/bin/zsh"
  # check if it's in the thing
  if cat /etc/shells | silent grep "$SHELL_PATH"; then
    echo "  $(yellow)Homebrew ZSH already in /etc/shells$(reset)"
  else
    # put it there
    echo "\n$SHELL_PATH" | sudo tee -a /etc/shells > /dev/null
    echo "  $(green)Updated /etc/shells with $SHELL_PATH$(reset)"
  fi

  sudo chsh -s /usr/local/bin/zsh $USER > /dev/null 2>&1 
}
# --- END STEPS ---

# This whole process should be more or less idempotent
bootstrap() {
  echo "$(cyan)Starting bootstrap! 🎊 $(reset)"
  # verify_location
  # request_sudo_access
  # install_homebrew
  # install_homebrew_packages
  # unpack_from_stow
  # setup_shell
  echo "$(green)🎉  Bootstrap Complete!$(reset)"
}

bootstrap

if [ $DEBUG -eq 1 ]; then
  set +x
fi