# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias ls='eza -lh --group-directories-first --icons=auto'
alias l='ls'
alias lsdls='ls *.vhd'
alias fds='clear && fastfetch'
alias clr='clear && ls'

alias nvim='bob run nightly'
alias vim='bob run nightly'

alias cheat='~/.config/hypr/scripts/cheat.sh'

export QSYS_ROOTDIR="/home/migur/intelFPGA_lite/20.1/quartus/sopc_builder/bin"

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach-session -t default || tmux new-session -s default
# fi

#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

export PATH="$PATH:/home/migur/.local/bin"
