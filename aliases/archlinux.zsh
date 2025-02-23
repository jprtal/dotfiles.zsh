if [[ "$OSTYPE" != "linux"* ]]; then
  return
fi

local DISTRIBUTION=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)
if [[ "$DISTRIBUTION" != "arch" ]]; then
  return
fi

# AUR helper
alias yay="paru"
alias yeet="paru -Rnsc"
alias whee="paru -Sccd"

# Mirrors
alias update-mirrors="sudo reflector --country France,Germany --age 4 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

alias pacfiles="find / -regextype posix-extended -regex '.+\.pac(new|save)' 2> /dev/null"
