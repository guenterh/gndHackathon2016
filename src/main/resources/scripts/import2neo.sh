#!/bin/bash - 
#===============================================================================
#
#          FILE: import2neo.sh
# 
#         USAGE: ./import2neo.sh /path/to/csv/files /root/directory/of/embedded/neo4j/database
# 
#   DESCRIPTION: Helper script to index csv files created by gnd.flux workflow definition
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Sebastian Schüpbach, sebastian.schuepbach@unibas.ch
#  ORGANIZATION: Project Swissbib
#       CREATED: 02.07.2016 14:25
#      REVISION: 21.07.2016
#===============================================================================

# accoclabel transforms a list of filenames into a valid argument for neo4j-import, i.e.
# --nodes:LABEL1 nodefile1,nodefile2 --nodes:LABEL2 nodefile3,nodefile4 ... or
# --relationships:LABEL1 relafile1,relafile2 --relationships:LABEL2 relafile3, relafile4 ...
function assoclabel() {
	declare -A lbls # Declare makes variables defined in functions local
	csvtype=$1
	shift # Pop value of $1 so value of $1 is now the first filename which should be processed
	for f in $*
	do
		local lbl=$(expr $f : '\(.*\)_[0-9]\{4\}\.csv')
		if [[ ${lbls[$lbl]} ]]
		then
			lbls[$lbl]=${lbls[$lbl]},${f}
		else
			lbls[$lbl]=${f}
		fi
	done
	for i in "${!lbls[@]}"
	do
		local string="${string} ${csvtype}:${i} ${lbls[$i]}"
	done
	echo $string
}

cd ${1%/} # Go to csv directory

relafiles=$(ls | grep -e '^.\{9\}\.csv$') # Get all csv files containing relations
relastring=$(assoclabel "--relationships" $relafiles)

nodefiles=$(ls | grep -e '^.\{6\}\.csv$') # Get all csv files containing nodes
nodestring=$(assoclabel "--nodes" $nodefiles )

neo4j-import --into ${2%/}/gnd.db \
 --id-type string \
 $nodestring \
 $relastring \
 --skip-duplicate-nodes true \
 --ignore-empty-strings true \
 --skip-bad-relationships true \
 --bad-tolerance 100000 # You can expect some errors, so we should set a not too modest threshold
