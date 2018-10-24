# heatmap

# Prerequisites

* java
* [cegr-tools](https://github.com/seqcode/cegr-tools) (follow instructions to build)
* [TreeView](http://jtreeview.sourceforge.net/)

# Use

Converts BAM files to sorted CDT files. Heatmaps must be created manually using TreeView. Open a sorted CDT with TreeView. Settings > Pixel Settings. Set global X and Y to Fill. Set zero to white. Adjust contrast as needed. 

Note: the shell scripts check whether output files exist before running certain steps. So be sure to remove bad output and empty directories before re-running a script.
