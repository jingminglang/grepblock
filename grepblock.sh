#!/bin/bash



# () {} [] ...

block=""
str=""
file=""
add=""

while getopts :a:b:s:f: name
do
    case $name in
	a)
	    add=$OPTARG
	    ;;
	b)
	    block=$OPTARG
	    ;;
	s)
	    str=$OPTARG
	    ;;
	f)
	    file=$OPTARG
	    ;;
	*)
	    ;;
    esac
done

if [ -z $add ]
then
    s="sed  -n  '/"$str"/ {:c;N;H;s/[^"$block"]//g;:a;s/"$block"//g;ta;/^$/s/$/$/;tb;s/.*//g;x;bc;:b;g;s/^\n\+//g;p;s/.*//g;h}' "$file
    eval $s
else
    s="sed  '/"$str"/ {:c;N;H;s/[^"$block"]//g;:a;s/"$block"//g;ta;/^$/s/$/$/;tb;s/.*//g;x;bc;:b;g;s/^\n\+//g;s/\(.*\)/\1\n"$add"\n/g}' "$file
    eval $s
fi
