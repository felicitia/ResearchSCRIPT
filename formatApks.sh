#! /bin/bash

echo "please give the path of the root directory"
	read dirpath
echo "starting number?"
	read count
	for apk in $dirpath/*.apk;
		do
			cd $dirpath
			mkdir "App${count}"
			# echo $apk
			# echo $dirpath/APP$count/.
			mv $apk $dirpath/APP$count/
			count=$((count + 1))
			# break
		done;
		