#!/bin/bash



# () {} [] ...
block=$1
str=$2
file=$3


s="sed  -n  '/"$str"/ {:c;N;H;s/[^"$block"]//g;:a;s/"$block"//g;ta;/^$/s/$/$/;tb;s/.*//g;x;bc;:b;g;s/^\\\n\+//g;p;s/.*//g;h}' "$file

eval $s
