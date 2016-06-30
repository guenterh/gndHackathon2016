//-------------------------------------
// Solution for Exercise 7a
//-------------------------------------

default authoritydata = FLUX_DIR + "authority-persons.pica.gz";
default bibdata = FLUX_DIR + "bib-data.pica.gz";
default out = "stdout";

// Read the authority data and create a short
// summaries (consisting only of the persons'
// names:

authoritydata
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "summarize-authority-persons.xml")
|stream-to-triples
|@X;

// Extract the author information from the
// bibliographic records. Count how often a
// author is referenced: 

bibdata
|open-file
|as-lines
|decode-pica
|morph(FLUX_DIR + "extract-authors.xml")
|stream-to-triples(redirect="true")
|count-triples(countBy="subject")
|@X;

// Combine the summaries of the authority
// data and the authorship counts:

@X
|wait-for-inputs("2")
|sort-triples(by="subject")
|collect-triples
|encode-formeta(style="verbose")
|write(out);
