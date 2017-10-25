define file name=bigfile,path=/test/root,size=30g,prealloc

define process name=filereader,instances=1
{
 thread name=filereaderthread,memsize=10m,instances=32
 {
  flowop read name=read-file,filesetname=bigfile,random,iosize=32k
 }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 600
