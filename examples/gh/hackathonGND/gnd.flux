in = FLUX_DIR + "/gnd.records.xml";
out = "stdout";

in |
open-file |
decode-xml |
handle-marcxml |
morph(FLUX_DIR + "/gnd.xml") |
encode-formeta (style="verbose") |
write(out);