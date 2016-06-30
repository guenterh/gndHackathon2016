

default in = FLUX_DIR + "../04-counting-distinct-values/bib-data.pica.gz";
default out = FLUX_DIR + "generated.triples.txt";

in |
open-file |
as-lines |
decode-pica |
stream-to-triples |
template ("${s}, ${p}, ${o}") |
write(out);


