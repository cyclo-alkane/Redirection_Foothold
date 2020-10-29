#!/bin/bash
read -p "Enter URL: " url
for i in {1..50}
do
if [[ $i -eq 1 ]] 
then
	new=`curl -I GET $url/start.php | grep -o "\w*.php"` 
	echo "$new"
	curl -X GET "$url/start.php" | grep -o "<h1>.*</h1>" >> pass.txt
else 
	curl -X  GET $url/$new | grep -o "<h1>.*</h1>" >> pass.txt
	new=`curl -I GET $url/$new | grep -o "\w*.php"`
	echo "$new"
fi
done
