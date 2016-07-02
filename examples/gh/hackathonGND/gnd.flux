in = FLUX_DIR + "/gnd.records.xml";
out = "stdout";

in |
open-file |
decode-xml |
handle-marcxml |
filter(FLUX_DIR + "/filter.xml") |
morph(FLUX_DIR + "/gnd.xml") |
//encode-formeta (style="verbose") |
encode-formeta (style="multiline") |
write(out);