#!/bin/bash

#This code is to be used in businesscorp.com.br

site="$1"
ext="$2"

lynx --dump "https://google.com/search?&q=site:$site+ext:$ext" | grep ".$ext" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > result.txt


for url in $(cat result.txt);do wget -q $url;done

for sep in $(cat result.txt);do echo $sep | cut -d "/" -f5 >> result2.txt ;done

for meta in $(cat result2.txt);do exiftool $meta;done
