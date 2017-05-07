#! /bin/bash

source settings.sh

runClassGenerator(){
	rm -r sootOutput
	COMMAND="java -jar soot-trunk.jar -android-jars ${LIB} -src-prec apk -f J -process-dir ${APP_DIR}${APP_NAME} -allow-phantom-refs"
	echo "running ${COMMAND}"
	$COMMAND
	echo "finished :)"
	java ClasslistMain
	mv classlist.txt $APP_DIR
	mv sootOutput/ $APP_DIR
}

runStringAnalysis(){
	COMMAND="java -Dfile.encoding=UTF-8 -classpath /Users/felicitia/Documents/workspaces/Eclipse/NewStringAnalysis/target/classes:/Users/felicitia/Documents/Develop_Tools/eclipse/plugins/org.junit_4.11.0.v201303080030/junit.jar:/Users/felicitia/Documents/Develop_Tools/eclipse/plugins/org.hamcrest.core_1.3.0.v201303031735.jar:/Users/felicitia/Documents/workspaces/Eclipse/graphs/target/classes:/Users/felicitia/Documents/workspaces/Eclipse/graphs/target/test-classes:/Users/felicitia/.m2/repository/junit/junit/3.8.1/junit-3.8.1.jar:/Users/felicitia/.m2/repository/commons-cli/commons-cli/1.2/commons-cli-1.2.jar:/Users/felicitia/.m2/repository/org/apache/bcel/bcel/5.2/bcel-5.2.jar:/Users/felicitia/.m2/repository/jakarta-regexp/jakarta-regexp/1.4/jakarta-regexp-1.4.jar:/Users/felicitia/.m2/repository/grappa/grappa/1.2/grappa-1.2.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/soot-trunk.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/lib/android--1/android.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/Pixy.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/bin:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/AXMLPrinter2.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/commons-io-2.5.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/rt.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/soot-trunk.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/sootclasses-trunk.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/bin:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/rt.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/commons-io-2.5.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm-util/4.0/asm-util-4.0.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm/4.0/asm-4.0.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm-tree/4.0/asm-tree-4.0.jar:/Users/felicitia/.m2/repository/android/android/13/android-13.jar usc.sql.string.AndroidMain /Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/Android ${APP_DIR} /classlist.txt /${APP_NAME}"
	echo "running ${COMMAND}"
	$COMMAND
	echo "finished :)"
}

