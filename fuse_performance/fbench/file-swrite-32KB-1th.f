define file name=bigfile,path=/test/root,size=60g

define process name=filewriter,instances=1
{
 thread name=filewriterthread,memsize=10m,instances=1
 {
  flowop createfile name=create-file,filesetname=bigfile
  flowop write name=write-file,filesetname=bigfile,iosize=32k,iters=1966080
  flowop finishoncount name=finish,value=1
 }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 
