define file name=bigfile,path=/tmp/fuse/test/root,size=30g,prealloc

define process name=filewriter,instances=1
{
 thread name=filewriterthread,memsize=10m,instances=32
 {
  flowop write name=write-file,filesetname=bigfile,random,iosize=4k
 }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 600
