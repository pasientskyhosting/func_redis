#!/bin/bash

#
# gen_doc.sh
#
# Author : Sergio Medina Toledo <lumasepa at gmail>
#
# This program is free software, distributed under the terms of
# the GNU General Public License Version 2. See the LICENSE file
# at the top of the source tree.

CMAKE_SOURCE_DIR=$1

ASTDATADIR="/var/lib/asterisk" # `cat /etc/asterisk/asterisk.conf | grep -v "^;" | grep astdatadir  | cut -d ">" -f2`

DOC_FILE="$ASTDATADIR/documentation/thirdparty/func_redis-en_US.xml"

echo "Building Documentation"
echo "Creating $DOC_FILE"

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > ${DOC_FILE}
echo "<!DOCTYPE docs SYSTEM \"appdocsxml.dtd\">" >> ${DOC_FILE}
echo "<docs xmlns:xi=\"http://www.w3.org/2001/XInclude\">" >> ${DOC_FILE}

echo "Extracting Documentation from func_redis.c"
awk -f ${CMAKE_SOURCE_DIR}/build_tools/get_documentation ${CMAKE_SOURCE_DIR}/src/func_redis.c >> ${DOC_FILE}

echo "</docs>" >> ${DOC_FILE}
