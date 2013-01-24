# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Add to executable search path.
export PATH="\
$HOME/bin:\
/usr/local/share/python:\
/usr/local/bin:\
$PATH:\
/opt/local/\
sbin:\
/opt/local/bin"

# Don't put duplicate lines in the history. See bash(1) for more options.
HISTCONTROL=ignoredups:ignorespace

# Append to the history file, don't overwrite it.
shopt -s histappend

# Use a larger history size.
export HISTSIZE=25000
export HISTFILESIZE=50000

export HISTIGNORE=" *"

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make "less" more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set the prompt.
PS1="\
\033[00;33m\
\u@\h\
\033[00m\
:\
\033[01;36m\
\w\
\033[00m\
\n\$ \
"

# Display the time after the prompt, right aligned.
# Reference: http://superuser.com/a/517110/15168
function prompt_right() {
    printf "\
\033[01;32m\
$(date +%H:%M | tr -d '\n')\
\033[00m\
"
}
function prompt() {
    compensate=13
    printf "%*s\r"\
        "$(($(tput cols)+${compensate}))"\
        "$(prompt_right)"
    # Write history after every command.
    history -a
}
PROMPT_COMMAND=prompt

# If coming in via ssh, show it in the prompt.
if [ -n "$SSH_CLIENT" ]; then
    PS1="\[\033[00;36m\](ssh)\[\033[00m\]$PS1"
fi

# Set gnome-terminal colors
if [ $(uname -s) != 'Darwin' ]; then
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#00002B2B3636"
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#838394949696"
fi

# Color settings for ls.
if [ -x /usr/bin/dircolors ] && [ -f "$HOME/.dircolors" ]; then
    eval $(dircolors -b $HOME/.dircolors)
fi

# Color support of ls for BSD and Linux environments.
if [ $(uname -s) == 'Darwin' ]; then
    alias ls='ls -Gp'
else
    alias ls='ls -Gp --color=auto'
fi

# Aliases.
alias i='ls'
alias ll='ls -lh'
alias la='ls -A'
alias lh='find -maxdepth 1 -name ".*" -not -name "." -printf "%f\n" | xargs ls -d --color=auto'
alias lr='ls -R'
alias lla='ls -lA'
alias llh='lh -l'

# Use "g" to mean "git", with correct tab completion.
alias g='git'
complete -o default -o nospace -F _git g

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

# Python startup script and encoding.
export PYTHONIOENCODING=utf8
export PYTHONSTARTUP=$HOME/.pythonrc

# don't allow Ctrl-S to stop terminal output
stty stop ''

# Set editor.
export EDITOR='vim'

# Fix ubuntu menu proxy warning in gvim.
# From http://askubuntu.com/questions/132977/how-to-get-global-application-menu-for-gvim
if [ -x /usr/bin/gvim ]; then
    function gvim () { (/usr/bin/gvim -f "$@" &) }
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Activate virtualenvwrapper.
if [ -f $(which virtualenvwrapper.sh) ]; then
    source $(which virtualenvwrapper.sh)
fi

# Setup base directory for byobu if using brew.
if [ -f $(which brew) ]; then
    export BYOBU_PREFIX=$(brew --prefix)
fi

# Computer-specific settings.
if [ $(cat /etc/hostname) == 'turnip' ]; then
    workon django
fi
if [ $(cat /etc/hostname) == 'peach' ]; then
    workon django
fi
