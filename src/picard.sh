picard -Xmx50g CleanSam INPUT=$1 OUTPUT=$2 TMP_DIR=$3
picard -Xmx50g  SortSam INPUT=$2 O=$4 SO=coordinate TMP_DIR=$3
picard -Xmx50g CollectMultipleMetrics TMP_DIR=$3 I=$4 O=$5 PROGRAM=CollectAlignmentSummaryMetrics PROGRAM=CollectInsertSizeMetrics PROGRAM=QualityScoreDistribution PROGRAM=MeanQualityByCycle
picard -Xmx80g AddOrReplaceReadGroups I=$4 O=$6 SORT_ORDER=coordinate RGID=1 RGLB=1 RGPL=illumina RGPU=unit1 RGSM=$7 RGCN=NYUAD
picard -Xmx50g BuildBamIndex I=$6 TMP_DIR=$3
picard -Xmx80g MarkDuplicates REMOVE_DUPLICATES=true M=$8_markDup_metrics_file.txt I=$6 O=$9 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=100 TMP_DIR=$3
picard -Xmx50g BuildBamIndex I=$9 TMP_DIR=$3
