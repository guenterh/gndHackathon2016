

default in = FLUX_DIR + "bib-data.pica.gz";
default out = "stdout";

in |
open-file |
as-lines |
decode-pica |
morph (FLUX_DIR + "countValues.xml") |
stream-to-triples |
//collect-triples |
count-triples (countby="object") |
sort-triples |
template("${s} \ttimes\t ${o}") |
write(out);