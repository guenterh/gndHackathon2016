//-------------------------------------
// Solution for Exercise 5a
//-------------------------------------

default in = FLUX_DIR + "authority-data.pica.gz";
default out = "stdout";

in
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "extract-dates.xml")
|stream-to-triples
|count-triples(countBy="object")
|template("${s}: ${o}")
|write(out);
