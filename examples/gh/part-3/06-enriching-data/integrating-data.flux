//-------------------------------------
// Solution for Exercise 6a
//-------------------------------------

default authoritydata = FLUX_DIR + "authority-persons.pica.gz";
default wikidata = FLUX_DIR + "wiki-persons.foma.gz";
default out = FLUX_DIR + "gnd-plus-wiki.foma";

// Convert the authority data into triples:

authoritydata
|open-file
|as-lines
|decode-pica
|stream-to-triples
|@X;

// Convert the data from wikipedia into
// triples using the gnd number as subject:

wikidata
|open-file
|as-lines
|decode-formeta
|morph(FLUX_DIR + "prepare-wikidata.xml")
|stream-to-triples(redirect="true")
|@X;

// Join both data streams based on 
// the subject:

@X
|wait-for-inputs("2")
|sort-triples(by="subject")
|collect-triples
|encode-formeta(style="multiline")
|write(out);
