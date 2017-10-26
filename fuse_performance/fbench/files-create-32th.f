set mode quit alldone

define fileset name=flatfileset,path=/test/root,entries=4000000,dirwidth=4000000,dirgamma=0,size=4k,filesizegamma=0

define process name=filecreater,instances=1
{
 thread name=filecreaterthread,memsize=10m,instances=32
 {
  flowop createfile name=create-file,filesetname=flatfileset,fd=1
  flowop writewholefile name=write-file,filesetname=flatfileset,fd=1
  flowop closefile name=close-file,filesetname=flatfileset,fd=1
 }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 
