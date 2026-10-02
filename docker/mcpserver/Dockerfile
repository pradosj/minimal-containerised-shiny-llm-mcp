FROM bioconductor/bioconductor_docker:RELEASE_3_23-R-4.6.1

RUN install2.r --error --skipinstalled \
  fs \
  httpuv \
  jsonlite \
  rlang

RUN install2.r --error --skipinstalled \
  tidyverse \
  ggforce \
  ggridges \
  ggrepel \
  ggalluvial \
  patchwork

RUN install2.r --error --skipinstalled \
  tidygraph \
  ggraph
  
RUN install2.r --error --skipinstalled \
  tidymodels

RUN install2.r --error --skipinstalled \
  rmarkdown \
  gt \  
  plotly

RUN Rscript -e 'BiocManager::install(ask=FALSE, update=FALSE,c( \
	"DESeq2",\
	"GenomicRanges",\
	"SingleCellExperiment",\
	"scuttle",\
  "scater", \
  "scran", \
  "scDblFinder", \
  "HDF5Array" \
))'

RUN install2.r --error --skipinstalled \
  mcptools \
  btw


VOLUME /app/data
WORKDIR /app
CMD ["Rscript","-e","mcptools::mcp_server(tools='mcpserver_tools.R',type='http',port=8888,host='0.0.0.0',session_tools=FALSE)"]


