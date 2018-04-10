echo "please give the path of the root directory that contains HTML files"
	read dirpath
for htm in $dirpath/*.htm;
		do
			# echo $htm
			cd $dirpath/../TopAppList
			filename=$(basename $htm .htm)
			# echo $filename
			grep -E "<a[^>]*class=\"app-link\"[^>]*>" $htm | grep -oE "\"http[^\"]*\"" | grep -oE "[^/]*/details" -m 100 | sed 's/\/details//' > $filename.txt
		done;

echo "Done :)"