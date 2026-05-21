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

#alias nvim='bob run nightly' 
alias vim='nvim'
alias ..='cd ..'
alias cd='z'
alias cdi='zi'

export QSYS_ROOTDIR="/home/migur/intelFPGA_lite/20.1/quartus/sopc_builder/bin"

export PATH="$PATH:/home/migur/.local/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin/"

export CC="gcc"

HYPRCONF=~/.config/hypr/edit_here/source/

# Support colors in less
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export MANPAGER='less'

eval "$(zoxide init bash)"

eval "$(starship init bash)"

# ----------------------- TMUX ---------------------------------
tmux-session() {
	# Don't do anything if we're already inside tmux
	if [[ -n "$TMUX" ]]; then
		exit 0
	fi

	main_session="main"

	tmux has-session -t="$main_session" 2>/dev/null

	if [[ $? -ne 0 ]]; then
		# First terminal — create and attach to main
		exec tmux new-session -s "$main_session"
	else
		# Main exists — spin up a unique session and attach
		new_session="sesh-$$"
		tmux new-session -d -s "$new_session"
		exec tmux attach -t "$new_session"
	fi
}
# -------------------------------------------------------------
