#! /bin/bash

source settings.sh

cd $GATOR

echo "1 - batch, 2 - run GATOR on one apk"
read option

if [ $option == 1 ]
then
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
fi

if [ $option == 2 ]
then
	echo "enter apk path"
	read apkPath
	COMMAND="python3 runGatorOnApk.py ${apkPath} -client CallbackSeqClient -clientParam $(dirname "$apkPath")"
					echo "running ${COMMAND}"
					$COMMAND
					echo "finished :)"
fi
