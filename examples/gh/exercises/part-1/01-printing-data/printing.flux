

default in = FLUX_DIR + "bib-data.pica.gz";

in |
open-file |
as-lines |
decode-pica |
encode-formeta(style="multiline") |
write("stdout");

