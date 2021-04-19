#!/bin/sh


decompress ()
{
    while read line
    do
        if [ $line != "file.txt" ]
        then 
            xtrabackup --decompress --parallel=4 --target-dir=$dir$line
        fi       
    done < file.txt
}

prepare ()
{
    ref=""
    while read line
    do
        if [ $line != "file.txt" ]
        then
            if [ $(echo $line | head -c 1) == '0' ]
            then 
                xtrabackup --prepare --parallel=4 --apply-log-only --target-dir=$dir$line
                $ref=$dir$line
            else 
                xtrabackup --prepare --parallel=4 --apply-log-only --target-dir=$ref --incremental-dir=$dir$ref
            fi
        fi
    done < file.txt
}

restaure ()
{
    systemctl stop mysql
    rm -fr /var/lib/mysql/*
    xtrabackup --copy-back --parallel=4 --target-dir=$cd$first
    chown mysql:mysql /var/lib/mysql -R
    systemctl start mysql
}

cd /home/srv/Bureau/backup
ls > file.txt
dir="/home/srv/Bureau/backup/"
first = "0_increment"

decompress
prepare
restaure


rm file.txt