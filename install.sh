#! /bin/sh

TARGET_DIR=$HOME
SCM="git"

# link all versioned files to the home directory, asking about overwrites
cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)

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

cd $TARGET_DIR
for file in $files; do
	ln --symbolic --interactive $script_dir/$file
done
rm $TARGET_DIR/$script_name
