# Color support of ls for BSD and Linux environments.
if [ $(uname -s) == 'Darwin' ]; then
	alias ls='ls -Gp'
else
	alias ls='ls -Gp --color=auto'
fi

# Some more ls aliases.
alias i='ls'
alias ll='ls -lh'
alias la='ls -A'
alias lh='find -maxdepth 1 -name ".*" -not -name "." -printf "%f\n" | xargs ls -d --color=auto'
alias lr='ls -R'
alias lla='ls -lA'
alias llh='lh -l'

# Start scribox and set_environment.sh
alias scribox='cd ~/scribd_devel; source scribox/set_environment.sh;PS1="(scribox)$PS1"; cd ~/scribd_devel/rails'

# Some other project got the name "ack" in the debian packages.
command -v ack >/dev/null 2>&1 || {
	command -v ack-grep >/dev/null 2>&1 && {
		alias ack='ack-grep'
	}
}

# trash-cli
command -v trash >/dev/null 2>&1 || {
	command -v trash-put >/dev/null 2>&1 && {
		alias trash='trash-put'
	}
}
