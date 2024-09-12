if [[ "$OSTYPE" == "darwin"* ]]; then
  # Disable macOS save/restore shell state
  export SHELL_SESSIONS_DISABLE=1

  # Homebrew env vars
  eval $(/opt/homebrew/bin/brew shellenv)
fi
