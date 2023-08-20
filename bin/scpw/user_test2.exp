#!/usr/bin/expect -f

spawn su - test2
expect "Password:"
send "test2222\r"
expect "$ "
send "cd ~/\r"
expect "$ "
send "echo \"123456\" > file1\r"
expect "$ "
send "mkdir dir1\r"
expect "$ "
send "echo \"123456\" > dir1/file1_1\r"
expect "$ "
send "mkdir dir1/dir1_1\r"
expect "$ "
send "exit\r"
expect eof

