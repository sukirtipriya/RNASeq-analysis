# RNASeq-analysis



RNA-Seq (named as an abbreviation of RNA sequencing) is a sequencing technique that uses next-generation sequencing (NGS) to reveal the presence and quantity of RNA in a biological sample, representing an aggregated snapshot of the cells' dynamic pool of RNAs, also known as transcriptome.

The analysis of RNA-seq count data using R. This includes reading the data into R, quality control and preprocessing, and performing differential expression analysis.

The workflow

    Quality Contol : Fastqc

    Quality Trimming: Trimmomatic

    Alignment: Tophat2 & Bowtie2

    DEGs : DESeq2 tool    


Required R/Bioconductor packages

    Rsamtools
    GenomicFeatures
    GenomicAlignments
    DESeq
