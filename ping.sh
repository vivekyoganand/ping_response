#!/bin/sh

url_list=./list_google.txt 
contador=0 
contadorerror=0
contadorsuccess=0

for siteurl in $(cat $url_list) 
do   
    echo "Check the ping stats $siteurl"
    if ping -c3 $siteurl
        then
            echo "---$siteurl SUCCESS---" &>> success.txt
            let contadorsuccess=contadorsuccess+1
        else
            echo "---$siteurl ERROR---" &>> error.txt
            let contadorerror=contadorerror+1          
    fi
    let contador=contador+1
done

echo "Total de urls : $contador"
echo "Total de urls SUCCESS: $contadorsuccess"
echo "Total de urls ERROR: $contadorerror"
echo "Servicio Terminado mira error.txt"
