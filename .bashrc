# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

alias l='eza'
alias ls='eza -lh --group-directories-first --icons=auto'
alias sl='ls'
alias clr='clear && ls'

alias nvim='bob run nightly' 
alias vim='nvim'
alias ..='cd ..'

# alias cheat='~/.config/hypr/scripts/cheat.sh' ???????????

export QSYS_ROOTDIR="/home/migur/intelFPGA_lite/20.1/quartus/sopc_builder/bin"

PS1='$(git branch 2> /dev/null | grep "*" | sed "s/* //")'
# 34 -> Blue
PS1="\e[34m$PS1\e[39m"
PS1="$PS1❯ "
PS1="\w $PS1"

export PATH="$PATH:/home/migur/.local/bin"

export CC="gcc"

HYPRCONF=~/.config/hypr/edit_here/source/

fastfetch
