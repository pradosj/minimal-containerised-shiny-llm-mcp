# minimal_mcp-app

A minimal shiny app implementing a LLM interface with access to a R session 
throught a MCP server.


# Usage

1) Start Ollama server

2) Start Docker deamon

```bash
# Build the containers
docker compose build

# Run the container
docker compose down
docker compose up -d

# Open web browser
open http://localhost:3839
```

