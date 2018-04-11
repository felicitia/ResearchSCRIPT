listDir='/Users/felicitia/Documents/Research/PALOMA/FSE2018/TopAppList'
apkDir='/Users/felicitia/Documents/Research/PALOMA/FSE2018/APKDIR'
tgtDir='/Users/felicitia/Documents/Research/PALOMA/FSE2018/Top20'
topCount=20

for list in $listDir/*.txt;
		do
			filename=$(basename $list .txt)
			mkdir $tgtDir/$filename
			for apkName in $( head -$topCount $list ); do
				# echo $apkName
				find $apkDir/$filename -name $apkName.apk -exec cp {} $tgtDir/$filename \;
			done
		done;
echo "Done :)"