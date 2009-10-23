#! /bin/sh

TARGET_DIR=$HOME
SCM="git"

# Run from the script directory.
cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)

# Ask the source control for a list of all the versioned files.
case $SCM in
"git")
	files=$(git ls-tree --name-only HEAD);;
"bzr")
	files=$(bzr ls --versioned --non-recursive);;
*)
	echo "SCM $SCM is not supported."
	exit 1
	;;
esac

# Link all versioned files to the home directory, asking about overwrites.
# Don't link this install script.
cd $TARGET_DIR
for file in $files; do
	if [ "$file" = "$script_name" ] ; then continue; fi # Don't link this script.
	ln --symbolic --interactive $script_dir/$file
done
