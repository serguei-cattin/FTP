#!/bin/bash
for ligne in `cat /home/pikadmin1/Téléchargements/Shell_Userlist.csv`
# comme on a pas de fichier csv on reprends celui de la semaine derniere en exemple
do
id=`echo ${ligne} | cut -d "," -f 1`
prenom=`echo ${ligne} | cut -d "," -f 2`
nom=`echo ${ligne} | cut -d "," -f 3`
mdp=`echo ${ligne} | cut -d "," -f 4`
role=`echo ${ligne} | cut -d "," -f 5`
mdpc=$(perl -e 'print crypt($ARGV[0], "salt")', $mdp)
sudo useradd -m -p $mdpc $prenom-$nom
if [[ "$role" =~ .*Admin.* ]]
then
sudo useradd $prenom-$nom sudo
sudo useradd $prenom-$nom adm
else
echo "fin"
fi
done
exit 0;
