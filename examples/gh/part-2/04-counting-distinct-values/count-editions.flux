//-------------------------------------
// Solution for Exercise 4a
//-------------------------------------

default in = FLUX_DIR + "bib-data.pica.gz";
default out = "stdout";

in
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "extract-editions.xml")
|stream-to-triples
|count-triples(countBy="object")
|write(out);
