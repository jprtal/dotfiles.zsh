# Set ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh" in /etc/zsh/zshenv

typeset -U PATH path
path=("$HOME/.local/bin" "${path[@]}")
export PATH

export PAGER="${PAGER:-less}"
export LESS="${LESS:--R}"

# Dotfolders
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wgetrc"
# export GNUPGHOME="${XDG_CONFIG_HOME:-$HOME/.config}/gnupg"
export CARGO_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/cargo"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME:-$HOME/.config}/java"
# export GRADLE_USER_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/gradle"
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
export LESSHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/less/lesshst"
export PYTHONHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/python_history"
# export VSCODE_EXTENSIONS="${XDG_DATA_HOME:-$HOME/.local/share}/vscode-oss/extensions"
export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"
export NODE_REPL_HISTORY="${XDG_DATA_HOME:-$HOME/.local/share}/node_repl_history"
export TS_NODE_HISTORY="${XDG_DATA_HOME:-$HOME/.local/share}/ts_node_repl_history"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/nv"

if [ -x "$(command -v seahorse)" ]; then
    export SSH_ASKPASS=/usr/lib/seahorse/ssh-askpass
fi

# Rootless Podman docker-compose support
_ROOTLES_PODMAN=false
if [[ "$_ROOTLES_PODMAN" = true && -e "$XDG_RUNTIME_DIR/podman/podman.sock" ]]; then
    export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
fi
unset _ROOTLES_PODMAN

export ANDROID_HOME="$HOME/Android/Sdk"
export CHROME_EXECUTABLE="/usr/bin/chromium"
