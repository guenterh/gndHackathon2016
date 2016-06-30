//-------------------------------------
// Solution for exercise 1c
//-------------------------------------

// Specify the name of the input file in a variable 
// so that a different file name could be specified
// on the command line:
default in = FLUX_DIR + "bib-data.pica.gz";

// The output file name is specified in the same way
// as the input file name so that the name of the
// output file can be changed on the command line:
default out = FLUX_DIR +" bib-data.foma";

in
|open-file
|as-lines
|decode-pica
|encode-formeta(style="verbose")
|write(out);  // Write to the file name specifie in `out` instead of on "stdout"
