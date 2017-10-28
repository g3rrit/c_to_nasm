#! /bin/bash

a=$( echo $1 | sed "s/\.c//" ) #strip the file extension .c

#compile binary wiht minimal information
gcc -fno-asynchronous-unwind-tables -s -c ${a}.c

#convert the executable to nasm format
objconv/build/objconv -fnasm ${a}.o

#remove unnecesairy objconv information
sed -i "s/align=1//g ; s/[a-z]*execute//g ; s/: *function//g; /default *rel/d" ${a}.asm
#sed -i -e 's/align=1//g' -e 's/[a-z]*execute//g' -e 's/: *function//g' -e '/default *rel/d' -e 's/^main/_start/' -e 's/[ ]main[ ]*.*$/_start/' ${a}.asm
#-e 's/^main/_start/'

#run nasm for 64-bit binary

#nasm -f elf64 -o ${a}.asm
for i in *.asm; do nasm -f elf64 -o ${i::-4}'.obj' $i; done

#ld -m elf_x86_64 -s ${a}.o
gcc -o programm ${a}.obj

