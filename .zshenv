# Set ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh" in /etc/zsh/zshenv

# Don't source /etc/* Zsh files
setopt no_global_rcs

export PAGER="${PAGER:-less}"
export LESS="${LESS:--R}"

export EDITOR="${EDITOR:-nano}"

export _CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export _STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export _DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export _CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Dotfolders
export WGETRC="$_CONFIG_HOME/wgetrc"
# Doesn't really work because of systemd user units and socket-based activation
# export GNUPGHOME="$_CONFIG_HOME/gnupg"
# [[ ! -d ${GNUPGHOME} ]] && mkdir -m 700 "${GNUPGHOME}"
export GR_PREFS_PATH="$_CONFIG_HOME/gnuradio"
export GRC_PREFS_PATH="$_CONFIG_HOME/gnuradio/grc.conf"
export GTK2_RC_FILES="$_CONFIG_HOME/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$_CONFIG_HOME/java"
export DOCKER_CONFIG="$_CONFIG_HOME/docker"
export LESSHISTFILE="$_STATE_HOME/less/lesshst"
export PYTHON_HISTORY="$_STATE_HOME/python_history"
export RUSTUP_HOME="$_DATA_HOME"/rustup
export CARGO_HOME="$_DATA_HOME/cargo"
export NVM_DIR="$_DATA_HOME/nvm"
export PNPM_HOME="$_DATA_HOME/pnpm"
export NODE_REPL_HISTORY="$_DATA_HOME/node_repl_history"
export TS_NODE_HISTORY="$_DATA_HOME/ts_node_repl_history"
export PLATFORMIO_CORE_DIR="$_DATA_HOME/platformio"
export CUDA_CACHE_PATH="$_CACHE_HOME/nv"
export TEXMFHOME="$_DATA_HOME/texmf"
export TEXMFVAR="$_CACHE_HOME/texlive/texmf-var"
export TEXMFCONFIG="$_CONFIG_HOME/texlive/texmf-config"
export GOPATH="$_DATA_HOME/go"
export GOMODCACHE="$_CACHE_HOME/go/mod"
export R_HOME_USER="$_CONFIG_HOME/R"
export R_PROFILE_USER="$_CONFIG_HOME/R/profile"
export R_HISTFILE="$_CONFIG_HOME/R/history"

unset _CONFIG_HOME
unset _STATE_HOME
unset _DATA_HOME
unset _CACHE_HOME

# Telemetry
# Go: GOTELEMETRY=off or `go telemetry off`
# Dart: `dart --disable-analytics`
# Flutter: `flutter config --no-analytics`
# Dotnet: DOTNET_CLI_TELEMETRY_OPTOUT=1
# vscode: "telemetry.telemetryLevel": "off"
# Zed: "telemetry":{"diagnostics":false,"metrics":false}
# Homebrew: HOMEBREW_NO_ANALYTICS=1 or `brew analytics off`
# Selenium: SE_AVOID_STATS=true
# Hugging Face: HF_HUB_DISABLE_TELEMETRY=1
# Next.js: NEXT_TELEMETRY_DISABLED=1 or `next telemetry disable`
# vcpkg: VCPKG_DISABLE_METRICS=1 or `./bootstrap-vcpkg.sh -disableMetrics`

# Rootless Podman docker-compose support
case "$OSTYPE" in
  linux*)
    _PODMAN_SOCKET="$XDG_RUNTIME_DIR/podman/podman.sock"
  ;;
  darwin*)
    # podman-mac-helper
    _PODMAN_SOCKET="/var/run/docker.sock"
  ;;
esac
if [[ -e "$_PODMAN_SOCKET" ]]; then
    export DOCKER_HOST="unix://$_PODMAN_SOCKET"
fi
unset _PODMAN_SOCKET

# export ANDROID_HOME="$HOME/Android/Sdk"
# export CHROME_EXECUTABLE="/usr/bin/chromium"


if [[ "$OSTYPE" == "darwin"* ]]; then
  # Construct macOS PATH environment variable
  if [ -x /usr/libexec/path_helper ]; then
    eval $(/usr/libexec/path_helper -s)
  fi
fi

typeset -U PATH path
path=(
  "$PNPM_HOME"
  "$CARGO_HOME"/bin

  # Local binaries
  "$HOME/.local/bin/"

  # Flatpak
  "$HOME/.local/share/flatpak/exports/bin/"
  "/var/lib/flatpak/exports/bin/"

  "${path[@]}"
)
export PATH
