#!/bin/bash


#### This script works out which IBM CLOUD services are available
#### in the IBM CLOUD location of your choosing
####
#### Version 1.0
#### James Belton - IBM
 

clear

if [ $# -eq 1 ]
then
    echo $1
else
    echo "Usage is ./which-services <<name>> where name is the name of the region / zone / dc you are interested in "
    exit 1
fi


#### This line removes the existing files left over from the last run

rm services-list.txt
rm services-in-region.txt

#### THis line gets all the services in the market place and adds them to the services-list.txt file

ibmcloud catalog service-marketplace | cut -d" " -f1 > services-list.txt


#### This is the mail loop of the program
#### read in the service-list file a line at a time
#### see if the service exists in the desired place
#### by running the ibmcloud catalog-service CLI
#### into a variable and testing to see if the variable is null.


x=1

 paste -d@ services-list.txt | while IFS="@" read -r f1  
 do

my_var=`ibmcloud catalog service $f1 | grep $1`


if test -z "$my_var"
then
      echo "This service is not avaiable here......"

else

#### the my_var variable is not null, so lets write to a file
#### first some screen outpu and some formatting
#### then write the service name details and the services available
#### in the desired location out to services-in-region.txt file

  
 echo "Service IS available here.... adding to services-in-region.txt"
  

 echo " " >> services-in-region.txt
 echo "--------------------------------- " >> services-in-region.txt
 echo " " >> services-in-region.txt

 ibmcloud catalog service-marketplace | grep $f1 >> services-in-region.txt
 ibmcloud catalog service $f1 | grep $1 >> services-in-region.txt


fi

 x=$(( $x + 1 ))

 done

