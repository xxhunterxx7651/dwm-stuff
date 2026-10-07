# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
  # Shell is non-interactive.  Be done now!
  return
fi

cat ~/.cache/wal/sequences
walset() {
  wal -a "0" -n -1 "$@"
  feh --bg-fill "$(<"${HOME}/.cache/wal/wal")"
}

# Put your fun stuff here.
eval "$(starship init bash)"
alias recom-vxwm='cd ~/vxwm/; nvim config.h; doas make clean install'
alias update-gentoo='doas emerge --sync; doas emerge --update --deep --newuse --ask @world'
fastfetch
