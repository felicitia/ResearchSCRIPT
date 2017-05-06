#! /bin/bash

source settings.sh

cd $GATOR

echo "please give the path of the root directory, the script will run CallbackSeqClient on all the apps under root directory"
	read dirpath
	for path in $dirpath/*;
		do
			for apk in $path/*.apk;
				do
					COMMAND="python3 runGatorOnApk.py ${apk} -client CallbackSeqClient -clientParam ${path}"
					echo "running ${COMMAND}"
					$COMMAND
					echo "finished :)"
				done;
		# break
		done;
