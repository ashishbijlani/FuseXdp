#!/bin/bash

typ=$2
proj_dir=$1

if [ $# -ne 2 ]; then
	echo "Usage: $0 <project-dir> <disk-type>"
	echo "Example: $HOME/projects/UserFS [HDD|SSD]"
	exit
fi

results_dir=$proj_dir/benchmarks/results
if [ ! -d $results_dir ]; then
	echo "$results_dir does not exist"
	exit
fi

working_dir=$results_dir/$typ
if [ ! -d $working_dir ]; then
	echo "$working_dir does not exist"
	exit
fi

scripts_dir=$proj_dir/repo/benchmarks/scripts
if [ ! -d $scripts_dir ]; then
	echo "$scripts_dir does not exist"
	exit
fi

echo "exp_type,wrkl_type,wrkl,wrkl_size,num_threads,num_files,count, avg_ops_sec"
for exp_type in $(ls  $working_dir)
	do
		for work_load in $(ls $working_dir/$exp_type)
			do
				#echo $work_load
				avg_ops_sec=$($scripts_dir/avg.sh $working_dir/$exp_type/$work_load/ops_sec.txt)
				typ=$(echo $exp_type | cut -f2 -d".")
				wrkl=$(echo $work_load | cut -f4 -d"-")
				wrkl_type=$(echo $work_load | cut -f3 -d"-")
				wrkl_size=$(echo $work_load | cut -f5 -d"-")
				num_threads=$(echo $work_load | cut -f6 -d"-")
				num_files=$(echo $work_load | cut -f7 -d"-")
				count=$(echo $work_load | cut -f8 -d"-")
				echo $typ,$wrkl_type,$wrkl,$wrkl_size,$num_threads,$num_files,$count,$avg_ops_sec
			done
	done
