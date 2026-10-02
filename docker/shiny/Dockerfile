FROM bioconductor/bioconductor_docker:RELEASE_3_23-R-4.6.1

# System packages
RUN apt-get update && apt-get install -y \
      jq \
    && rm -rf /var/cache/apt/* /var/lib/apt/lists/*;

# Rocker scripts
RUN /rocker_scripts/install_shiny_server.sh && /rocker_scripts/install_tidyverse.sh

# r-lib
RUN install2.r --error --skipinstalled --ncpus -1 \
  fs \
  rlang \
  ragg \
  optparse
  
# ggplot add-ons
RUN install2.r --error --skipinstalled --ncpus -1 \
  ggforce \
  ggridges \
  ggrepel \
  ggalluvial \
  patchwork

# reporting
RUN install2.r --error --skipinstalled --ncpus -1 \
  rmarkdown \
  flexdashboard \
  gt \
  reactable \
  DT \
  plotly

# web
RUN install2.r --error --skipinstalled --ncpus -1 \
  aos \
  bslib \
  shiny \
  shinycssloaders \
  websocket \
  httpuv \
  jsonlite \
  jqr

# Graph
RUN install2.r --error --skipinstalled --ncpus -1 \
  tidygraph \
  ggraph \
  igraph

# LLM
RUN install2.r --error --skipinstalled --ncpus -1 \
  shinychat \
  ellmer \
  mcptools \
  btw

# Bioconductor Single-Cell
RUN Rscript -e 'BiocManager::install(ask=FALSE, update=FALSE,c( \
  "DESeq2", \
  "GenomicRanges", \
  "SingleCellExperiment", \
  "scuttle", \
  "scater", \
  "scran", \
  "scDblFinder", \
  "HDF5Array" \
))'

RUN install2.r --error --skipinstalled --ncpus -1 \
  png


RUN sed -i 's/listen 3838;/listen 3838 0.0.0.0;/' /etc/shiny-server/shiny-server.conf

VOLUME /srv/shiny-server
WORKDIR /srv/shiny-server
EXPOSE 3838

CMD ["/usr/bin/shiny-server"]



  
  
  