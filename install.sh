#! /bin/sh

TARGET_DIR=$HOME

# link all files to the home directory, asking about overwrites
cd `dirname $0`
SCRIPT_DIR=`pwd`
SCRIPT_NAME=`basename $0`
FILES=`bzr ls --versioned --non-recursive`

cd $TARGET_DIR
for FILE in $FILES; do
	ln --symbolic --interactive $SCRIPT_DIR/$FILE
done
rm $TARGET_DIR/$SCRIPT_NAME
