define fileset name=flatfileset,path=/tmp/fuse/test/root,entries=4000000,size=4k,filesizegamma=0,prealloc,dirwidth=4000000,dirgamma=0

define process name=filereader,instances=1
{
 thread name=filereaderthread,memsize=10m,instances=32
 {
  flowop openfile name=open-file,filesetname=flatfileset,fd=1
  flowop readwholefile name=read-file,filesetname=flatfileset,iosize=4k,fd=1
  flowop closefile name=close-file,filesetname=flatfileset,fd=1
 }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 
