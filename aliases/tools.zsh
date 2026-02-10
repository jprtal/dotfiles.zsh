# Network
alias myip="echo -n 'IPv4: ' && curl -4 ipv4.icanhazip.com; echo -n 'IPv6: ' && curl -s6 ipv6.icanhazip.com"

# Adjust monitor brightness
alias bn="ddcutil setvcp 10"

# Misc
if [[ "$OSTYPE" == "linux"* ]]; then
  alias sound-cards="cat /proc/asound/cards | grep --color=never ' -'"
fi

# cp
alias ccp="rsync --info=progress2 -ah"
alias sccp="sudo rsync --info=progress2 -ah"
