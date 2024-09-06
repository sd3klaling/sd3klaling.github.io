#!/bin/bash

IFS=$'\n'
url="https://www.wattpad.com/$1-wn-part-1-hazure-waku-no-%E3%80%90joutai-ijou-sukiru%E3%80%91de"
page=""
content=""
temp=""
chap=0

#grep -Po '(\{"id(?=.{13}title)|(?<=\{"id":.{11})title)":"?\K[^,"]+' data.txt

function fetch(){
 temp=$(curl -L "$url$page" -H 'Cache-Control: no-cache')
}

function fetchAll(){
 fetch
 content=$(grep -oP '<p data-p-id.+</p>' <<< $temp)
 totalPages=$(grep -Po '"pages":\K\d+?' <<< $temp)
 echo "total pages : "$totalPages
 if [[ $totalPages -gt 1 ]]
 then
     temp=""
	 for ((i=2;i<=$totalPages;i++))
	 do
		 page="/page/$i"
		 fetch
		 hasil=$(grep -oP '<p data-p-id.+</p>' <<< $temp)
         content="${content} ${hasil}"
	 done
 fi
}
fetchAll
chap="$(grep -Po "(?<=\{\"id\":$1,\")title...\K\d+" <<< $temp | head -1)"

if [[ -z $content ]]
then
    echo "something seems wrong"
else
    echo $content > ../docs/novel/chapter$chap.html
fi