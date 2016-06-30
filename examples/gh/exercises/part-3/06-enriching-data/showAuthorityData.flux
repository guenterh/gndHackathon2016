

default in = FLUX_DIR + "authority-persons.pica.gz";

in |
open-file |
as-lines |
decode-pica |
encode-formeta(style="multiline") |
write("stdout");