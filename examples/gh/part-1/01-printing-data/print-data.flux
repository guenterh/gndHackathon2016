//-------------------------------------
// Solution for exercise 1a
//-------------------------------------

// Specify the name of the input file in a variable 
// so that a different file name could be specified
// on the command line:
default in = FLUX_DIR + "bib-data.pica.gz";

in
|open-file
|as-lines
|decode-pica
|encode-formeta(style="multiline")
|write("stdout");
