# script to perform differential gene expression analysis using DESeq2 package.

library(DESeq2)
library(tidyverse)
library(airway)

count_data <- read.csv("count_data.csv")
head(counts_data)

colData <- read.csv("sample_info.csv")

all(colnames(counts_data) %in% rownames(colData))

all(colnames(counts_data) == rownames(colData))


dds<- DESeqDataSetFromMatrix(countData = count_data,
                             colData = colData,
                             design = ~dexamethasone)
                             

dds

keep <- rowSums(counts(dds)) >=10
dds <- dds[keep,]

dds

#set the factor level

dds$dexamethasone <- relevel(dds$dexamethasone, ref ="untreated")


# run DESeq2 

dds <- DESeq(dds)
res <- results(dds)

res

# explore results

summary(res)

res0.01 <- results(dds,alpha = 0.01)
summary(res0.01)


resultsNames(dds)

results(dds, contrast = c("dexamethasone","treated_4hrs","untreated"))

#plot MAplot

plotMA(res)

                            
