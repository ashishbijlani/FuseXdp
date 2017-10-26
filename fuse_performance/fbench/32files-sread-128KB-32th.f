set mode quit alldone

define fileset name=bigfiles,path=/tmp/fuse/test/root,entries=32,dirwidth=32,dirgamma=0,size=1g,filesizegamma=0,prealloc

define process name=filereader,instances=1
{
 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-1,filesetname=bigfiles,indexed=1,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-2,filesetname=bigfiles,indexed=2,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-3,filesetname=bigfiles,indexed=3,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-4,filesetname=bigfiles,indexed=4,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-5,filesetname=bigfiles,indexed=5,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-6,filesetname=bigfiles,indexed=6,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-7,filesetname=bigfiles,indexed=7,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-8,filesetname=bigfiles,indexed=8,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-9,filesetname=bigfiles,indexed=9,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-10,filesetname=bigfiles,indexed=10,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-11,filesetname=bigfiles,indexed=11,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-12,filesetname=bigfiles,indexed=12,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-13,filesetname=bigfiles,indexed=13,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-14,filesetname=bigfiles,indexed=14,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-15,filesetname=bigfiles,indexed=15,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-16,filesetname=bigfiles,indexed=16,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-17,filesetname=bigfiles,indexed=17,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-18,filesetname=bigfiles,indexed=18,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-19,filesetname=bigfiles,indexed=19,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-20,filesetname=bigfiles,indexed=20,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-21,filesetname=bigfiles,indexed=21,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-22,filesetname=bigfiles,indexed=22,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-23,filesetname=bigfiles,indexed=23,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-24,filesetname=bigfiles,indexed=24,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-25,filesetname=bigfiles,indexed=25,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-26,filesetname=bigfiles,indexed=26,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-27,filesetname=bigfiles,indexed=27,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-28,filesetname=bigfiles,indexed=28,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-29,filesetname=bigfiles,indexed=29,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-30,filesetname=bigfiles,indexed=30,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-31,filesetname=bigfiles,indexed=31,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }

 thread name=filereaderthread,memsize=10m,instances=1
 {
 flowop read name=read-file-32,filesetname=bigfiles,indexed=32,iosize=128k,iters=8192
 flowop finishoncount name=finish,value=1
 }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 
