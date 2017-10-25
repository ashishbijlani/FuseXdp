set mode quit alldone

define fileset name=flatfileset,path=/tmp/fuse/test/root,entries=800000,dirwidth=800000,dirgamma=0,size=4k,filesizegamma=0,prealloc

define process name=filedeleter,instances=1
{
 thread name=filedeleterthread,memsize=10m,instances=1
 {
  flowop deletefile name=delete-file,filesetname=flatfileset
 }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 
