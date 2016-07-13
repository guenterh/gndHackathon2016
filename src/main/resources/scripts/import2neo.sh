#!/bin/bash - 
#===============================================================================
#
#          FILE: import2neo.sh
# 
#         USAGE: ./import2neo.sh /path/to/csv/files /root/directory/of/embedded/neo4j/database
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Sebastian Schüpbach, sebastian.schuepbach@unibas.ch
#  ORGANIZATION: Project Swissbib
#       CREATED: 02.07.2016 14:25
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function joinArray { local IFS="$1"; shift; echo "$*"; }

csvdir=${1%/}
dbdir=${2%/}

rela=$(joinArray , $(ls $csvdir/*.csv | grep "-"))
nodes=$(joinArray , $(ls $csvdir/*.csv | grep -v "-"))

neo4j-import --into $dbdir/gnd.db --id-type string --nodes $(echo $nodes) --relationships:RELA $(echo $rela) --skip-duplicate-nodes true --ignore-empty-strings true
