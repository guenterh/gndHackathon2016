//-------------------------------------
// Solution for exercise 1b
//-------------------------------------

// Specify the name of the input file in a variable 
// so that a different file name could be specified
// on the command line:
default in = FLUX_DIR + "bib-data.pica.gz";

in
|open-file
|as-lines
|decode-pica
|encode-formeta(style="verbose")  // Changed format from "multi-line" to "verbose" (a single 
                                  // line format with extra spacing for readability)
|write("stdout");
