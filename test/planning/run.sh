#!/bin/bash

dir=$(cd "$(dirname "$0")"; pwd)
nuri="$dir/../../bin/nuri.rb -c plan"

files=`ls *-p*.sfp`
for i in $files; do
	cmd="$nuri $i"
	output=`$cmd`
	if [ "$output" == "no solution!" ]; then
		echo "$i failed"
	else
		echo "$i success"
	fi
done
