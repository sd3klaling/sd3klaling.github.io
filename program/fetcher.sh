#!/bin/bash

url="https://www.wattpad.com/$1-wn-part-1-hazure-waku-no-【joutai-ijou-sukiru】de"
page=""
content=""
temp=""
chap=0

#grep -Po '(\{"id(?=.{13}title)|(?<=\{"id":.{11})title)":"?\K[^,"]+' data.txt

function fetch(){
 temp=$(curl $url$page)
 
}

function fetchAll(){
 fetch
 content=$(grep -oP '<p data-p-id.+</p>' <<< $temp)
 totalPages=$(grep -Po '"pages":\K\d+?' <<< $temp)
 echo "total pages : "$totalPages
 if [[ $totalPages -gt 1 ]]
 then
	 for ((i=2;i<=$totalPages;i++))
	 do
		 page="/page/$i"
		 fetch
		 content="$content $(grep -oP '<p data-p-id.+</p>' <<< $temp)"
	 done
 fi
}
fetchAll
chap="$(grep -Po "(?<=\{\"id\":$1,\")title...\K\d+" <<< $temp | head -1)"
echo $content > "../docs/novel/chapter$chap.html"
