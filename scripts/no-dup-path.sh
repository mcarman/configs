#!/bin/zsh

# this script removes duplicat entries in
# the PATH. The last step removes the prepended colon. 
# see: https://www.linuxjournal.com/content/removing-duplicate-path-entries-reboot
# for a detailed discussion of the deduplication of PATH

set oe pipefail

printf "Removing duplicate PATH entries"
n= IFS=':'
for e in $IPATH
do
    [[ :$n == *:$e:* ]]  ||  n+=$e:
done
echo "${n:0: -1}"
