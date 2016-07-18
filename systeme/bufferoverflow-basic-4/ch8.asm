ebp saved :
ffffd1c8

vars :

env.home : ebp - 0x21c
env.username : ebp - 0x21c + 0x80 = ebp - 19c
env.shell : ebp - 0x21c + 0x100 = ebp - 11c
env.path : ebp - 0x21c + 0x180 = ebp - 9c
ptr : ebp - 0x1c

ebp : 0xbffff648

Dump of assembler code for function GetEnv:
   0x080484a4 <+0>:	push   ebp
   0x080484a5 <+1>:	mov    ebp,esp
   0x080484a7 <+3>:	push   edi
   0x080484a8 <+4>:	push   esi
   0x080484a9 <+5>:	push   ebx
   0x080484aa <+6>:	sub    esp,0x22c =556

#### HOME ####
   0x080484b0 <+12>:	mov    DWORD PTR [esp],0x80487f0 "HOME"
   0x080484b7 <+19>:	call   0x80483a0 <getenv@plt>
   0x080484bc <+24>:	mov    DWORD PTR [ebp-0x1c],eax
   0x080484bf <+27>:	cmp    DWORD PTR [ebp-0x1c],0x0
   0x080484c3 <+31>:	jne    0x80484dd <GetEnv+57>

   0x080484c5 <+33>:	mov    DWORD PTR [esp],0x80487f5
   0x080484cc <+40>:	call   0x80483b0 <puts@plt>
   0x080484d1 <+45>:	mov    DWORD PTR [esp],0x0
   0x080484d8 <+52>:	call   0x80483d0 <exit@plt>

   0x080484dd <+57>:	mov    eax,DWORD PTR [ebp-0x1c]
   0x080484e0 <+60>:	mov    DWORD PTR [esp+0x4],eax
   0x080484e4 <+64>:	lea    eax,[ebp-0x21c]
   0x080484ea <+70>:	mov    DWORD PTR [esp],eax
   0x080484ed <+73>:	call   0x8048390 <strcpy@plt>

#### USERNAME ####
   0x080484f2 <+78>:	mov    DWORD PTR [esp],0x804880a
   0x080484f9 <+85>:	call   0x80483a0 <getenv@plt>
   0x080484fe <+90>:	mov    DWORD PTR [ebp-0x1c],eax
   0x08048501 <+93>:	cmp    DWORD PTR [ebp-0x1c],0x0
   0x08048505 <+97>:	jne    0x804851f <GetEnv+123>

   0x08048507 <+99>:	mov    DWORD PTR [esp],0x8048813
   0x0804850e <+106>:	call   0x80483b0 <puts@plt>
   0x08048513 <+111>:	mov    DWORD PTR [esp],0x0
   0x0804851a <+118>:	call   0x80483d0 <exit@plt>

   0x0804851f <+123>:	mov    eax,DWORD PTR [ebp-0x1c]
   0x08048522 <+126>:	mov    DWORD PTR [esp+0x4],eax
   0x08048526 <+130>:	lea    eax,[ebp-0x21c]
   0x0804852c <+136>:	sub    eax,0xffffff80
   0x0804852f <+139>:	mov    DWORD PTR [esp],eax
   0x08048532 <+142>:	call   0x8048390 <strcpy@plt>

##### SHELL #####
   0x08048537 <+147>:	mov    DWORD PTR [esp],0x804882c
   0x0804853e <+154>:	call   0x80483a0 <getenv@plt>
   0x08048543 <+159>:	mov    DWORD PTR [ebp-0x1c],eax
   0x08048546 <+162>:	cmp    DWORD PTR [ebp-0x1c],0x0
   0x0804854a <+166>:	jne    0x8048564 <GetEnv+192>
   0x0804854c <+168>:	mov    DWORD PTR [esp],0x8048832
   0x08048553 <+175>:	call   0x80483b0 <puts@plt>
   0x08048558 <+180>:	mov    DWORD PTR [esp],0x0
   0x0804855f <+187>:	call   0x80483d0 <exit@plt>
   0x08048564 <+192>:	mov    eax,DWORD PTR [ebp-0x1c]
   0x08048567 <+195>:	mov    DWORD PTR [esp+0x4],eax
   0x0804856b <+199>:	lea    eax,[ebp-0x21c]
   0x08048571 <+205>:	add    eax,0x100
   0x08048576 <+210>:	mov    DWORD PTR [esp],eax
   0x08048579 <+213>:	call   0x8048390 <strcpy@plt>

