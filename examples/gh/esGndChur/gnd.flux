in = FLUX_DIR + "/gnd.records.indented.xml";
//in = FLUX_DIR + "/gnd.records.xml";
out = FLUX_DIR + "/gnd.es.json";

in |
open-file |
decode-xml |
handle-marcxml |
morph(FLUX_DIR + "/gnd.xml") |
encode-json |
write(out);
