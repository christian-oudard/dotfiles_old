# some more ls aliases
alias i='ls'
alias ll='ls -lh'
alias la='ls -A'
alias lh='find -maxdepth 1 -name ".*" -not -name "." -printf "%f\n" | xargs ls -d --color=auto'
alias lr='ls -R'
alias lla='ls -lA'
alias llh='lh -l'

# make gvim shut up about errors
alias gvim='gvim 2>/dev/null'

# trash-put is a stupid command name
alias trash='trash-put'
