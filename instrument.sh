#! /bin/bash

source settings.sh

echo "please give the path of the root directory, the script will instrument the timestamp before/after getInputStream()"
	read dirpath
	for path in $dirpath/*;
		do
			for manifest in $path/decompile/AndroidManifest.xml
				do
					pkgname=$(xmllint --xpath "string(//manifest/@package)" $manifest)
					# echo $manifest
					# echo $pkgname
				done;

			for apk in $path/*.apk;
				do
					# echo $(basename $apk)
					COMMAND="java -Dfile.encoding=UTF-8 -classpath /Users/felicitia/Documents/workspaces/Eclipse/NewStringAnalysis/target/classes:/Users/felicitia/Documents/Develop_Tools/eclipse/plugins/org.junit_4.11.0.v201303080030/junit.jar:/Users/felicitia/Documents/Develop_Tools/eclipse/plugins/org.hamcrest.core_1.3.0.v201303031735.jar:/Users/felicitia/Documents/workspaces/Eclipse/graphs/target/classes:/Users/felicitia/Documents/workspaces/Eclipse/graphs/target/test-classes:/Users/felicitia/.m2/repository/junit/junit/3.8.1/junit-3.8.1.jar:/Users/felicitia/.m2/repository/commons-cli/commons-cli/1.2/commons-cli-1.2.jar:/Users/felicitia/.m2/repository/org/apache/bcel/bcel/5.2/bcel-5.2.jar:/Users/felicitia/.m2/repository/jakarta-regexp/jakarta-regexp/1.4/jakarta-regexp-1.4.jar:/Users/felicitia/.m2/repository/grappa/grappa/1.2/grappa-1.2.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/soot-trunk.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/lib/android--1/android.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/Pixy.jar:/Users/felicitia/Documents/workspaces/Eclipse/NewStringAnalysis/lib/json-simple-1.1.1.jar:/Users/felicitia/Documents/workspaces/Eclipse/NewStringAnalysis/lib/commons-io-2.5.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/bin:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/rt.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/commons-io-2.5.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/json-simple-1.1.1.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/poi-3.13-beta1-20150723.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/soot_jar/sootclasses-trunk.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/soot_jar/soot-trunk721.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm-util/4.0/asm-util-4.0.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm/4.0/asm-4.0.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm-tree/4.0/asm-tree-4.0.jar:/Users/felicitia/.m2/repository/android/android/13/android-13.jar usc.yixue.Instrumenter -w -process-dir ${apk} $(basename $apk) ${path} ${ANDROID_JAR} ${pkgname} false"
					# echo "running ${COMMAND}"
					$COMMAND
					echo "finished ${apk} :)"
				done;
		# break
		done;