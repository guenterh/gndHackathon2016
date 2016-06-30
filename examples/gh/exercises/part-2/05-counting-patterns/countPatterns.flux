
default in = FLUX_DIR + "authority-data.pica.gz";

in |
open-file |
as-lines |
decode-pica |
morph (FLUX_DIR + "extractDateFormats.xml") |
stream-to-triples |
count-triples(countby="object") |
template("${s} ${o}") |
write("stdout");

