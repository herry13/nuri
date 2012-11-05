#!/bin/bash

current_dir=`pwd`
dir=$(cd "$(dirname "$0")"; pwd)
#nuri="$dir/../../bin/nuri.rb -c planner"
nuri="$dir/../../bin/nuri.rb -p"

cd $dir
files=`ls *-p*.sfp`
for i in $files; do
	cmd="$nuri $i"
	output=`$cmd`
	if [ "$output" == "no solution!" ]; then
	#if [[ "$output" =~ '*no solution*' ]]; then
		echo "$i failed"
	else
		echo "$i success"
	fi
done

cd $current_dir
