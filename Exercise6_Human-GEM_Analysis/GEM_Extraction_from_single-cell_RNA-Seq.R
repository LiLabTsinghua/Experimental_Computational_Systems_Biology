## GEM Extraction from single-cell RNA-Seq data
# Single-cell RNA-Seq data is sparse, which means that samples (cells) contain 
# much fewer mRNA molecules than what is normally the case for bulk RNA-Seq 
# samples. It is therefore not recommended to generate context-specific models 
# per individual cell - it is necessary to pool the transcriptomes of many cells 
# gathered into a cell population to obtain a reliable gene expression profile. 
# The typical use case is to generate context-specific models for cell types, 
# where the transcriptomes of all cells classified as belonging to each type are 
# pooled into a single cell type profile.

# Install and load devtools:
install.packages("devtools")
library(devtools)

install_github("SysBioChalmers/DSAVE-R")
# install.packages("./path/to/DSAVE-R-master", repos = NULL, type = "source")

setwd("my/path") #replace with your own path where the exported data was saved

scData = readRDS("NKPopForTutorial.rds")

#Run DSAVE and plot it
varNK = DSAVEGetTotalVariationPoolSize(scData, upperBound = 50, lowerBound = 5e-1)
fig = DSAVEPlotTotalVariation(varNK, c("NK Cells"), bulkIndex = 4)
fig

#export the figure to file
ggsave(
  "DSAVE.png",
  plot = fig,
  width = 5, height = 5, dpi = 300)

# We conclude that we need at least somewhere between 1,500 to 2,000 cells to 
# get a similar variation as between bulk samples (the blue line) for this 
# population.


## Pool data
# To pool the data into a profile, we simply add up the counts/UMIs from all 
# cells in the population. We also convert the gene expression profile to counts 
# per million (CPM) as a preparation for use with ftINIT.

library(textTinyR)  # needed for rowSums to work with sparse matrices
genes = rownames(scData)
gexProfile = rowSums(scData)
toExport = tibble(genes = genes, NKCells = gexProfile)

# convert the data to CPM (counts per million, comparable to TPM)
toExport[[2]] = toExport[[2]]*10^6 / sum(toExport[[2]])

# always check that it worked
sum(toExport[[2]])  # 10^6
write_tsv(toExport, 'NKCells.txt')

# The text file can then be imported to MATLAB followed by generation of a 
# context-specific model by ftINIT in a similar way that was shown for the GTEx 
# data. In this case, prepHumanModelForftINIT must be run with gene symbol 
# conversion turned on (prepHumanModelForftINIT(model, true, ...)), since the 
# genes in this table are in the gene symbols format. For other models than 
# Human-GEM or animal models derived from that model, we recommend using the 
# function prepINITModel instead of prepHumanModelForftINIT. Furthermore, we 
# recommend to set the parameter skipScaling to true in such cases.

