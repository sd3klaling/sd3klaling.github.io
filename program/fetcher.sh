#!/bin/bash
set -e

IFS=$'\n'
url="https://www.wattpad.com/$1-wn-part-1-hazure-waku-no-%E3%80%90joutai-ijou-sukiru%E3%80%91de"
page=""
content=""
template='<!DOCTYPE html><head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head><html><body style="margin: 0;padding: 0;width: 100vw;font-size: 20px;"><div style="padding: 30px 25px;">'
temp=""
chap=0


function fetch(){
 temp=$(curl -L "$url$page" -H 'Cache-Control: no-cache')
}

function fetchAll(){
 fetch
 content="${content} $(grep -oP '<p data-p-id.+</p>' <<< $temp)"
 totalPages=$(grep -Po '"pages":\K\d+?' <<< $temp)
 
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
	content="$template $content </body></html>"
    echo $content > ../docs/novel/chapter${chap}.html
fi