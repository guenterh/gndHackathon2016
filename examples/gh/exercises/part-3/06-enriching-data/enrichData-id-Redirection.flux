
default wiki = FLUX_DIR + "wiki-persons.foma.gz";
default authority = FLUX_DIR + "authority-persons.pica.gz";

wiki |
open-file |
as-lines |
decode-formeta |
morph(FLUX_DIR + "redirectWiki.xml") |
stream-to-triples (redirect="true") |
@x;


authority |
open-file |
as-lines |
decode-pica |
stream-to-triples |
@x;

@x |
wait-for-inputs("2") |
sort-triples(by="subject") |
collect-triples |
encode-formeta(style="multiline") |
write("stdout");



