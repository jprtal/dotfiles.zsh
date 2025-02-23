# Network
alias myip="curl -4 icanhazip.com; curl -6 icanhazip.com"

# Adjust monitor brightness
alias bn="ddcutil setvcp 10"

# Misc
if [[ "$OSTYPE" == "linux"* ]]; then
  alias sound-cards="cat /proc/asound/cards | grep --color=never ' -'"
fi

# cp
alias ccp="rsync --info=progress2 -ah"
alias sccp="sudo rsync --info=progress2 -ah"
