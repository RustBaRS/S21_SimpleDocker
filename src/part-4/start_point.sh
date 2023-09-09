#!/bin/bash
gcc hello.c -lfcgi -o mini_server
service nginx start
spawn-fcgi -p 8080 ./mini_server
/bin/bash