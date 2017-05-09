# Include .bashrc if it exists.
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
