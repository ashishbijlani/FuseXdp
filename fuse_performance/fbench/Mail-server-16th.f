define fileset name=bigfileset,path=/test/root,size=16k,entries=1500000,dirwidth=1500000,prealloc=80

define process name=mailserver,instances=1
{
  thread name=mailserverthread,memsize=10m,instances=16
  {
    flowop deletefile name=deletefile1,filesetname=bigfileset
    flowop createfile name=createfile2,filesetname=bigfileset,fd=1
    flowop appendfilerand name=appendfilerand2,iosize=16k,fd=1
    flowop fsync name=fsyncfile2,fd=1
    flowop closefile name=closefile2,fd=1
    flowop openfile name=openfile3,filesetname=bigfileset,fd=1
    flowop readwholefile name=readfile3,fd=1,iosize=1m
    flowop appendfilerand name=appendfilerand3,iosize=16k,fd=1
    flowop fsync name=fsyncfile3,fd=1
    flowop closefile name=closefile3,fd=1
    flowop openfile name=openfile4,filesetname=bigfileset,fd=1
    flowop readwholefile name=readfile4,fd=1,iosize=1m
    flowop closefile name=closefile4,fd=1
  }
}
create fileset
system "sync"
system "echo 3 > /proc/sys/vm/drop_caches"
psrun -10 600
