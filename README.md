# minimal-containerised-shiny-llm-mcp

A minimal containerized shiny app implementing a LLM interface with access to 
a R session through a MCP server. The R session has specialized Bioconductor 
packages for single-cell transcriptomic data analysis. 

The single-cell transcriptomic dataset should be copied into folder `./data/`
so the R session running in the containerized environment can access it in
read-only mode.


# Usage

1) Start Ollama server

2) Start Docker deamon

3) Build the containers: `docker compose build`

4) Run the container: `docker compose up -d`

5) Open web browser on port 3839: `open http://localhost:3839`



# Detail

The app consists in a `mcpserver` and a `shiny` server running in containers 
that are defined in `docker/` subfolder.


## mcpserver

The `mcpserver` container is running the mcpserver and the R sessions that run 
the R code. Several Bioconductor packages useful for SingleCell transcriptomics 
are pre-installed in the container. Additional packages can be installed by 
updating file `docker/mcpserver/Dockerfile`

Furthermore, the folder `./data` is mounted in read only mode on the mcpserver 
at mount point `/app/data` so the R sessions can access input data.

Finally, the R tools served by the mcpserver are defined in `./mcpserver_tools.R`.
By default, only the tool `btw::btw_tool_run_r` is available and allow the 
client to evaluate any R code.


## shiny

The `shiny` container is running the shiny server and mostly contains graphical 
packages and package for web design.

The shiny app served by the server is implemented in folder `./shiny-app`.
The default app shows a LLM user interface connected to the mcpserver thanks to 
the configuration file `./shiny-app/mcptools.json`.




