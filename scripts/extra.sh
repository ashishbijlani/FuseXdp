for i in $(ls ~/fuse-playground/kernel-statistics/Stat-files-*/Stat-files-File-server-50th-1/ops_sec.txt)
	do
		bm$(echo $i | cut -f6 -d"/")
		res$(./avg.sh $i)
	echo $bm, $res
done