#### PATH #####
   0x0804857e <+218>:	mov    DWORD PTR [esp],0x8048848
   0x08048585 <+225>:	call   0x80483a0 <getenv@plt>
   0x0804858a <+230>:	mov    DWORD PTR [ebp-0x1c],eax
   0x0804858d <+233>:	cmp    DWORD PTR [ebp-0x1c],0x0
   0x08048591 <+237>:	jne    0x80485ab <GetEnv+263>
   0x08048593 <+239>:	mov    DWORD PTR [esp],0x804884d
   0x0804859a <+246>:	call   0x80483b0 <puts@plt>
   0x0804859f <+251>:	mov    DWORD PTR [esp],0x0
   0x080485a6 <+258>:	call   0x80483d0 <exit@plt>
   0x080485ab <+263>:	mov    eax,DWORD PTR [ebp-0x1c]
   0x080485ae <+266>:	mov    DWORD PTR [esp+0x4],eax
   0x080485b2 <+270>:	lea    eax,[ebp-0x21c]
   0x080485b8 <+276>:	add    eax,0x180
   0x080485bd <+281>:	mov    DWORD PTR [esp],eax
   0x080485c0 <+284>:	call   0x8048390 <strcpy@plt>


##### RETURN #####
   memcpy : source edx/ecx, dest eax, size ebx
   eax : ret ptr

   0x080485c5 <+289>:	mov    eax,DWORD PTR [ebp+0x8]              # dst  = eax = *(ebp + 0x8)
   0x080485c8 <+292>:	lea    edx,[ebp-0x21c]                      # src  = edx = &env
   0x080485ce <+298>:	mov    ebx,0x200                            # size = ebx = sizeof(env)
   0x080485d3 <+303>:	mov    ecx,eax                              # ecx = eax = *(ebp + 0x8)

# alignement sur 1 octet
   0x080485d5 <+305>:	and    ecx,0x1
   0x080485d8 <+308>:	test   ecx,ecx
   0x080485da <+310>:	je     0x80485ea <GetEnv+326>               # goto if ecx pair
   0x080485dc <+312>:	movzx  ecx,BYTE PTR [edx]                   # ecx = src[0]
   0x080485df <+315>:	mov    BYTE PTR [eax],cl                    # *dst = ecx
   0x080485e1 <+317>:	add    eax,0x1                              # dst ++
   0x080485e4 <+320>:	add    edx,0x1                              # src ++
   0x080485e7 <+323>:	sub    ebx,0x1                              # size --

# alignement sur 2 octets
   0x080485ea <+326>:	mov    ecx,eax                              # ecx = dst_ptr
   0x080485ec <+328>:	and    ecx,0x2
   0x080485ef <+331>:	test   ecx,ecx
   0x080485f1 <+333>:	je     0x8048602 <GetEnv+350>               # si 4 | ecx
   0x080485f3 <+335>:	movzx  ecx,WORD PTR [edx]                   # cpy 2 bytes
   0x080485f6 <+338>:	mov    WORD PTR [eax],cx
   0x080485f9 <+341>:	add    eax,0x2
   0x080485fc <+344>:	add    edx,0x2
   0x080485ff <+347>:	sub    ebx,0x2

# copy brute force
   0x08048602 <+350>:	mov    ecx,ebx
   0x08048604 <+352>:	shr    ecx,0x2                              # ecx = size / 4
   0x08048607 <+355>:	mov    edi,eax                              # edi = dst
   0x08048609 <+357>:	mov    esi,edx                              # esi = src
   0x0804860b <+359>:	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]

# copy alignement fin
   0x0804860d <+361>:	mov    edx,esi                              # dst = dst = esi
   0x0804860f <+363>:	mov    eax,edi                              # src = edi ???
   0x08048611 <+365>:	mov    ecx,0x0                              # size = 0
   0x08048616 <+370>:	mov    esi,ebx                              # esi = old size
   0x08048618 <+372>:	and    esi,0x2
   0x0804861b <+375>:	test   esi,esi
   0x0804861d <+377>:	je     0x804862a <GetEnv+390>               # si 4 | old_size

   0x0804861f <+379>:	movzx  esi,WORD PTR [edx+ecx*1]
   0x08048623 <+383>:	mov    WORD PTR [eax+ecx*1],si
   0x08048627 <+387>:	add    ecx,0x2

   0x0804862a <+390>:	and    ebx,0x1
   0x0804862d <+393>:	test   ebx,ebx
   0x0804862f <+395>:	je     0x8048638 <GetEnv+404>
   0x08048631 <+397>:	movzx  edx,BYTE PTR [edx+ecx*1]
   0x08048635 <+401>:	mov    BYTE PTR [eax+ecx*1],dl

   0x08048638 <+404>:	mov    eax,DWORD PTR [ebp+0x8]              # return addr of copied env at ebp + 8
   0x0804863b <+407>:	add    esp,0x22c                            # leave
   0x08048641 <+413>:	pop    ebx
   0x08048642 <+414>:	pop    esi
   0x08048643 <+415>:	pop    edi
   0x08048644 <+416>:	pop    ebp                                  # leave part 2
   0x08048645 <+417>:	ret    0x4


End of assembler dump.
