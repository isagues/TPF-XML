#!/bin/bash
if [ $# -lt 1]
then
    echo "Invalid number of arguments"
    exit 1
fi

if [ $1 -lt 0 ]
then
    echo "Invalid value for threshold"
    exit 1
fi

java net.sf.saxon.Query SOquery.xq threshold=$1 > intermediate.xml

java dom.Writer -v -n -s -f intermediate.xml > /dev/null

java net.sf.saxon.Transform threshold=$1  -s:"./intermediate.xml" -xsl:"creat_page.xsl"

rm intermediate.xml

exit 0
