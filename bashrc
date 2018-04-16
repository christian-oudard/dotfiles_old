# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

# Set terminal colors.
BASE16_SHELL="$HOME/.config/base16-bright.dark.sh"
if [[ -s $BASE16_SHELL ]]; then
    source $BASE16_SHELL
fi

# Import color codes.
source ~/.colors.sh
CLEAR_EOL="\033[K"

# Set cursor type to solid vertical bar.
echo -ne '\e[6 q'

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
$base01bg$base06\\\\u@\h$base05:$base0D\w/\
$base0E$git\
$base0B$virtualenv\
$base0F$nodevirtualenv\
$base0C$ssh\
$CLEAR_EOL$reset\
"
    }

    # Prompt line with dollar sign.
    # We have to escape color codes so readline can correctly determine line length.
    dollar="\[$base01bg$base0D\]\$\[$reset\]"

    # Assemble the prompt.
    local left=$(prompt_left)
    PS1="${left}\n${dollar} "

    # Write history after every command.
    history -a
}
PROMPT_COMMAND=prompt_command

# Color settings for ls.
if [ -x /usr/bin/dircolors ] && [ -f "$HOME/.dircolors" ]; then
    eval $(dircolors -b $HOME/.dircolors)
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
export EDITOR='nvim'

# Computer-specific settings.
if [ -f "$HOME/.bashrc_local" ]; then
    source "$HOME/.bashrc_local"
fi

# Vagrant dotfiles outside of main tree.
export VAGRANT_DOTFILE_PATH="$HOME/.vagrant_dotfiles"

# Go path.
export GOPATH=$HOME/go

# Activate virtualenvwrapper.
# if command -v virtualenvwrapper.sh >/dev/null; then
#     source $(command -v virtualenvwrapper.sh)
# fi

# Load rbenv.
# if command -v rbenv >/dev/null; then
#     eval "$(rbenv init -)"
# fi

# Load nvm.
# export NVM_DIR="$HOME/.nvm"
# if [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
#     source /usr/local/opt/nvm/nvm.sh
# fi

# Activate Haskell stack shell integration.
# if command -v stack >/dev/null; then
#   eval "$(stack --bash-completion-script stack)"
# fi

## Executable search path ##
export PATH="\
$HOME/bin:\
$HOME/.bin:\
$HOME/.local/bin:\
$HOME/.cabal/bin:\
$HOME/.cargo/bin:\
$HOME/.rbenv/bin:\
$HOME/.rbenv/plugins/ruby-build/bin:\
$HOME/.node/bin:\
$GOPATH/bin:\
/usr/local/opt/coreutils/libexec/gnubin:\
/usr/local/bin:\
/opt/local/:\
/sbin:\
/opt/local/bin:\
${PATH}:\
"

# Load pyenv after path modification.
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


## Aliases ##

if [ -n "$(ls --version | grep GNU)" ] ; then
    alias ls='ls -p --color=auto'
else
    alias ls='ls -p'
fi
alias i='ls'
alias ll='ls -lGh'
alias la='ls -A'
alias lh='find -maxdepth 1 -name ".*" -not -name "." -printf "%f\n" | xargs ls -d --color=auto'
alias lr='ls -R'
alias lla='ls -lGA'
alias lld='ls -ld'
alias llh='lh -lG'
alias mv='mv --interactive'
alias cp='cp --interactive'

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

# Use nvim if available, but call it "vim".
if command -v nvim >/dev/null; then
    alias vim=nvim
fi

# Call python3 when we type python.
if command -v python3 >/dev/null; then
    alias python=python3
fi
if command -v pip3 >/dev/null; then
    alias pip=pip3
fi
if command -v pytest-3 >/dev/null; then
    alias pytest=pytest-3
fi

# Activate fzf fuzzy file finder.
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi
