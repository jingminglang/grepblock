#!/bin/bash



# () {} [] ...
block=""
str=""
file=""
# string or filename
add=""

function is_file() {
    [ -f "$1" ]
}

function encode() {
   cat $1 | sed ":a;N;s/\n/\\\n/g;ta"   | sed -e "s/'/\\\x27/g"  -e "s#/#\\\/#g"
}

while getopts :a:b:s:f: name
do
    case $name in
	a)
	    add=$OPTARG
	    if $(is_file $add)
	    then 
		add=`encode $add`
	    fi
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
    s="sed  -n  '/"$str"/ {:c;N;H;s/[^"$block"]//g;:a;s/"$block"//g;ta;/^$/s/$/$/;tb;s/.*//g;x;bc;:b;g;s/^\n\+//g;p}' "$file
    eval $s
else
    s="sed  '/"$str"/ {:c;N;H;s/[^"$block"]//g;:a;s/"$block"//g;ta;/^$/s/$/$/;tb;s/.*//g;x;bc;:b;g;s/^\n\+//g;s/\(.*\)/\1\n"$add"\n/g}' "$file
    eval $s
fi

