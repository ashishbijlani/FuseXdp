define fileset name=bigfileset,path=/test/root,size=128k,entries=200000,dirwidth=20,prealloc=80

define process name=fileserver,instances=1
{
  thread name=fileserverthread,memsize=10m,instances=50
  {
    flowop createfile name=createfile1,filesetname=bigfileset,fd=1
    flowop writewholefile name=wrtfile1,srcfd=1,fd=1,iosize=1m
    flowop closefile name=closefile1,fd=1
    flowop openfile name=openfile1,filesetname=bigfileset,fd=1
    flowop appendfilerand name=appendfilerand1,iosize=16k,fd=1
    flowop closefile name=closefile2,fd=1
    flowop openfile name=openfile2,filesetname=bigfileset,fd=1
    flowop readwholefile name=readfile1,fd=1,iosize=1m
    flowop closefile name=closefile3,fd=1
    flowop deletefile name=deletefile1,filesetname=bigfileset
    flowop statfile name=statfile1,filesetname=bigfileset
  }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 600
