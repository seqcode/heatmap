set -e

GENOME=$1
BAM=$2
GFF=$3
WINDOW_SIZE=$4
CEGR_TOOLS_PATH=$5
HALF_WINDOW_SIZE=$(($4/2))

#download chrom sizes
if [ ! -e $GENOME.chrom.sizes ]
	then
		curl http://hgdownload.cse.ucsc.edu/goldenPath/$GENOME/bigZips/$GENOME.chrom.sizes -o $GENOME.chrom.sizes
fi

#index
if [ ! -e $BAM.bai ]
	then
		samtools index $BAM $BAM.bai
fi

#convert to tab
TAB_DIR=tab_files
mkdir -p $TAB_DIR
if [ ! -e $TAB_DIR/${BAM%.bam}.tab ]
	then
		java -jar $CEGR_TOOLS_PATH/cegr-tools/build/dist/BAMtoscIDX.jar -b $BAM -i $BAM.bai -o $TAB_DIR/${BAM%.bam}.tab
fi

#normalize
NORM_DIR=$TAB_DIR/Normalized_tab_files
if [ ! -d $NORM_DIR ]
	then
		python quantile_norm_singlebase_bin.py $TAB_DIR $GENOME.chrom.sizes
fi

#convert to CDT
CDT_DIR=CDT
if [ ! -d $CDT_DIR ]
	then
		python map_shifted_tags_to_ref.py -u $HALF_WINDOW_SIZE -d $HALF_WINDOW_SIZE -o $CDT_DIR $NORM_DIR $GFF
fi

#sort CDT
python sort_cdt_by_given_file.py -o 2 $CDT_DIR $GFF 
