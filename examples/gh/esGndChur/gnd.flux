in = FLUX_DIR + "/gnd.records.indented.xml";
//in = FLUX_DIR + "/gnd.records.xml";

in |
open-file |
decode-xml |
handle-marcxml |
//filter(FLUX_DIR + "/filter.xml") |
morph(FLUX_DIR + "/gnd.xml") |
//encode-formeta(style="verbose") |
encode-json |
//change-id("gndid")|
//encode-neo4j|
//write-neo4j;
write("stdout");
