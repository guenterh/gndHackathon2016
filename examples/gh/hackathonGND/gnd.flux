in = FLUX_DIR + "/gnd.records.xml";

in |
open-file |
decode-xml |
handle-marcxml |
filter(FLUX_DIR + "/filter.xml") |
morph(FLUX_DIR + "/gnd.xml") |
change-id("gndid")|
encode-neo4j|
write-neo4j;