decompile(){
	read dirpath
	for path in $dirpath/*;
		do
			for apk in $path/*.apk;
				do
					COMMAND="bin/jadx -d ${path}/decompile ${apk}"
					echo "running ${COMMAND}"
					$COMMAND
					echo "finished :)"
				done;
		done;
}

echo "Don't forget to set the paths in settings.sh :D"
echo "1 - run all for one app, 2 - only run class generator for one app, 3 - only run string analysis, 4 - run all on apps in one root dir, 5 - run only String Analysis in one root dir, 6 - jadk decompile in one root dir"

read option

if [ $option == 1 ]
then
	cd $CLASS_GEN_DIR
	runClassGenerator
	runStringAnalysis
fi

if [ $option == 2 ]
then
	cd $CLASS_GEN_DIR
	runClassGenerator
fi

if [ $option == 3 ]
then
	cd $CLASS_GEN_DIR
	runStringAnalysis
fi

if [ $option == 4 ]
then
	cd $CLASS_GEN_DIR
	echo "please give the path of the root directory"
	read dirpath
	for path in $dirpath/*;
		do
			for apk in $path/*.apk;
				do
					rm -r sootOutput
					COMMAND="java -jar soot-trunk.jar -android-jars ${LIB} -src-prec apk -f J -process-dir ${apk} -allow-phantom-refs"
					echo "running ${COMMAND}"
					$COMMAND
					echo "finished"
					java ClasslistMain
					mv classlist.txt $path
					mv sootOutput/ $path

					COMMAND="java -Dfile.encoding=UTF-8 -classpath /Users/felicitia/Documents/workspaces/Eclipse/NewStringAnalysis/target/classes:/Users/felicitia/Documents/Develop_Tools/eclipse/plugins/org.junit_4.11.0.v201303080030/junit.jar:/Users/felicitia/Documents/Develop_Tools/eclipse/plugins/org.hamcrest.core_1.3.0.v201303031735.jar:/Users/felicitia/Documents/workspaces/Eclipse/graphs/target/classes:/Users/felicitia/Documents/workspaces/Eclipse/graphs/target/test-classes:/Users/felicitia/.m2/repository/junit/junit/3.8.1/junit-3.8.1.jar:/Users/felicitia/.m2/repository/commons-cli/commons-cli/1.2/commons-cli-1.2.jar:/Users/felicitia/.m2/repository/org/apache/bcel/bcel/5.2/bcel-5.2.jar:/Users/felicitia/.m2/repository/jakarta-regexp/jakarta-regexp/1.4/jakarta-regexp-1.4.jar:/Users/felicitia/.m2/repository/grappa/grappa/1.2/grappa-1.2.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/soot-trunk.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/lib/android--1/android.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/Pixy.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/bin:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/AXMLPrinter2.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/commons-io-2.5.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/rt.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/soot-trunk.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/sootclasses-trunk.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/bin:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/rt.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/commons-io-2.5.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm-util/4.0/asm-util-4.0.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm/4.0/asm-4.0.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm-tree/4.0/asm-tree-4.0.jar:/Users/felicitia/.m2/repository/android/android/13/android-13.jar usc.sql.string.AndroidMain /Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/Android ${path} /classlist.txt /$(basename ${apk})"
					echo "running ${COMMAND}"
					$COMMAND
					mv $path/Output/statistic.txt $path
					echo "finished :)"
				done;
		done;

fi

if [ $option == 5 ]
then
	cd $CLASS_GEN_DIR
	echo "please give the path of the root directory"
	read dirpath
	for path in $dirpath/*;
		do
			for apk in $path/*.apk;
				do
					COMMAND="java -Dfile.encoding=UTF-8 -classpath /Users/felicitia/Documents/workspaces/Eclipse/NewStringAnalysis/target/classes:/Users/felicitia/Documents/Develop_Tools/eclipse/plugins/org.junit_4.11.0.v201303080030/junit.jar:/Users/felicitia/Documents/Develop_Tools/eclipse/plugins/org.hamcrest.core_1.3.0.v201303031735.jar:/Users/felicitia/Documents/workspaces/Eclipse/graphs/target/classes:/Users/felicitia/Documents/workspaces/Eclipse/graphs/target/test-classes:/Users/felicitia/.m2/repository/junit/junit/3.8.1/junit-3.8.1.jar:/Users/felicitia/.m2/repository/commons-cli/commons-cli/1.2/commons-cli-1.2.jar:/Users/felicitia/.m2/repository/org/apache/bcel/bcel/5.2/bcel-5.2.jar:/Users/felicitia/.m2/repository/jakarta-regexp/jakarta-regexp/1.4/jakarta-regexp-1.4.jar:/Users/felicitia/.m2/repository/grappa/grappa/1.2/grappa-1.2.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/soot-trunk.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/lib/android--1/android.jar:/Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/ClasslistGenerator/Pixy.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/bin:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/AXMLPrinter2.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/commons-io-2.5.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/rt.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/soot-trunk.jar:/Users/felicitia/Documents/workspaces/Eclipse/PrefetchProject/libs/sootclasses-trunk.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/bin:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/rt.jar:/Users/felicitia/Documents/workspaces/Eclipse/CS610/libs/commons-io-2.5.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm-util/4.0/asm-util-4.0.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm/4.0/asm-4.0.jar:/Users/felicitia/Documents/workspaces/Eclipse/NewStringAnalysis/lib/json-simple-1.1.1.jar:/Users/felicitia/.m2/repository/org/ow2/asm/asm-tree/4.0/asm-tree-4.0.jar:/Users/felicitia/.m2/repository/android/android/13/android-13.jar usc.sql.string.AndroidMain /Users/felicitia/Documents/Research/Prefetch/Develop/Yingjun/Android ${path} /classlist.txt /$(basename ${apk})"
					echo "running ${COMMAND}"
					$COMMAND
					echo "finished :)"
				done;
		# break
		done;
fi 

if [ $option == 6 ]
then
	cd $JADX
	echo "please give the path of the root directory"
	decompile
fi
