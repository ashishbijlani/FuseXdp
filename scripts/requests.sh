for i in $(ls ~/fuse-playground/kernel-statistics/Stat-files-*/Stat-files-File-server-50th-1/request_type_count.txt)
	do
		bm=$(echo $i | cut -f6 -d"/" | cut -f3- -d"-" | sed 's/-macro/-file-server/g')
		mkdir $bm; cd $bm
		cp $i .
		csplit --digits=2  --quiet --prefix=outfile -b "%03d.csv" request_type_count.txt "/=/+1" "{*}" 
		sed -i 's/=//g' *
		sed -i 's/:/,/g' *
		sed -i 's/ *, */,/g' *
		sed -i 's/ /-/g' *
		cd ..
	#echo $bm, $req, $count
done
