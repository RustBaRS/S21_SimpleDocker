#!/bin/bash
gcc hello.c -lfcgi -o mini_server
spawn-fcgi -p 8080 ./mini_server
service nginx start
/bin/bash