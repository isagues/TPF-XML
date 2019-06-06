#!/bin/bash

java net.sf.saxon.Transform threshold=1000  -s:"../output.xml" -xsl:"creat_page.xsl"

exit 0
