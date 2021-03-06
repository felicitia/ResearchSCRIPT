#! /bin/bash

source settings.sh

signApks(){
	for path in $dirpath/*;
		do
			for apk in $path/$1/*.apk;
				do
					# echo $(basename $apk)
					COMMAND="jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -storepass USCDING -keystore /Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/wendy.keystore ${apk} wendy.keystore"
					# echo "running ${COMMAND}"
					$COMMAND
					echo "finished ${apk} :)"
				done;
		# break
		done;
}

signOneApk(){
		COMMAND="jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -storepass USCDING -keystore /Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/wendy.keystore ${1} wendy.keystore"
		# echo "running ${COMMAND}"
		$COMMAND
		echo "finished ${1} :)"
}

echo "1 - batch; 2 - only sign one apk"

read option
if [ $option == 1 ]
then
	echo "please give the path of the root directory, the script will sign the apks with wendy.keystore"
	read dirpath
	echo "enter 1 for signing NewApp, enter 2 for signing oldAppWithTimestamp"
	read newOrOld
	if [ $newOrOld == 1 ]
	then
		signApks NewApp
	fi

	if [ $newOrOld == 2 ]
	then
		signApks OldAppWithTimestamp
	fi
fi

if [ $option == 2 ]
then
	echo "enter apk path"
	read apkPath
	signOneApk $apkPath
fi
	