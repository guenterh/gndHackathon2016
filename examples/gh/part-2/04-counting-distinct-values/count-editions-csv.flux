//-------------------------------------
// Solution for Exercise 4b
//-------------------------------------

default in = FLUX_DIR + "bib-data.pica.gz";
default out = FLUX_DIR + "edition-counts.txt";

in
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "extract-editions.xml")
|stream-to-triples
|count-triples(countBy="object")
|template("'${s}', ${o}")
|write(out);
