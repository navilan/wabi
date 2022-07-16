#! /bin/sh
rm -rf /tmp/alfredw
CDIR=$(dirname -- "$( readlink -f -- "$0"; )"; );
while IFS="" read -r p || [ -n "$p" ]
do
    gh release download -R $p -D /tmp/alfredw
done < "${CDIR}/workflows.txt"
for i in /tmp/alfredw/*.alfredworkflow; do
    open "$i";
    read -r p
done