# Why
This repository contains code and steps to reproduce a segmentation fault in the node [ODBC library](https://www.npmjs.com/package/odbc). 

# Steps
run the following command in this project to build the agent and start up a database to attempt to connect to.
```bash
git clone {URL}

cd odbcCrash

docker compose up -d
```
The agent container will continuously try to connect and crash due to a seg fault. 

## gdb Debugger
run the following command to run an interactive terminal. Once in the gdb debugger use the command `r` to run the application and dump the following logs. This log was generated on 11/14/2024 running `Docker version 27.3.1, build ce12230` under `Linux Mint 21.3`
```LOG
GNU gdb (Debian 13.1-3) 13.1
Copyright (C) 2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from node...
(gdb) r
Starting program: /usr/local/bin/node willCrash.js
warning: Error disabling address space randomization: Operation not permitted
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New Thread 0x7f5a6e0b06c0 (LWP 28)]
[New Thread 0x7f5a6d8af6c0 (LWP 29)]
[New Thread 0x7f5a6d0ae6c0 (LWP 30)]
[New Thread 0x7f5a6c8ad6c0 (LWP 31)]
[New Thread 0x7f5a67fff6c0 (LWP 32)]
[New Thread 0x7f5a6c00b6c0 (LWP 33)]
Connecting with connString: Driver={ODBC Driver 17 for SQL Server};Server=10.10.200.110,1433;Database=inven;Uid=sa;Pwd=d3v3l0p3r_7289;
[New Thread 0x7f5a476bd6c0 (LWP 34)]
[New Thread 0x7f5a46ebc6c0 (LWP 35)]
[New Thread 0x7f5a466bb6c0 (LWP 36)]
[New Thread 0x7f5a45eba6c0 (LWP 37)]

Thread 8 "node" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f5a476bd6c0 (LWP 34)]
0x0000000001a9141a in SSL_SESSION_free ()
```

# Legal stuff
This project exists solely to report an issue to the node-ODBC team it has no intended use outside of allowing for reproduction of this bug. Do not use this code for anything outside of debugging. 