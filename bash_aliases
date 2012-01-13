# some more ls aliases
alias i='ls'
alias ll='ls -lh'
alias la='ls -A'
alias lh='find -maxdepth 1 -name ".*" -not -name "." -printf "%f\n" | xargs ls -d --color=auto'
alias lr='ls -R'
alias lla='ls -lA'
alias llh='lh -l'

# Start scribox and set_environment.sh
alias scribox='cd ~/scribd_devel; source scribox/set_environment.sh;PS1="(scribox)$PS1"'
