# heatmap

# Prerequisites

* java
* [cegr-tools](https://github.com/seqcode/cegr-tools) (follow instructions to build)
* [TreeView](http://jtreeview.sourceforge.net/)
* [samtools](http://www.htslib.org/)

# Use

Converts BAM files to sorted CDT files. Heatmaps must be created manually using TreeView. Open a sorted CDT with TreeView. Settings > Pixel Settings. Set global X and Y to Fill. Set zero to white. Adjust contrast as needed. 

Note: the shell scripts check whether output files exist before running certain steps. So be sure to remove bad output and empty directories before re-running a script.

./make_cdts.sh [genome] [bam] [gff containing intervals of interest (e.g. TSSs)] [window_size (bp)] [directory where cegr-tools is installed]
example:
./make_cdts.sh hg19 ENCFF496YAE.bam ALL-RP-SAGA-TFIID-SUT-CUT-XUT_TSS-TES-MID_sortedby_geneLength.gff 4000 ~/git
