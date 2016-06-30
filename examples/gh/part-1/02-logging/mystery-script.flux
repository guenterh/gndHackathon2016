//-------------------------------------
// Solution for Exercise 2a
//-------------------------------------

// Find out what this script is doing.
// log-stream and log-object help you
// to look into the stream of data.

default in = FLUX_DIR + "input.foma.gz";
default out = FLUX_DIR + "output.txt.gz";

// Added loggers between all modules to find
// out what is happening in each step. That
// is what happens:
//   1. Lines containing the string "geburts"
//      are filtered
//   2. The lines are interpreted as Formeta
//      encoded data
//   3. The first Metamorph script splits the
//      name into firstname and lastname,
//      changes the date format, and makes the
//      first letter of the literal name 
//      upper-case
//   4. The second Metamorph script creates a
//      comma separated list of values from
//      each record
//   5. The encode-literals modules output the
//      value of the only literal created by
//      the previous Metamorph script
//   6. This line is append to the output file
 
in
|open-file
|as-lines
|log-object("Filtering: ")
|filter-strings("geburts", passMatches="false")
|log-object("Decoding: ")
|decode-formeta
|log-stream("Morphing 1: ")
|morph(FLUX_DIR + "mystery-morph-1.xml")
|log-stream("Morphing 2: ")
|morph(FLUX_DIR + "mystery-morph-2.xml")
|log-stream("Encoding: ")
|encode-literals
|log-object("Writing: ")
|write(out);
