
default in = FLUX_DIR + "wiki-persons.foma.gz";

in |
open-file |
as-lines |
decode-formeta |
encode-formeta(style="multiline") |
write("stdout");