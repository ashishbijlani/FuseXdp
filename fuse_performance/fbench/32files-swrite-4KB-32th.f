set mode quit alldone

define fileset name=bigfiles,path=/tmp/fuse/test/root,entries=32,dirwidth=32,dirgamma=0,size=1g,filesizegamma=0

define process name=filereader,instances=1
{
 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=1 flowop write name=write-file-1,filesetname=bigfiles,fd=1,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=2 flowop write name=write-file-2,filesetname=bigfiles,fd=2,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=3 flowop write name=write-file-3,filesetname=bigfiles,fd=3,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=4 flowop write name=write-file-4,filesetname=bigfiles,fd=4,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=5 flowop write name=write-file-5,filesetname=bigfiles,fd=5,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=6 flowop write name=write-file-6,filesetname=bigfiles,fd=6,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=7 flowop write name=write-file-7,filesetname=bigfiles,fd=7,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=8 flowop write name=write-file-8,filesetname=bigfiles,fd=8,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=9 flowop write name=write-file-9,filesetname=bigfiles,fd=9,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=10 flowop write name=write-file-10,filesetname=bigfiles,fd=10,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=11 flowop write name=write-file-11,filesetname=bigfiles,fd=11,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=12 flowop write name=write-file-12,filesetname=bigfiles,fd=12,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=13 flowop write name=write-file-13,filesetname=bigfiles,fd=13,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=14 flowop write name=write-file-14,filesetname=bigfiles,fd=14,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=15 flowop write name=write-file-15,filesetname=bigfiles,fd=15,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=16 flowop write name=write-file-16,filesetname=bigfiles,fd=16,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=17 flowop write name=write-file-17,filesetname=bigfiles,fd=17,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=18 flowop write name=write-file-18,filesetname=bigfiles,fd=18,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=19 flowop write name=write-file-19,filesetname=bigfiles,fd=19,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=20 flowop write name=write-file-20,filesetname=bigfiles,fd=20,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=21 flowop write name=write-file-21,filesetname=bigfiles,fd=21,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=22 flowop write name=write-file-22,filesetname=bigfiles,fd=22,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=23 flowop write name=write-file-23,filesetname=bigfiles,fd=23,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=24 flowop write name=write-file-24,filesetname=bigfiles,fd=24,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=25 flowop write name=write-file-25,filesetname=bigfiles,fd=25,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=26 flowop write name=write-file-26,filesetname=bigfiles,fd=26,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=27 flowop write name=write-file-27,filesetname=bigfiles,fd=27,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=28 flowop write name=write-file-28,filesetname=bigfiles,fd=28,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=29 flowop write name=write-file-29,filesetname=bigfiles,fd=29,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=30 flowop write name=write-file-30,filesetname=bigfiles,fd=30,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=31 flowop write name=write-file-31,filesetname=bigfiles,fd=31,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop createfile name=create-file,filesetname=bigfiles,fd=32 flowop write name=write-file-32,filesetname=bigfiles,fd=32,iosize=4k,iters=262144
 flowop finishoncount name=finish,value=1
 }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 
