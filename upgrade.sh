#!/usr/bin/env zsh

function zcompile-many() {
  local f
  for f; do
    zcompile -R -- "$f".zwc "$f";
  done
}

git -C powerlevel10k pull
make -C "${ZDOTDIR}"/powerlevel10k pkg

git -C zsh-autosuggestions pull
zcompile-many "${ZDOTDIR}"/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}

git -C zsh-syntax-highlighting pull
zcompile-many "${ZDOTDIR}"/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
