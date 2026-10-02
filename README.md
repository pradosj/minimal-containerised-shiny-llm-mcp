# minimal_mcp-app

A minimal containerized shiny app implementing a LLM interface with access to 
a R session through a MCP server. The R session has specialized Bioconductor 
package for single-cell transcriptomic data analysis.


# Usage

1) Start Ollama server

2) Start Docker deamon

3) Build the containers: `docker compose build`

4) Run the container: `docker compose up -d`

5) Open web browser on port 3839: `open http://localhost:3839`


