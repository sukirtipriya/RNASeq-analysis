
# raw file to count matrix

#!/bin/bash

SECONDS = 0

# change working directory

cd /home/Desktop/RNASeq/

# run fastqc

fastqc data/raw.fastqc -o data/

# run trimmomatic to trim reads with poor quality

java -jar ~/Desktop/RNASeq/tools/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 4 data/raw.fastq data/raw_trimmed.fasq TRAILING:10 -phred33

echo"trimmomatic finished"

fasqc data/raw_trimmed.fastq -o data/

# run HISAT2

mkdir HISAT2

# get genome indices
# wget htts://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz

# run alignment

hisat2 -q --rna-strandness R -x HISAT@/grch38/genome -U data/raw_trimmed.fastq | samtools sort -o HISAT@/raw_trimmed.bam

# run featureCount - Quantification

# get gtf
# wget http://ftp.ensembl.org./pub/release-106/gtf/homo_sapiens.GRCH38.106.gtf.gz

featureCount -S 2 -a ../hg38/Homo_spiens.GRCH38.106.gtf -o quants/raw_featurecounts.txt HISAT2/raw_trimmed.bam

