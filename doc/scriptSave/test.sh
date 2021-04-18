#!/bin/sh

doFirstbackup ()
{
    #permet de créer la première sauvegarde ici une sauvegarde totale
    cd /home/srv/Bureau/backup
    newFile="0_increment"
    mkdir "$newFile"
    path="$newFile"
    xtrabackup --backup --target-dir=/home/srv/Bureau/backup/$path -u root --compress --compress-threads=4 --parallel=4
}

newIncrementalBackup ()
{
    #permet de réer une sauvegade incrémentielle qui prend en référence la sauvagarde précédente 
    cd /home/srv/Bureau/backup
    varbis=$((var-2))
    var1=$((var-1))
    newFile="_increment"
    ref=$varbis$newFile
    mkdir $var1$newFile
    path="$var1$newFile"    

    xtrabackup --backup --target-dir=/home/srv/Bureau/backup/$path --incremental-basedir=/home/srv/Bureau/backup/$ref -u root --compress --compress-threads=4 --parallel=4
}

externSave ()
{
    #Permet de copier la nouvelle sauvegarde sur un disque externe
    #scp avec un envoie ftp
    orgin="/home/srv/Bureau/backup"
    destination=""
    var1=$((var-1))
    file="_increment"
    cp "/home/srv/Bureau/backup"$var1$file $destination

}


cd /home/srv/Bureau/backup
ls > file.txt
var=0


while read line
do
   var=$((var+1))
done < file.txt


if [ $var = 1 ]
then
    doFirstbackup
else
    newIncrementalBackup
fi


rm file.txt

externSave