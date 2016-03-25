# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Add to executable search path.
export PATH="\
$HOME/bin:\
/opt/ghc/7.10.3/bin:\
/opt/cabal/1.22/bin:\
$HOME/.cabal/bin:\
$HOME/.rbenv/bin:\
$HOME/.rbenv/plugins/ruby-build/bin:\
$HOME/.node/bin:\
$HOME/code-minerva/minerva-tools:\
/usr/local/bin:\
$PATH:\
/opt/local/:\
/sbin:\
/opt/local/bin:\
"

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

# Import color codes.
source ~/.colors.sh

# Set the prompt.
function prompt_command() {
    # If working on a python virtualenv, show it in the prompt.
    if [ -n "$VIRTUAL_ENV" ]; then
        local virtualenv="  ($(basename $VIRTUAL_ENV)) "
    else
        local virtualenv=""
    fi

    # If working on a node virtualenv, show it in the prompt.
    if [ -n "$NODE_VIRTUAL_ENV" ]; then
        local nodevirtualenv="  ($(basename $NODE_VIRTUAL_ENV)) "
    else
        local nodevirtualenv=""
    fi

    # If coming in via ssh, show it in the prompt.
    if [ -n "$SSH_CLIENT" ]; then
        local ssh="  (ssh)"
    else
        local ssh=""
    fi

    # Show current git branch in the prompt.
    function find_git_branch {
       local dir=. head
       until [ "$dir" -ef / ]; do
          if [ -f "$dir/.git/HEAD" ]; then
             head=$(< "$dir/.git/HEAD")
             if [[ $head == ref:\ refs/heads/* ]]; then
                git_branch="${head#*/*/}"
             elif [[ $head != '' ]]; then
                git_branch="detached"
             else
                git_branch="unknown"
             fi
             return
          fi
          dir="../$dir"
       done
       git_branch=''
    }
    function find_git_dirty {
        local st=$(git status --untracked-files=no --porcelain 2>/dev/null)
        if [[ $st == "" ]]; then
            git_dirty=''
        else
            git_dirty='*'
        fi
    }
    find_git_branch
    find_git_dirty
    if [ -n "$git_branch" ]; then
        local git="  ($git_branch$git_dirty) "
    else
        local git=""
    fi

    function prompt_left() {
        printf "\
$txtylw\\\\u@\h$txtrst:$bldcyn\w$txtrst\
$bldpur$git$txtrst\
$txtgrn$virtualenv$txtrst\
$txtgrn$nodevirtualenv$txtrst\
$txtcyn$ssh$txtrst\
"
    }


    # Assemble the prompt.
    local left=$(prompt_left)
    PS1="${left}\n\$ "

    # Write history after every command.
    history -a
}
PROMPT_COMMAND=prompt_command

# Set gnome-terminal colors
if command -v gconftool-2 >/dev/null; then
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

# Mac vs Linux conditional aliases.
if [ $(uname -s) == 'Darwin' ]; then
    alias ls='ls -p'
    # For some reason, OS X will not use Brew-installed vim, even if it comes first in the $PATH.
    alias vim='/usr/local/bin/vim'
else
    alias ls='ls -p --color=auto'
fi

# Aliases.
alias i='ls'
alias ll='ls -lGh'
alias la='ls -A'
alias lh='find -maxdepth 1 -name ".*" -not -name "." -printf "%f\n" | xargs ls -d --color=auto'
alias lr='ls -R'
alias lla='ls -lGA'
alias lld='ls -ld'
alias llh='lh -lG'

# Fix scrolling issue with tmux + irssi
alias irssi='TERM=screen-256color irssi'

# Use "g" to mean "git", with correct tab completion.
alias g='git'
complete -o default -o nospace -F _git g

# Search in files with "ack".
if command -v ag >/dev/null; then
    alias ack=ag
elif command -v ack-grep >/dev/null; then
    alias ack=$(command -v ack-grep)
fi

# Enable git command line completion in bash.
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

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

# Activate virtualenvwrapper.
if command -v virtualenvwrapper.sh >/dev/null; then
    source $(command -v virtualenvwrapper.sh)
fi

# Load rbenv.
if command -v rbenv >/dev/null; then
    eval "$(rbenv init -)"
fi

# Load nvm.
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
fi

# Computer-specific settings.
if [ -f "$HOME/.bashrc_local" ]; then
    . "$HOME/.bashrc_local"
fi
