
default inSigel = FLUX_DIR + "input/sigel.xml";

inSigel |
open-file |
decode-xml |
decode-pica |
morph(FLUX_DIR + "morph-sigel.xml")
encode-formeta |
write("stdout");