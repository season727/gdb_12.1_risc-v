# gdb_12.1_risc-v
Based on the gdc_12.1 source code, compile gdb and gdbserver using risc-v.



#编译工具链：Xuantie-900-gcc-linux-6.6.0-musl64-x86_64-V2.10.2-20240904



由于github文件大小限制，本仓库只释放了gdb/gdbserver的bin，以及依赖库libgmp。



a. 将目录中out目录的bin下的gdb/gdbserver，以及gdb-12.1/libgmp/usr/lib推到终端risc-v设备的usr/lib，设置PATH搜索路径，以及使用ln -s 命令建立软链接

#使用方式，以gdb的bin为例

#1 adb push gdb-12.1\out\bin\gdb   /tmp/

#2 chmod +x tmp/gdb

#3 export PATH=/tmp/:$PATH

#4 root@Linux:/usr/lib# ln -s  libgmp.so.10.4.1 libgmp.so

#5 root@Linux:/usr/lib# ln -s  libgmp.so.10.4.1 libgmp.so.10

#6 gdb path_to_exe

#7 (gdb)run

#8 bt



b. 开发者也可以自行下载gdb源码，并自行修改gdb-12.1中的build_gdb.sh编译脚本·文件，引用您自己的编译工具链以及修改CONFIGURE_ARGS编译参数，编译出您想要的gdb工具。
