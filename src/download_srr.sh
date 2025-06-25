fasterq-dump --split-files --skip-technical $1
pigz $1*fastq
