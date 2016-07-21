indir = "/home/seb/temp/gnd";
outdir = "/home/seb/temp/csv4";

indir |
read-dir |
open-gzip |
decode-xml |
handle-marcxml |
filter(FLUX_DIR + "/filter.xml") |
morph(FLUX_DIR + "/gnd.xml") |
change-id("035number")|
encode-neo4j|
write-neo4j(csvDir=outdir, csvFileLength="5000000", batchWriteSize="500");
