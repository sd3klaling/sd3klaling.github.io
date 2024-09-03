#!/bin/bash
num=$( ls | grep -Eo '[0-9]+' | sort -rn | head -n 1 )
numb=$(expr $num + 1)
for i in 1 2 3 4 5
do
	[[ $i != 1 ]] && page="/page/$i" || page=""
	curl "https://www.wattpad.com/959044866-wn-part-1-hazure-waku-no-%E3%80%90joutai-ijou-sukiru%E3%80%91de$page" | grep '<p data-p-id' >> "chapter$numb.html"
	echo 'step '$i
	echo $num
done
