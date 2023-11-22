#!/bin/bash
echo "Welcome"
whoami
echo "by Butko Danil"
mydir='pwd'
cur=`pwd`
answer=""
while true
do
loctosave=`pwd`
echo "Wanna get some iso image? Y | y "
read answer
if [[ "$answer" == "y" ||  "$answer" == "Y" ]];then
	echo "Good, give me directory."
  while true
  do
  echo "Your location is "; pwd
  echo "you can get next one "; ls
  currntdir=`pwd`
  echo "write word \"stop\" if you choose dir write \"-\" to ho back"
  read mydir
  if [[ "$mydir" == "stop" ]]
  then
    echo "Write me name of CD"
        read cdname      
	if [ -e /var2/"$cdname".iso ]
        then
	 cdname="$cdname$(date +"%d%m%Y%H%M")"
	 echo "This name is exist, new name is $cdname"
	 genisoimage -o /var2/"$cdname".iso $currntdir
	 echo "Succses"
	 break	
         else 
         echo "not exist"
	 genisoimage -o /var2/"$cdname".iso $currntdir
	 echo "Succses"
	 break
         fi
  else
  cd "$mydir"
  fi
  done
else
exit
fi
done
