#! /bin/sh

TARGET_DIR=$HOME

# link all files to the home directory, asking about overwrites
cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)
files=$(bzr ls --versioned --non-recursive)

cd $TARGET_DIR
for file in $files; do
	ln --symbolic --interactive $script_dir/$file
done
rm $TARGET_DIR/$script_name
