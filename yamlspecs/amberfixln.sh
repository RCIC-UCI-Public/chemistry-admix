#!/bin/bash
# This file fixes up bad link names in the Amber MPI/CUDA build
# Args:
#    $1 = file that is a softlink
#    $2 = pattern that constitutes a bad link (usually the buildroot)
# CAVEAT: This will only create local-to-the-directory links
#         If AMBER changes in the future this might need updating
#
# It only changes links that are have the errant pattern

LINKDIR=$(dirname $1)
LNAME=$(basename $1)
BADPATTERN=$2
TARGET=$(stat "$1" | grep File: | awk '{print $NF}')
NEWTARGET=$(basename $TARGET)

echo $TARGET | grep -q $BADPATTERN
if [ $? -eq 0 ]; then 
    pushd $LINKDIR
    echo unlink $LNAME
    unlink $LNAME
    echo ln -s $NEWTARGET $LNAME
    ln -s $NEWTARGET $LNAME
    popd
fi
